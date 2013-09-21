defmodule Dna.Supervisor do
  use Supervisor.Behaviour

  def start_link(state) do
    :supervisor.start_link(__MODULE__, state)
  end

  def init(state) do
    children = [ worker(Dna.Server, [state]) ]
    supervise children, strategy: :one_for_one
  end
end
