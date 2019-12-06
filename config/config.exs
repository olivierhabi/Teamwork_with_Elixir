# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :teamwork,
  ecto_repos: [Teamwork.Repo]

# Configures the endpoint
config :teamwork, Teamwork.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0ubgcPGnTpMUIAGBvoORuKBOH9Y8wTpXxcl+aPAeuD+m1IND+QBr7q3ph+e85x0s",
  render_errors: [view: Teamwork.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Teamwork.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
