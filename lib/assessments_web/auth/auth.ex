defmodule AssessmentsWeb.Auth do

  import Plug.Conn

  def login(conn, %Assessments.Accounts.User{} = user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def signed_in?(conn) do
    case conn.assigns.current_user do
      nil ->
        false
      %Assessments.Accounts.User{} ->
        true
    end

    # or:
    #
    # (conn.assigns.current_user || false) && true
    #
    # (%{} || false) && true  => true
    # (%{} || false) && false => false
    # (nil || false) && true  => false
  end
end
