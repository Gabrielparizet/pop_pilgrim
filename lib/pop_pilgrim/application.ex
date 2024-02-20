defmodule PopPilgrim.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PopPilgrimWeb.Telemetry,
      PopPilgrim.Repo,
      {DNSCluster, query: Application.get_env(:pop_pilgrim, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PopPilgrim.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PopPilgrim.Finch},
      # Start a worker by calling: PopPilgrim.Worker.start_link(arg)
      # {PopPilgrim.Worker, arg},
      # Start to serve requests, typically the last entry
      PopPilgrimWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PopPilgrim.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PopPilgrimWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
