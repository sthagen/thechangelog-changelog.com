defmodule Changelog.Mixfile do
  use Mix.Project

  def project do
    [
      app: :changelog,
      version: System.get_env("APP_VERSION", "0.0.1"),
      elixir: "~> 1.18",
      elixirc_paths: elixirc_paths(Mix.env()),
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
      mod: {Changelog.Application, []},
      extra_applications: [:logger, :runtime_tools]
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
      {:phoenix, "~> 1.7.11"},
      {:phoenix_view, "~> 2.0"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.10"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 4.2"},
      {:phoenix_html_helpers, "~> 1.0"},
      {:phoenix_live_view, "~> 1.0.3"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:plug_cowboy, "~> 2.5"},
      {:oban, "~> 2.19"},
      {:oban_web, "~> 2.11"},
      {:timex, "~> 3.0"},
      {:scrivener_ecto, "~> 3.0"},
      {:cmark, "~> 0.6"},
      {:floki, "~> 0.36"},
      {:waffle_ecto, "~> 0.0"},
      {:ecto_enum, "~> 1.0"},
      {:hashids, "~> 2.0"},
      {:swoosh, "~> 1.16"},
      {:premailex, "~> 0.3.20"},
      {:gen_smtp, "~> 1.0"},
      {:httpoison, "~> 2.2.1", override: true},
      # pinned to 1.21 until https://github.com/benoitc/hackney/issues/766 closes
      {:hackney, "1.21.0"},
      {:jason, "~> 1.0"},
      {:con_cache, "~> 1.1.1"},
      {:ex_aws, "~> 2.2"},
      {:ex_aws_s3, "~> 2.3"},
      {:nimble_csv, "~> 1.2.0"},
      {:sweet_xml, "~> 0.6"},
      {:oauth, github: "tim/erlang-oauth"},
      {:ueberauth, "~> 0.10"},
      {:ueberauth_github, "~> 0.4"},
      {:ex_machina, "~> 2.0"},
      {:sentry, "~> 10.1"},
      {:html_entities, "~> 0.3"},
      {:tzdata, "~> 1.1.0"},
      {:icalendar, "~> 1.0"},
      # TODO: find replacement for dead https://github.com/nsweeting/shopify
      {:shopify, "~> 0.4", github: "ankhers/shopify", branch: "otp24_upgrade"},
      {:stripity_stripe, "~> 3.2"},
      {:id3vx, "~> 0.0.1-rc6"},
      {:xml_builder, "~> 2.1"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:mock, "~> 0.3.0", only: :test},
      {:opentelemetry_exporter, "~> 1.0"},
      {:opentelemetry, "~> 1.0"},
      {:opentelemetry_api, "~> 1.0"},
      {:opentelemetry_cowboy, "~> 1.0"},
      {:opentelemetry_ecto, "~> 1.0"},
      {:opentelemetry_oban, "~> 1.0"},
      {:opentelemetry_phoenix, "~> 2.0"},
      # only necessary until https://github.com/open-telemetry/opentelemetry-erlang-contrib/issues/428 closes
      {:opentelemetry_semantic_conventions, "~> 1.27", override: true}
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
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
