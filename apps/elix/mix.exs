defmodule Elix.MixProject do
  use Mix.Project

  def project do
    [
      app: :elix,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:phoenix, "~> 1.7.9"},
      {:bamboo, "~> 2.2.0"},
      {:bamboo_smtp, "~> 4.2.2"},
      {:bamboo_phoenix, "~> 1.0.0"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "/test"]
  defp elixirc_paths(_), do: ["lib"]
end
