defmodule Assessments.Accounts.Auth do

  # TODO Does Auth belongs to the Accounts context?

  alias Assessments.Accounts

  # TODO
  # Clever and short again,  but not explicit. How would
  # this  be solved  in  Haskell  or Purescript?  (i.e.,
  # using category theory)
  def auth_by_username_and_passwd(username, given_passwd) do

    user =
      Accounts.get_user_by(username: username)
      |> Assessments.Repo.preload(:credential)

    password_verification =
      Argon2.verify_pass(
        given_passwd,
        user.credential.password_hash
      )

    cond do
      # if  user  exists, and  password is  correct,
      # return :ok
      user && password_verification ->
        {:ok, user}

      # If  the  user  exists,  but password  didn't
      # match, return :error
      user ->
        {:error, :unauthorized}

      # if  there  is  no existing  user  with  that
      # username, do a bogus calculation to  prevent
      # timing attacks
      true ->
        Argon2.no_user_verify()
        {:error, :not_found}
    end
  end
end
