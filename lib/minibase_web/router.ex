defmodule MinibaseWeb.Router do
  use MinibaseWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  scope "/", MinibaseWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
  end
end
