# Plot PELSA results on a protein sequence including protein domain features

Plot PELSA results on a protein sequence including protein domain
features

## Usage

``` r
plot_protein_sequence(
  data,
  data_features,
  protein = "P49841",
  protein_range,
  title
)
```

## Arguments

- data:

  dataset or list holding the peptide data

- data_features:

  tibble of sequence features to draw

- protein:

  protein group to plot

- protein_range:

  residue range to show, as c(start, end)

- title:

  plot title
