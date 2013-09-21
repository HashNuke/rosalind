# RNA

Transcribe a DNA string to RNA

## Usage

Open `iex` and load `rna.exs`

    iex rna.exs

Read the input from the dataset

    {:ok, dataset} = File.read("/Users/akashmanohar/Desktop/rosalind_rna.txt")
    [dna_string | _ ] = String.split(dataset)

Transcribe it

    Dna.transcribe_to_rna(dna_string)
