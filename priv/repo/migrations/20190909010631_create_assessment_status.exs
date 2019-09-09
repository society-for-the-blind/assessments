defmodule Assessments.Repo.Migrations.CreateAssessmentEvent do

  # TODO
  #   consider    using   commanded/eventstore   and
  # commanded-ecto-projections

  use Ecto.Migration
  alias Assessments.MigrationHelpers

  @table_name :assessment_event

  def change do

#     Utility.make_enum_type(
#       Assessments.Accounts.AssessmentEvent,
#       @table_name
#     )

#     # The plural  of "status" is "status"  as well, hence
#     # this unfortunate naming situation.

#     # TODO: use  algebraic data  types, then  it
#     #       would be  just a  sum of  types that
#     #       self-check

#     # + `new`:

#     #   ```elixir
#     #   %{
#     #     status: "new",
#     #     date: date
#     #     meta: %{
#     #       created_by: user_map_snapshot,
#     #       assigned_to: user_map_snapshot,
#     #     }
#     #   }
#     #   ```

#     # "assigned"  and  "unassigned" may  seem  superfluous
#     # and/or   redundant   (why   not   just   check   the
#     # assignee/instructor field?), but checking the status
#     # field will just yield that information.
#     create table(@table_name, primary_key: false) do

#       add :id, :uuid, primary_key: true

#       add :event, @table_name
#       add :meta,  :map

#       timestamps()
    # end

    # create unique_index(@table_name, [:event])
  end
end
