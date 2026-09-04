# mspTools

A biology-focused library of functions to analyze, visualize and report
proteomics data.

# Installation

You can install this package from GitHub via:

    devtools::install_github("nicohuttmann/mspTools")

or the new, fast way:

    pak::pkg_install("nicohuttmann/mspTools")

mspTools is the biology-facing layer of the msVerse. It builds on
[msTools](https://nicohuttmann.github.io/msTools/) and
[msArrow](https://nicohuttmann.github.io/msArrow/), adding annotation
retrieval and the plots that depend on it.

# What is here

|             |                                                  |
|-------------|--------------------------------------------------|
| Annotations | UniProt, GO and InterPro retrieval and curation  |
| Heatmaps    | `ComplexHeatmap` wrappers over the dataset store |
| PELSA       | plots for PELSA-style experiments                |

# Optional dependencies

mspTools installs without Bioconductor. The packages only some functions
need are in `Suggests`, and those functions check for them first and
tell you how to get them:

| needed by | package |
|----|----|
| [`GO_add_ancestors()`](https://nicohuttmann.github.io/mspTools/reference/GO_add_ancestors.md), [`GO_filter_ontology()`](https://nicohuttmann.github.io/mspTools/reference/GO_filter_ontology.md), [`GO_append_description()`](https://nicohuttmann.github.io/mspTools/reference/GO_append_description.md) | `GO.db`, `AnnotationDbi` |
| [`cheatmap()`](https://nicohuttmann.github.io/mspTools/reference/cheatmap.md) | `ComplexHeatmap`, `ggsci` |
| [`get_UniProt_data()`](https://nicohuttmann.github.io/mspTools/reference/get_UniProt_data.md) and variants | `vroom` |
| [`download_UniParc_sequence_features()`](https://nicohuttmann.github.io/mspTools/reference/download_UniParc_sequence_features.md) | `httr2` |
| peptide labels in [`plot_protein_sequence()`](https://nicohuttmann.github.io/mspTools/reference/plot_protein_sequence.md) | `ggrepel` |

``` r

cheatmap(m)
#> Error: cheatmap() needs the packages "ComplexHeatmap", "ggsci". Install with:
#>   BiocManager::install("ComplexHeatmap")
#>   install.packages("ggsci")
```

See the [reference](https://nicohuttmann.github.io/mspTools/reference/)
for the full list.
