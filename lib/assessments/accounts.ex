defmodule Assessments.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, only: [from: 2]

  alias Assessments.Accounts.User
  alias Assessments.Repo

  @user_roles User.roles()

  def list_users do
    Repo.all(User)
  end

  def list_users_by_role(role)
    when not(role in @user_roles)
  do
    {:error, "#{role} role does not exist"}
  end

  def list_users_by_role(role) do
    {:ok, list_users_by_role!(role)}
  end

  def list_users_by_role!(role) do
    query = from u in User,
      where: u.role == ^role

    Repo.all(query)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def delete_user(id) do
    id
    |> get_user()
    |> Repo.delete()
  end

  def delete_user!(id) do
    id
    |> get_user!()
    |> Repo.delete!()
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  def get_roles() do
    @user_roles
  end

  def is_admin?(user) do
    user.role == "admin"
  end

  # Needed to render forms (until moving to a frontend framework?)
  # no args are really needed, because called with empty User struct and empty map
  def change_registration(user \\ %User{}, params)
  def change_registration(%User{} = user, %{} = params) do
    User.changeset(user, params)
  end

  def register_user(params) do
    change_registration(params) |> Repo.insert()
  end
end
