# Title

Title

## Usage

``` r
extract_UniProt_GO2TERM2GENE(
  data_UniProt_GO,
  entry_col = "Entry",
  GO_col = c("BP", "CC", "MF", "all", "ids")
)
```

## Arguments

- data_UniProt_GO:

  UniProt data for GO annotations as downloaded by get_UniProt_data(ids,
  fields = UniProt_fields()\$`Gene Ontology (GO)`)

- entry_col:

  protein identifier column

- GO_col:

  name of column containing GO annotations to be extracted
