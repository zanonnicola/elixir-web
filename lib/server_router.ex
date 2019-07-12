defmodule ElixirWeb.Router do
  use Plug.Router

  if Mix.env() == :dev do
    use Plug.Debugger
  end

  use Plug.ErrorHandler
  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(Plug.Telemetry, event_prefix: [:my, :plug])
  plug(:dispatch)

  get "ping" do
    send_resp(conn, 200, "pong")
  end

  post "/post" do
    {:ok, body, conn} = read_body(conn)

    # body = Poison.decode!(body)

    # stringToHash = get_in(body, ["payload"])
    hashedString = :crypto.hash(:md5, body) |> Base.encode16(case: :lower)

    # will print the body variable to the console. This will be useful in testing/debugging the server.
    # IO.inspect(body)

    send_resp(conn, 201, hashedString)
  end

  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    send_resp(conn, conn.status, "Something went wrong")
  end

  # "Default" route that will get called when no other route is matched

  match _ do
    send_resp(conn, 404, "not found")
  end
end
