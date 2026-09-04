# mspTools

<!-- badges: start -->
[![R-CMD-check](https://github.com/nicohuttmann/mspTools/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nicohuttmann/mspTools/actions/workflows/R-CMD-check.yaml)
[![pkgdown](https://github.com/nicohuttmann/mspTools/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/nicohuttmann/mspTools/actions/workflows/pkgdown.yaml)
<!-- badges: end -->

A biology-focused library of functions to analyze, visualize and report proteomics data. 

# Installation
You can install this package from GitHub via:

```
devtools::install_github("nicohuttmann/mspTools")
```

or the new, fast way: 

```
pak::pkg_install("nicohuttmann/mspTools")
```

mspTools is the biology-facing layer of the msVerse. It builds on
[msTools](https://nicohuttmann.github.io/msTools/) and
[msArrow](https://nicohuttmann.github.io/msArrow/), adding annotation
retrieval and the plots that depend on it.

# What is here

| | |
|---|---|
| Annotations | UniProt, GO and InterPro retrieval and curation |
| Heatmaps | `ComplexHeatmap` wrappers over the dataset store |
| PELSA | plots for PELSA-style experiments |

# Optional dependencies

mspTools installs without Bioconductor. The packages only some functions need
are in `Suggests`, and those functions check for them first and tell you how
to get them:

| needed by | package |
|---|---|
| `GO_add_ancestors()`, `GO_filter_ontology()`, `GO_append_description()` | `GO.db`, `AnnotationDbi` |
| `cheatmap()` | `ComplexHeatmap`, `ggsci` |
| `get_UniProt_data()` and variants | `vroom` |
| `download_UniParc_sequence_features()` | `httr2` |
| peptide labels in `plot_protein_sequence()` | `ggrepel` |

```r
cheatmap(m)
#> Error: cheatmap() needs the packages "ComplexHeatmap", "ggsci". Install with:
#>   BiocManager::install("ComplexHeatmap")
#>   install.packages("ggsci")
```

See the [reference](https://nicohuttmann.github.io/mspTools/reference/) for the
full list.
