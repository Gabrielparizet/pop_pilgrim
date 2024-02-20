defmodule PopPilgrim.Repo do
  use Ecto.Repo,
    otp_app: :pop_pilgrim,
    adapter: Ecto.Adapters.Postgres
end
