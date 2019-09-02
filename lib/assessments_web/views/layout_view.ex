defmodule AssessmentsWeb.LayoutView do
  use AssessmentsWeb, :view

  def user(conn) do
    conn.assigns.current_user
  end

  def username(conn) do
    user(conn).username

    # user && user.username || ""

    # nil   && _user    || "" => ""
    # %..{} && username || "" => username
  end

  def is_admin?(conn) do
    conn
    |> user()
    |> Assessments.Accounts.is_admin?()
  end
end
