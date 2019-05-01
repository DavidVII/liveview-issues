# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :select,
  ecto_repos: [Select.Repo]

# Configures the endpoint
config :select, SelectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JShw1v+v7/YMXIMQx+wU1cIbgeFoEkuc4YDwCO0dXM1qzXkOvO8vj7OQx0z2Lfms",
  render_errors: [view: SelectWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Select.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :select, SelectWeb.Endpoint,
  live_view: [
    signing_salt: "BaCuNO7q0DJjOXGaQ6bEZsc45Sp+6LpI"
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
