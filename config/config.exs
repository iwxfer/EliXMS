# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cru,
  ecto_repos: [Cru.Repo]

# Configures the endpoint
config :cru, Cru.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JDv/R0nv8HILFCoP5YuVOF7u0mPyPJWqJWQ+uZx10KBITbdBw3nMMbX63tHMszyz",
  render_errors: [view: Cru.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cru.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
