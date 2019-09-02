defmodule Assessments.Accounts.User do

  use Ecto.Schema
  import Ecto.Changeset

  alias Assessments.Accounts.{
    Credential,
    # DataSource,
  }

  @primary_key {:id, :binary_id, autogenerate: true}
  # @foreign_key_type :binary_id

  schema "users" do

    field :username, :string
    field :role,     :string

    # has_many :data_sources, DataSource
    has_one :credential, Credential

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

    |> validate_inclusion( :role, roles())

    |> cast_assoc(:credential, required: true)
    # |> cast_assoc(:data_sources)
  end

  def roles() do
    ~w(admin instructor)
  end
end
