defmodule Assessments.ISPs.Templates.Common do

  defmodule HeaderMeta do
    defstruct(
      client_name:          "Client's Name",
      eye_condition:        "Eye Condition",
      assessment_date:      "Date",
      referring_agency:     "Referring Agency",
      counselor:            "Counselor",
      authorization_number: "Authorization Number",
      instructor:           "Instructor's Name"
    )
  end

  def header_fields() do
    __MODULE__
    |> Module.concat("HeaderMeta")
    |> struct()
    |> Map.from_struct()
    |> Map.keys()
  end

  def title(title \\ "Skills and Needs Assessment") do
    title
  end

  def subtitle(assessment_type) do
    assessment_type
  end

  def header(
    %__MODULE__.HeaderMeta{} = h_meta
  ) do
    h_meta
  end

  def section(name, title, content) do
    %{
      section:
        %{
          name: name,
          title: title,
          content: content
        }
    }
  end
end
