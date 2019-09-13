defmodule Assessments.Repo.Migrations.CreateISPs do

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
        Assessments.ISPs.ISP,
        &1
      )
    )

    create table(@table_name, primary_key: false) do

      add :id, :uuid, primary_key: true

      add :client_name,          :string, null: false
      add :eye_condition,        :string
      add :assessment_date,      :date
      add :referring_agency,     :string
      add :counselor,            :string
      add :authorization_number, :string

      add :type,   @assessment_type, null: false
      # add :status, @assessment_status

      #has_many assessment_event

      # proof that this should work:
      # https://stackoverflow.com/questions/7815018/postgres-two-foreign-keys-to-same-primary-key-field
      add(
        :created_by,
        references(
          :users,
          type: :uuid
        ),
        # Can't  be  null because  it  has  to be  created  by
        # someone.
        null: false # NOTE 2019-08-31_0513
      )

      add(
        :assigned_to,
        references(
          :users,
          type: :uuid
        )
      )

      timestamps()
    end

    create unique_index(@table_name, [:type, :authorization_number])
  end
end
