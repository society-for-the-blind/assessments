defmodule Assessments.ISPs.ISP do

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  # needed for the two `belongs_to/3`s
  @foreign_key_type :binary_id

  schema "assessments" do

    field :client_name,          :string
    field :eye_condition,        :string
    field :assessment_date,      :date
    field :authorization_number, :string

    # TODO these should be `has_one`
    field :referring_agency,     :string
    field :counselor,            :string

    field :type,   :string
    # derived from latest AssessmentEvent at one point
    # field :status, :string

    # https://elixirforum.com/t/belongs-to-multiple-foreign-keys/8127
    # https://stackoverflow.com/questions/43812738/elixir-ecto-multiple-belongs-to-relationship-in-a-schema
    belongs_to(
      :creator, # assoc name
      Assessments.Accounts.User,
      foreign_key: :created_by
    )

    belongs_to(
      :assignee, # assoc name
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

  def changeset(
    %__MODULE__{} = assessment,
    %{} = attrs
  ) do

    required_fields =
      [
        :client_name,
        :type,
      ]

    fields =
      [
        :eye_condition,
        :assessment_date,
        :referring_agency,
        :counselor,
        :authorization_number,
      ]
      ++ required_fields

    assessment
    |> cast(attrs, fields)
    |> validate_required(required_fields)
    # 1. not validating auth_number format yet
    # 2. is there a point of using `unique_constraint/3`?
    |> validate_inclusion(:type, assessment_type_values())
  end
end
