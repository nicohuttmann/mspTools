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

Some annotation functions depend on Bioconductor packages
(`AnnotationDbi`, `GO.db`, `ComplexHeatmap`); install those first if
they are not already present.

See the [reference](https://nicohuttmann.github.io/mspTools/reference/)
for the full list.
