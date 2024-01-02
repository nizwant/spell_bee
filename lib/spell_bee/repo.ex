defmodule SpellBee.Repo do
  use Ecto.Repo,
    otp_app: :spell_bee,
    adapter: Ecto.Adapters.Postgres
end
