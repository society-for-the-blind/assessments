defmodule AssessmentsWeb.PageController do
  use AssessmentsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
