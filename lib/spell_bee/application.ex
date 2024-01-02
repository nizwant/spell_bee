defmodule SpellBee.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SpellBeeWeb.Telemetry,
      SpellBee.Repo,
      {DNSCluster, query: Application.get_env(:spell_bee, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SpellBee.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SpellBee.Finch},
      # Start a worker by calling: SpellBee.Worker.start_link(arg)
      # {SpellBee.Worker, arg},
      # Start to serve requests, typically the last entry
      SpellBeeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SpellBee.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SpellBeeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
