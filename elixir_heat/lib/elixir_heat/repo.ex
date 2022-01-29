defmodule ElixirHeat.Repo do
  use Ecto.Repo,
    otp_app: :elixir_heat,
    adapter: Ecto.Adapters.Postgres
end
