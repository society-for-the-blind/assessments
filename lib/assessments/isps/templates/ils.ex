defmodule Assessments.ISPs.Templates.ILS do

  def title(title) do
    title <> "\n"
    <> "Skills and Needs Assessment"
  end

  def header(
    %{
      client_name:          _,
      eye_condition:        _,
      assessment_date:      _,
      referring_agency:     _,
      counselor:            _,
      authorization_number: _,
      instructor:           _,
    } = header_titles
  ) do
    header_titles
  end

  def section(title, subsections)
    when is_list(subsections)
  do
    %{
      section:
        %{
          title: title,
          subsections: subsections
        }
    }
  end
end
