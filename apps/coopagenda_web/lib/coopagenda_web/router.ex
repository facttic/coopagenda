defmodule CoopagendaWeb.Router do
  use CoopagendaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug CoopagendaWeb.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CoopagendaWeb do
    pipe_through :api

    resources "/slots", SlotController do
      resources "/proposals", ProposalController
    end
  end

  scope "/", CoopagendaWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end
end
