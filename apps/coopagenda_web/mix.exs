defmodule CoopagendaWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :coopagenda_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {CoopagendaWeb.Application, []},
      extra_applications: [:logger, :runtime_tools, :ueberauth, :ueberauth_github, :timex]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:floki, ">= 0.0.0", only: :test},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4.16"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_dashboard, github: "phoenixframework/phoenix_live_dashboard"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_pubsub, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:gettext, "~> 0.11"},
      {:coopagenda, in_umbrella: true},
      {:telemetry_metrics, ">= 0.0.0"},
      {:telemetry_poller, ">= 0.0.0"},
      {:timex, "~> 3.5"},
      {:ueberauth, "~> 0.6"},
      {:ueberauth_github, "~> 0.7"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
