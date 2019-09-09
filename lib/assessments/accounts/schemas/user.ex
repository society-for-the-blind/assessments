defmodule Assessments.Accounts.User do

  use Ecto.Schema
  import Ecto.Changeset

  alias Assessments.Accounts.{
    Credential,
    # DataSource,
    Assessment,
  }

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do

    field :username, :string
    field :role,     :string

    # has_many :data_sources, DataSource
    has_one :credential, Credential

    has_many(
      :own_assessments,
      Assessment,
      foreign_key: :created_by
    )

    has_many(
      :assigned_assessments,
      Assessment,
      foreign_key: :assigned_to
    )

    timestamps()
  end

  def changeset(
    %__MODULE__{} = user,
    %{} = attrs
  ) do

    fields =
      [
        :username,
        :role,
      ]

    user
    |> cast(attrs, fields)
    |> validate_required(fields)
    |> validate_length(:username, max: 27)
    |> unique_constraint(:username)

    |> validate_inclusion( :role, role_values())

    |> cast_assoc(:credential, required: true)
    # |> cast_assoc(:data_sources)
  end

  def role_values() do
    ~w(admin instructor)
  end
end
