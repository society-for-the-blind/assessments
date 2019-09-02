defmodule AssessmentsWeb.Auth.AssignCurrentUser do

  import Plug.Conn

  def init(opts), do: opts

  # TODO Clever and short, but make it explicit.
  def call(conn, _opts) do

    # Is there a user ID present in the session?
    user_id = get_session(conn, :user_id)

    # Does the present user  ID have a corresponding entry
    # in the backend?
    user = user_id && Assessments.Accounts.get_user(user_id)

    assign(conn, :current_user, user)
  end
end
