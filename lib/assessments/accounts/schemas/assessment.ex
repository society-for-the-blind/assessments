defmodule Assessments.Accounts.Assessment do

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  # needed for `belongs_to/3`
  @foreign_key_type :binary_id

  schema "assessments" do

    field :client_name,          :string
    field :eye_condition,        :string
    field :assessment_date,      :date
    field :referring_agency,     :string
    field :counselor,            :string
    field :authorization_number, :string

    field :type,   :string
    # derived from latest AssessmentEvent at one point
    # field :status, :string

    belongs_to(
      :creator,
      Assessments.Accounts.User,
      foreign_key: :created_by
    )

    belongs_to(
      :assignee,
      Assessments.Accounts.User,
      foreign_key: :assigned_to
    )

    timestamps()
  end

  # TODO what is "a reference to a finished assessment document"?...

  # TODO these should be events, and status should be derived
  #      from latest event (see CreateAssessmentEvent)

  # def assessment_status_values() do
  #   ~w(new unassigned re-assigned assigned finished sent)
  # end

  def assessment_type_values() do
    ~w(ILS Braille AT O&M)
  end
end
