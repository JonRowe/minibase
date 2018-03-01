defmodule Minibase.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    Supervisor.start_link(
      [
        supervisor(Minibase.Repo, []),
        supervisor(MinibaseWeb.Endpoint, [])
      ],
      strategy: :one_for_one,
      name: Minibase.Supervisor
    )
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MinibaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
