# Stops if a suggested package is not installed

The Bioconductor, network and optional plotting packages are in
`Suggests` rather than `Imports`, so that mspTools installs without
them. Every function that needs one checks for it first and says how to
get it - Bioconductor packages need `BiocManager`, the rest come from
CRAN.

## Usage

``` r
.require_pkg(pkgs, fn)
```

## Arguments

- pkgs:

  packages the calling function needs

- fn:

  name of the calling function, shown in the message

## Value

nothing; stops when a package is missing
