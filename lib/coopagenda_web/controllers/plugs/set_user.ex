defmodule CoopagendaWeb.Plugs.SetUser do
  import Plug.Conn

  alias Coopagenda.Accounts

  def init(_params) do
  end

  def call(conn, _params) do
    case extract_token(conn) do
      {:ok, token} ->
        {:ok, claims} = Accounts.Guardian.decode_and_verify(token)
        assign(conn, :user, claims)
        IO.puts(claims)

      _ ->
        assign(conn, :user, nil)
    end
  end

  defp extract_token(conn) do
    case Plug.Conn.get_req_header(conn, "authorization") do
      [auth_header] -> get_token_from_header(auth_header)
      _ -> {:error, :missing_auth_header}
    end
  end

  defp get_token_from_header(auth_header) do
    {:ok, reg} = Regex.compile("Bearer\:?\s+(.*)$", "i")

    case Regex.run(reg, auth_header) do
      [_, match] -> {:ok, String.trim(match)}
      _ -> {:error, "token not found"}
    end
  end
end
