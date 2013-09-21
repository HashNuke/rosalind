defmodule Dna do
  use Application.Behaviour

  def start(_type, state) do
    Dna.Supervisor.start_link(state)
  end

  def get_state do
    current_state = :gen_server.call :dna, :current_state
    "#{current_state[:a]} #{current_state[:c]} #{current_state[:g]} #{current_state[:t]}"
  end

  def clear do
    :gen_server.cast :dna, :clear
  end

  def count(input) do
    # This will clean up any line breaks
    [dna_string | _] = String.split(input)
    parse(dna_string)
  end

  defp parse("") do
    Dna.get_state
  end

  defp parse(input) do
    <<alphabet :: [1, binary], rest :: binary>> = input
    :gen_server.cast :dna, alphabet
    parse(rest)
  end
end
