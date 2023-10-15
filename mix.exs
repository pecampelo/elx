defmodule Elix.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      releases: [
        elix: [
          applications: [
            elix: :permanent
          ],
          validate_compile_env: false
        ]
      ],
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:credo, "~> 1.6.5", only: [:dev, :test], runtime: false},
    ]
  end

  defp aliases do
    [
      setup: ["cmd mix setup"],
      rebuild: ["mix deps.clean && mix deps.get && mix deps.compile"]
    ]
  end
end
