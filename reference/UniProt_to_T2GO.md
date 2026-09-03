# Title

Title

## Usage

``` r
UniProt_to_T2GO(
  data_UniProt_GO,
  term_column = "Gene Ontology IDs",
  ontologies = c("CC", "BP", "MF"),
  GO_col = "ids",
  sep = "; "
)
```

## Arguments

- data_UniProt_GO:

  tibble of UniProt records containing a GO column

- term_column:

  name of the column holding the term identifiers

- ontologies:

  ontologies to keep ("BP", "MF" and/or "CC")

- GO_col:

  name of the column holding the GO annotation

- sep:

  separator between GO entries within a cell
