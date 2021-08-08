defmodule Qweeter.Repo do
  use Ecto.Repo,
    otp_app: :qweeter,
    adapter: Ecto.Adapters.Postgres
end
