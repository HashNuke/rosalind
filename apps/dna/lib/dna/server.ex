defmodule Dna.Server do
  use GenServer.Behaviour

  def fresh_state do
    [a: 0, c: 0, g: 0, t: 0]
  end


  def start_link(_) do
    :gen_server.start_link({:local, :dna}, __MODULE__, fresh_state, [])
  end

  
  def init(state) do
    {:ok, state}
  end


  def handle_call(:current_state, _from, state) do
    {:reply, state, state}
  end


  def handle_call(input, _from, state) do
    {:reply, input, state}
  end


  def handle_cast(:clear, _state) do
    {:noreply, fresh_state}
  end

  def handle_cast("A", [a: a, c: c, g: g, t: t]) do
    {:noreply, [a: a + 1, c: c, g: g, t: t] }
  end

  def handle_cast("C", [a: a, c: c, g: g, t: t]) do
    {:noreply, [a: a, c: c + 1, g: g, t: t] }
  end

  def handle_cast("G", [a: a, c: c, g: g, t: t]) do
    {:noreply, [a: a, c: c, g: g + 1, t: t] }
  end

  def handle_cast("T", [a: a, c: c, g: g, t: t]) do
    {:noreply, [a: a, c: c, g: g, t: t + 1] }
  end
end
