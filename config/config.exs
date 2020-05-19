# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :coopagenda,
  ecto_repos: [Coopagenda.Repo]

# Configures the endpoint
config :coopagenda, CoopagendaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z9idv0yfEl0Vk3qqBSK7UZVdYy6R4jzpBNuoKv6G/VtXVwYMij3bmF8OIjjLMOKe",
  render_errors: [view: CoopagendaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Coopagenda.PubSub,
  live_view: [signing_salt: "Xn2270yS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

config :coopagenda, Coopagenda.Accounts.Guardian,
  issuer: "coopagenda",
  secret_key: "IleUlDrRYUsgmaieUFRW7Bk1df8YwIxswfOhTwwsTXly6g36w+wFQedFC7fevx8M"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
