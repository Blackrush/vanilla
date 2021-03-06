defmodule Vanilla.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(Vanilla.Frontend.Ranch, []),
      worker(Vanilla.Repo, []),
    ]

    supervise children,
      strategy: :one_for_one
  end
  
  
end