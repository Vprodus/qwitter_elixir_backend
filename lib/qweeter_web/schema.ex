defmodule QweeterWeb.Schema do
  use Absinthe.Schema

  # alias Qweeter.{History, Repo}
  alias QweeterWeb.Resolvers

  query do
    @desc "The list of available qweets"
    field :qweets, list_of(:qweet) do
      resolve &Resolvers.Qweet.get_qweets/3
    end

  end

  mutation do
    @desc "Create qweet"
    field :create_qweet, :qweet do
      arg :content, :string
      arg :date, :integer
      resolve &Resolvers.Qweet.create_qweet/3
    end
    @desc "Delete qweet"
    field :delete_qweet, :qweet do
      arg :id, non_null(:id)
      resolve &Resolvers.Qweet.delete_qweet/3
    end
    @desc "toggle liked"
    field :toggle_liked, :qweet do
      arg :id, non_null(:id)
      resolve &Resolvers.Qweet.toggle_liked/3
    end
  end

  subscription do
    field :qweet_change, :qweet do

      config fn _args, _info ->
        {:ok, topic: "*"}
      end

      trigger [:delete_qweet, :toggle_liked, :create_qweet], topic: fn
        %{id: _qweet} -> ["*"]
        _ -> []
        end
    end
  end

  object :qweet do
    field :id, :id
    field :content, :string
    field :date, :float
    field :liked, :boolean
    field :status, :string
  end


end
