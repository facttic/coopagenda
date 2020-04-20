defmodule CoopagendaWeb.ErrorView do
  use CoopagendaWeb, :view

  def render("401.json", _assigns) do
    %{title: "Unauthorized", code: 401}
  end

  def render("403.json", _assigns) do
    %{title: "Forbidden", code: 403}
  end

  def render("404.json", _assigns) do
    %{title: "Page not found", code: 404}
  end

  def render("422.json", _assigns) do
    %{title: "Unprocessable entity", code: 422}
  end

  def render("500.json", _assigns) do
    %{title: "Internal Server Error", code: 500}
  end

  def template_not_found(_template, _assigns) do
  end
end
