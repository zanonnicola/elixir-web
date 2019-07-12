defmodule ElixirWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_web,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :poison],
      mod: {ElixirWeb.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug_cowboy, "~> 1.0"},
      {:plug, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:telemetry, "~> 0.4.0"}
    ]
  end
end
