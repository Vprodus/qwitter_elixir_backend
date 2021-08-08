defmodule Qweeter.HistoryTest do
  use Qweeter.DataCase

  alias Qweeter.History

  describe "qweets" do
    alias Qweeter.History.Qweet

    @valid_attrs %{content: "some content", date: 42}
    @update_attrs %{content: "some updated content", date: 43}
    @invalid_attrs %{content: nil, date: nil}

    def qweet_fixture(attrs \\ %{}) do
      {:ok, qweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> History.create_qweet()

      qweet
    end

    test "list_qweets/0 returns all qweets" do
      qweet = qweet_fixture()
      assert History.list_qweets() == [qweet]
    end

    test "get_qweet!/1 returns the qweet with given id" do
      qweet = qweet_fixture()
      assert History.get_qweet!(qweet.id) == qweet
    end

    test "create_qweet/1 with valid data creates a qweet" do
      assert {:ok, %Qweet{} = qweet} = History.create_qweet(@valid_attrs)
      assert qweet.content == "some content"
      assert qweet.date == 42
    end

    test "create_qweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = History.create_qweet(@invalid_attrs)
    end

    test "update_qweet/2 with valid data updates the qweet" do
      qweet = qweet_fixture()
      assert {:ok, %Qweet{} = qweet} = History.update_qweet(qweet, @update_attrs)
      assert qweet.content == "some updated content"
      assert qweet.date == 43
    end

    test "update_qweet/2 with invalid data returns error changeset" do
      qweet = qweet_fixture()
      assert {:error, %Ecto.Changeset{}} = History.update_qweet(qweet, @invalid_attrs)
      assert qweet == History.get_qweet!(qweet.id)
    end

    test "delete_qweet/1 deletes the qweet" do
      qweet = qweet_fixture()
      assert {:ok, %Qweet{}} = History.delete_qweet(qweet)
      assert_raise Ecto.NoResultsError, fn -> History.get_qweet!(qweet.id) end
    end

    test "change_qweet/1 returns a qweet changeset" do
      qweet = qweet_fixture()
      assert %Ecto.Changeset{} = History.change_qweet(qweet)
    end
  end
end
