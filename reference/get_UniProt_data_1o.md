# Download UniProt data for given protein accessions, multiple taxonomy identifiers and data fields (faster for 1000s of proteins; see available fields with UniProt_fields())

Download UniProt data for given protein accessions, multiple taxonomy
identifiers and data fields (faster for 1000s of proteins; see available
fields with UniProt_fields())

## Usage

``` r
get_UniProt_data_1o(
  accession,
  fields = c("accession", "gene_names", "organism_name"),
  taxon_id = c(human = 9606, mouse = 10090, E.coliK12 = 83333)
)
```

## Arguments

- accession:

  vector of UniProt accessions

- fields:

  UniProt data fields to query

- taxon_id:

  taxonomy Id
