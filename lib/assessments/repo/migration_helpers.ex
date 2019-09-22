defmodule Assessments.Repo.MigrationHelpers do

  # TODO
  # On a  second thought, this is  probably an overkill.
  # Just make the enum  types in migration, with copying
  # the SQL command. More explicit, less assumptions.

  use Ecto.Migration

  defp make_enum_string(list) do
    list
    |> Enum.map(fn item -> "'#{item}'" end)
    |> Enum.join(",")
  end

  @doc """
  TODO
  This    function   assumes    that   there    is   a
  function  in  the  schema  file  with  the  name  of
  `(type_name)_values` that lists  the members of the
  enum.

  This module should either be a behaviour to at least
  make this  requirement more  explicit, or  just kill
  this module.
  """
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
