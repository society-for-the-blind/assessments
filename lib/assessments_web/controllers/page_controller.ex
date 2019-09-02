defmodule AssessmentsWeb.PageController do
  use AssessmentsWeb, :controller

  def index(conn, _params) do

    user = conn.assigns.current_user

    render(
      conn,
      "index.html",
      # ads: ads,
      user: user
    )
  end
end
