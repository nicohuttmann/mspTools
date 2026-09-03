# Creates limma contrasts from design matrix

Creates limma contrasts from design matrix

## Usage

``` r
.cat_contrasts.fit(
  design,
  combinations = tibble(a = c(), b = c()),
  copy2clipboard = T
)
```

## Arguments

- design:

  design matrix

- combinations:

  contrasts to build, as pairs of design columns

- copy2clipboard:

  copy the code to the clipboard

## Examples

``` r
if (FALSE) { # \dontrun{
  .cat_contrasts.fit(limma_list[["design"]])
} # }
```
