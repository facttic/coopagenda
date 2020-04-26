defmodule CoopagendaWeb.AuthView do
  use CoopagendaWeb, :view

  def render("token.json", %{user: user, token: token}) do
    %{id: user.id,
      avatar: user.avatar,
      username: user.username,
      email: user.email,
      provider: user.provider,
      admin: user.admin,
      token: token}
  end
end
