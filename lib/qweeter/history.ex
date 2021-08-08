defmodule Qweeter.History do
  @moduledoc """
  The History context.
  """

  import Ecto.Query, warn: false
  alias Qweeter.Repo

  alias Qweeter.History.Qweet

  @doc """
  Returns the list of qweets.

  ## Examples

      iex> list_qweets()
      [%Qweet{}, ...]

  """
  def list_qweets do
    query = from q in Qweet, where: q.status != :del, order_by: [desc: q.date]
    Repo.all(query)
  end

  @doc """
  Gets a single qweet.

  Raises `Ecto.NoResultsError` if the Qweet does not exist.

  ## Examples

      iex> get_qweet!(123)
      %Qweet{}

      iex> get_qweet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_qweet!(id), do: Repo.get!(Qweet, id)

  @doc """
  Creates a qweet.

  ## Examples

      iex> create_qweet(%{field: value})
      {:ok, %Qweet{}}

      iex> create_qweet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_qweet(attrs \\ %{}) do
    attrs = Map.put(attrs, :status, :view)
    %Qweet{}
    |> Qweet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a qweet.

  ## Examples

      iex> update_qweet(qweet, %{field: new_value})
      {:ok, %Qweet{}}

      iex> update_qweet(qweet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_qweet(%Qweet{} = qweet, attrs) do
    qweet
    |> Qweet.changeset(attrs)
    |> Repo.update()
  end

  def toggle_liked(%Qweet{} = qweet) do
    update_qweet(qweet, %{liked: !qweet.liked})

    # Repo.update(Ecto.Changeset.change(qweet, liked: !qweet.liked))
  end
  @doc """
  Deletes a qweet.

  ## Examples

      iex> delete_qweet(qweet)
      {:ok, %Qweet{}}

      iex> delete_qweet(qweet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_qweet(%Qweet{} = qweet) do
    update_qweet(qweet, %{status: :del})
    # Repo.delete(qweet)
    # Repo.update(Ecto.Changeset.change(qweet, status: :del))
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking qweet changes.

  ## Examples

      iex> change_qweet(qweet)
      %Ecto.Changeset{data: %Qweet{}}

  """
  def change_qweet(%Qweet{} = qweet, attrs \\ %{}) do
    Qweet.changeset(qweet, attrs)
  end
end
