defmodule CoopagendaWeb.Router do
  use CoopagendaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CoopagendaWeb do
    pipe_through :browser

    resources "/proposals", ProposalController
    resources "/topics", TopicController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CoopagendaWeb do
  #   pipe_through :api
  # end
end
