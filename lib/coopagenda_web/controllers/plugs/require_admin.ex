defmodule CoopagendaWeb.Plugs.RequireAdmin do
  import Plug.Conn
  import Phoenix.Controller

  alias CoopagendaWeb.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:user] != nil and conn.assigns[:user].admin do
      conn
    else
      conn
      |> put_flash(:error, "You must be an admin")
      |> redirect(to: Helpers.slot_path(conn, :index))
      |> halt()
    end
  end
end
