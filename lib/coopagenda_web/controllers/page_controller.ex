defmodule CoopagendaWeb.PageController do
  use CoopagendaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
