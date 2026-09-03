# Align axis limits of a list of plots

Align axis limits of a list of plots

## Usage

``` r
.align_axes_limits(
  list_p,
  x.symmetric = F,
  adjust.x.limits = function(x) x,
  adjust.y.limits = function(y) y,
  ...
)
```

## Arguments

- list_p:

  list of ggplot objects

- x.symmetric:

  set x axis limits to absolute max

- adjust.x.limits:

  function or list containing two functions to be applied to the
  existing x-axis limits

- adjust.y.limits:

  function or list containing two functions

- ...:

  additional arguments passed on to the axis setters to be applied to
  the existing y-axis limits
