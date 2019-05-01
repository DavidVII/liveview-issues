defmodule Select.Repo do
  use Ecto.Repo,
    otp_app: :select,
    adapter: Ecto.Adapters.Postgres
end
