defmodule CoopagendaWeb.AuthController do
  use CoopagendaWeb, :controller
  plug(Ueberauth)

  alias Coopagenda.Accounts

  def callback(%{assigns: %{ueberauth_failure: fails}} = conn, _params) do
    conn
    |> put_status(401)
    |> redirect(to: "#{System.get_env("FE_URL")}/welcome?error=#{fails}")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      username: auth.info.nickname,
      avatar: auth.info.image,
      email: auth.info.email,
      provider: Atom.to_string(auth.provider)
    }

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
        {:ok, token, _claims} = Accounts.Guardian.encode_and_sign(user)

        redirect_query =
          URI.encode_query(
            userId: user.id,
            token: token,
            username: user.username,
            admin: user.admin,
            userAvatar: user.avatar
          )

        conn
        |> redirect(external: "#{System.get_env("FE_URL")}/welcome?#{redirect_query}")

      {:error, reason} ->
        conn
        |> put_status(401)
        |> redirect(to: "/welcome?error=#{reason}")
    end
  end

  defp insert_or_update_user(user_params) do
    case Accounts.get_user_by_email(user_params.email) do
      nil ->
        Accounts.create_user(user_params)

      user ->
        Accounts.update_user(user, user_params)
    end
  end
end
