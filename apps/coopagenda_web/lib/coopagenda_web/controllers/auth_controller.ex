defmodule CoopagendaWeb.AuthController do
  use CoopagendaWeb, :controller
  plug Ueberauth

  alias Coopagenda.Accounts

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{avatar: auth.info.image, email: auth.info.email, provider: Atom.to_string(auth.provider)}

    signin(conn, user_params)
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.slot_path(conn, :index))
  end

  defp signin(conn, user_params) do
    case insert_or_update_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.slot_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.slot_path(conn, :index))
    end
  end

  defp insert_or_update_user(user_params) do
    case Accounts.get_user_by_email(user_params.email) do
      nil ->
        Accounts.create_user(user_params)
      user ->
        {:ok, user}
    end
  end
end
