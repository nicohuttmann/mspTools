# Download sequence features data for UniParc sequences

Download sequence features data for UniParc sequences

## Usage

``` r
download_UniParc_sequence_features(
  uniparc_id,
  keep.empty = F,
  separate.multiple.sites = T,
  split.position = T,
  return.sequence = F,
  silent = T
)
```

## Arguments

- uniparc_id:

  UniParc Id (one at a time)

- keep.empty:

  Keep Ids without data?

- separate.multiple.sites:

  split disconnected features into multiple rows

- split.position:

  add columns 'from' and 'to'

- return.sequence:

  keep the protein sequence column in the output

- silent:

  Suppress messages?

## Examples

``` r
if (FALSE) { # \dontrun{
download_UniParc_sequence_features("UPI000004C26F") 
} # }
```
