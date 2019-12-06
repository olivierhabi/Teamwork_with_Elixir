defmodule Teamwork.Router do
  use Teamwork.Web, :router

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

  scope "/", Teamwork do
    pipe_through :browser # Use the default browser stack

    # get "/", PageController, :index
    get "/", ArticleController, :index
    get "/articles/new", ArticleController, :new
    post "/articles", ArticleController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Teamwork do
  #   pipe_through :api
  # end
end
