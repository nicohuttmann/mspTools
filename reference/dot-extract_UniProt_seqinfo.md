# Extract sequence-specific UniProt information from downloaded data

Extract sequence-specific UniProt information from downloaded data

## Usage

``` r
.extract_UniProt_seqinfo(
  data_UniProt,
  info_cols,
  rename_cols = c("name"),
  remove.na = T
)
```

## Arguments

- data_UniProt:

  data frame of proteins and UniProt info as returned by
  get_UniProt_data()

- info_cols:

  name of column to be extracted

- rename_cols:

  vector of names to rename extracted columns to (works sequentially)

- remove.na:

  remove proteins without information
