defmodule AssessmentsWeb.Router do
  use AssessmentsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AssessmentsWeb.Auth.AssignCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AssessmentsWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources(
      "/sessions",
      SessionController,
      only: [:new, :create, :delete],
      singleton: true
    )
  end

  # Other scopes may use custom stacks.
  # scope "/api", AssessmentsWeb do
  #   pipe_through :api
  # end
end
