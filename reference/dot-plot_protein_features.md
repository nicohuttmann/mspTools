# Title

Title

## Usage

``` r
.plot_protein_features(
  data_sites,
  p,
  name = "name",
  start = "from",
  end = "to",
  add.length = 0,
  merge_name_position = F,
  protein_width = 0.6,
  base_size = 16,
  multiple_scaling_factor = 8,
  legend.position = "bottom",
  legend_width = 4,
  colors_manual
)
```

## Arguments

- data_sites:

  tibble of sequence features to draw

- p:

  a ggplot object to add to

- name:

  column holding the feature name

- start:

  column holding the feature start position

- end:

  column holding the feature end position

- add.length:

  padding added to each end of the sequence axis

- merge_name_position:

  merge features that share a name and position

- protein_width:

  height of the protein bar

- base_size:

  base font size of the theme

- multiple_scaling_factor:

  vertical scaling applied when features overlap

- legend.position:

  legend position, passed to ggplot2::theme()

- legend_width:

  width of the legend

- colors_manual:

  named vector of colours for the features
