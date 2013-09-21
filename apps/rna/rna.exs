defmodule Dna do
  def transcribe_to_rna(dna_string) do
    String.replace(dna_string, "T", "U")
  end
end
