defmodule Assessments.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  @type_name "role"
  @table_name :users

  def up do

    execute(
      """
      CREATE TYPE #{@type_name}
        AS ENUM (#{sql_string()})
      """
    )

    create table(@table_name, primary_key: false) do

      add :id, :uuid, primary_key: true

      add :username, :string,          null: false
      add :role,     :"#{@type_name}", null: false

      timestamps()
    end

    create unique_index(:users, [:username])
  end

  def down do
    drop table(@table_name)
    execute("DROP TYPE #{@type_name}")
  end

  defp sql_string() do
    Assessments.Accounts.User.roles()
    |> Enum.map(fn role -> "'#{role}'" end)
    |> Enum.join(",")
  end
end
