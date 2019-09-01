defmodule Assessments.Repo do
  use Ecto.Repo,
    otp_app: :assessments,
    adapter: Ecto.Adapters.Postgres
end
