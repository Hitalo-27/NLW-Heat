defmodule ElixirHeat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirHeat.Repo,
      # Start the Telemetry supervisor
      ElixirHeatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirHeat.PubSub},
      # Start the Endpoint (http/https)
      ElixirHeatWeb.Endpoint,
      # Start a worker by calling: ElixirHeat.Worker.start_link(arg)
      # {ElixirHeat.Worker, arg}
      ElixirHeat.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirHeat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirHeatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
