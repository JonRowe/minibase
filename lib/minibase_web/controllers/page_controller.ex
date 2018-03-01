defmodule MinibaseWeb.PageController do
  use MinibaseWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
