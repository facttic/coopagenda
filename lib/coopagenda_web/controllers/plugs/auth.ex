defmodule CoopagendaWeb.Plugs.Auth do
  def require_admin(conn, _params) do
    if conn.assigns[:user] != nil and conn.assigns[:user].admin do
      conn
    else
      conn
    end
  end

  def require_auth(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
    end
  end
end
