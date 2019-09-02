defmodule AssessmentsWeb.SessionController do
  use AssessmentsWeb, :controller

  # login
  def new(conn, _) do
    render(conn, "new.html")
  end

  # post login form
  def create(
    conn,
    %{
      "session" =>
        %{
          "username" => username,
          "password" => passwd
        }
    }
  ) do

    do_login = 
      Assessments.Accounts.Auth.auth_by_username_and_passwd(
        username,
        passwd
      )

    case do_login do
      {:ok, user} ->
        conn
        |> AssessmentsWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid credentials")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> AssessmentsWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
