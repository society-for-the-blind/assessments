defmodule Assessments.Repo.MigrationHelpers do

  use Ecto.Migration

  defp make_enum_string(list) do
    list
    |> Enum.map(fn item -> "'#{item}'" end)
    |> Enum.join(",")
  end

  def make_enum_type(schema, type_name) do

    type_name_string = to_string(type_name)

    type_name_function = 
      type_name_string <> "_values"
      |> String.to_atom()

    enum_string =
      schema
      |> apply(type_name_function, [])
      |> make_enum_string()

    execute(
      """
      CREATE TYPE #{type_name_string}
        AS ENUM (#{enum_string})
      """,
      "DROP TYPE #{type_name_string}"
    )
  end
end
