# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :coopagenda,
  ecto_repos: [Coopagenda.Repo]

config :coopagenda_web,
  ecto_repos: [HelloReact.Repo],
  generators: [context_app: :coopagenda]

# Configures the endpoint
config :coopagenda_web, CoopagendaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cm6+1FkX19z2bc76P8Bmr6IYgvkuvOOsYRxODnZgd+gPrNPK3Ru/GIgKApmrRkOP",
  render_errors: [view: CoopagendaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Coopagenda.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "9XsLOU03HtWh+V3YmBvLQWqObf9RqHVj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [default_scope: "user"] }
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")
