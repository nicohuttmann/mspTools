# Download UniProt data for given protein accessions and data fields (see available fields with UniProt_fields())

Download UniProt data for given protein accessions and data fields (see
available fields with UniProt_fields())

## Usage

``` r
get_UniProt_data(
  accession,
  fields = c("accession", "gene_names", "organism_name"),
  max.query = 100
)
```

## Arguments

- accession:

  vector of UniProt accessions

- fields:

  UniProt data fields to query

- max.query:

  maximum number of accessions to query at once; if the the number
  exceeds max.query, the query is split up in multiple parts
