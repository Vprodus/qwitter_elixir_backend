defmodule Qweeter.Repo.Migrations.CreateQweets do
  use Ecto.Migration

  def change do
    create table(:qweets) do
      add :content, :string
      add :date, :bigint
      add :liked, :boolean
      add :status, :string

      timestamps()
    end

  end
end
