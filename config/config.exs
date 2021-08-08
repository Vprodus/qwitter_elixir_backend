# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :qweeter,
  ecto_repos: [Qweeter.Repo]

config :cors_plug,
  origin: ["http://localhost:8080"],
  max_age: 86400,
  methods: ["GET", "POST"]

# Configures the endpoint
config :qweeter, QweeterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nNqU6HbPC7V78FeUBwpJhbi/ItJJHKR2eJ90b+RWt/hPnZX54FzQB8Um58UsxLGR",
  render_errors: [view: QweeterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Qweeter.PubSub,
  live_view: [signing_salt: "TurRZI22"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
