defmodule AssessmentsWeb.Auth.AuthorizeAdmin do

  import Plug.Conn
  import Phoenix.Controller
  alias AssessmentsWeb.Router.Helpers, as: Routes

  def init(opts), do: opts

  def call(conn, _opts) do

    if AssessmentsWeb.Auth.is_admin?(conn) do
      conn
    else
      conn
      |> put_flash(
           :error,
          "You need admin privileges to access that page"
         )
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
