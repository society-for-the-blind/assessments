defmodule Assessments.Repo.Migrations.CreateAssessments do

  use Ecto.Migration
  alias Assessments.Repo.MigrationHelpers

  @assessment_type   :assessment_type
  # @assessment_status :assessment_status

  @table_name :assessments

  def change do

    Enum.each(
      [
        @assessment_type,
        # @assessment_status,
      ],
      &MigrationHelpers.make_enum_type(
        Assessments.Accounts.Assessment,
        &1
      )
    )

    create table(@table_name, primary_key: false) do

      add :id, :uuid, primary_key: true

      add :client_name,          :string
      add :eye_condition,        :string
      add :assessment_date,      :date
      add :referring_agency,     :string
      add :counselor,            :string
      add :authorization_number, :string

      add :type,   @assessment_type
      # add :status, @assessment_status

      #has_many assessment_event

      add(
        :created_by,
        references(
          :users,
          type: :uuid
        ),
        null: false # NOTE 2019-08-31_0513
      )

      add(
        :assigned_to,
        references(
          :users,
          type: :uuid
        ),
        null: false # NOTE 2019-08-31_0513
      )

      timestamps()
    end

    create unique_index(@table_name, [:type, :authorization_number])
  end
end
