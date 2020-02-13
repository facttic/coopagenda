defmodule CoopagendaWeb.AuthController do
  use CoopagendaWeb, :controller

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: Atom.to_string(auth.provider)}
    IO.inspect user_params
    # changeset = User.changeset(%User{}, user_params)

    # signin(conn, changeset)
    conn
  end
end
