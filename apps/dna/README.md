# Dna

Done using `gen_server`. I must have tried using `gen_fsm`.

### Start server and console

    iex -S mix

### Operations

* Input string to parse

      {:ok, dna_string} = File.read("path/to/rosalind_dna.txt")
      Dna.count(dna_string)

* Clear state

      Dna.clear

* Get current count

      Dna.get_state
