defmodule Qweeter.History.Qweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "qweets" do
    field :content, :string
    field :date, :integer
    field :liked, :boolean, default: false
    field :status, Ecto.Enum, values: [:view, :edit, :del], defualt: :view

    timestamps()
  end

  @doc false
  def changeset(qweet, attrs) do
    qweet
    |> cast(attrs, [:content, :date, :liked, :status])
    |> validate_required([:content, :date])
  end
end
