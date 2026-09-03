# Title

Title

## Usage

``` r
.plot_peptides_on_seq(
  data_peptides,
  p,
  yvalue = "estimate",
  color = "regulation",
  color.scale = NULL,
  linewidth = "peptide_group",
  alpha = "peptide_group",
  Start = "Start",
  End = "End",
  add.length = 0,
  title = "",
  base_size = 16,
  min_y_range = 1,
  protein_width = 0.6,
  protein_range,
  add.labels = F,
  label = "regulation",
  label.size = 5,
  nudge_x = 0,
  nudge_y = 0,
  hjust = 0,
  vjust = 0,
  direction = "both",
  min.segment.length = 2
)
```

## Arguments

- data_peptides:

  tibble of peptides to draw on the sequence

- p:

  a ggplot object to add to

- yvalue:

  column mapped to the y axis

- color:

  column mapped to colour

- color.scale:

  named vector of colours for

- linewidth:

  column mapped to line width

- alpha:

  column mapped to transparency

- Start:

  column holding the peptide start position

- End:

  column holding the peptide end position

- add.length:

  padding added to each end of the sequence axis

- title:

  plot title

- base_size:

  base font size of the theme

- min_y_range:

  minimum span of the y axis

- protein_width:

  height of the protein bar

- protein_range:

  residue range to show, as c(start, end)

- add.labels:

  label the peptides

- label:

  column holding the label text

- label.size:

  text size of the labels

- nudge_x:

  horizontal nudge passed to ggrepel

- nudge_y:

  vertical nudge passed to ggrepel

- hjust:

  horizontal justification of the labels

- vjust:

  vertical justification of the labels

- direction:

  direction ggrepel may move labels in ("both", "x" or "y")

- min.segment.length:

  shortest leader line ggrepel will draw
