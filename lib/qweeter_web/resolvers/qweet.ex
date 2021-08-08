defmodule QweeterWeb.Resolvers.Qweet do
  alias Qweeter.History

  def get_qweets(_, _ , _) do
    {:ok, History.list_qweets()}
  end

  def create_qweet(_, params, _) do
    case History.create_qweet(params) do
      {:error, _} ->
        {:error, "Could not create qweet"}
      {:ok, _qweet} = success ->
        # publish_qweet_change(qweet)
        success
    end
  end


  def toggle_liked(_, %{id: id}, _) do
    qweet = History.get_qweet!(id)
    History.toggle_liked(qweet)
  end

  def delete_qweet(_, %{id: id}, _) do
    qweet = History.get_qweet!(id)
    History.delete_qweet(qweet)
  end

  # defp publish_qweet_change(qweet) do
  #     Absinthe.Subscription.publish(QweeterWeb.Endpoint, qweet, new_qweets: "*")
  # end
end
