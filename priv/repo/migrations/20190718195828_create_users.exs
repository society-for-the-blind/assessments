defmodule Assessments.Repo.Migrations.CreateUsers do

  use Ecto.Migration
  alias Assessments.Repo.MigrationHelpers

  @type_name :role

  def change do

    MigrationHelpers.make_enum_type(
      Assessments.Accounts.User,
      @type_name
    )

    create table(:users, primary_key: false) do

      add :id, :uuid, primary_key: true

      add :username, :string,    null: false
      add :role,     @type_name, null: false

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
