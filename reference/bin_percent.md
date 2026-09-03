# Title

Title

## Usage

``` r
bin_percent(x, steps = c(0, 0.25, 0.5, 0.75, 1), as_factor = F)
```

## Arguments

- x:

  vector containing values from 0 to 1

- steps:

  breakpoints used to bin the values

- as_factor:

  return a factor instead of a character vector

## Examples

``` r
  bin_percent(seq(0, 1, 0.05))
#>  [1] "0%"   ">0%"  ">0%"  ">0%"  ">0%"  ">25%" ">25%" ">25%" ">25%" ">25%"
#> [11] ">50%" ">50%" ">50%" ">50%" ">50%" ">75%" ">75%" ">75%" ">75%" ">75%"
#> [21] "100%"
```
