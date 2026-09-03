# Title

Title

## Usage

``` r
get_InterPro_data_from_UniProt(
  accession,
  data_UniProt = NULL,
  taxon_ids = NULL,
  max.query = 100,
  keep.empty = F,
  separate.multiple.sites = T,
  split.position = T,
  export_as_UniProt = F,
  silent = T
)
```

## Arguments

- accession:

  UniProt accession/s to retrieve

- data_UniProt:

  (optional) predownloaded UniProt data with download_UniProt_data() or
  download_UniProt_data_1o()

- taxon_ids:

  taxon identifier/s to restrict the query to

- max.query:

  maximum

- keep.empty:

  Keep Ids without data?

- separate.multiple.sites:

  split disconnected features into multiple rows

- split.position:

  add columns 'from' and 'to'

- export_as_UniProt:

  return the result shaped like a UniProt table

- silent:

  Suppress messages?

## Examples

``` r
if (FALSE) { # \dontrun{

} # }
```
