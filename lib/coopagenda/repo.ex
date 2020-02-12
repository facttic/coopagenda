defmodule Coopagenda.Repo do
  use Ecto.Repo,
    otp_app: :coopagenda,
    adapter: Ecto.Adapters.Postgres
end
