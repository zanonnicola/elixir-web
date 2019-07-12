defmodule ElixirWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  # Run the server: iex -S mix
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(
        scheme: :http,
        plug: ElixirWeb.Router,
        options: [
          port: Application.get_env(:closeconnection, :port)
        ]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
