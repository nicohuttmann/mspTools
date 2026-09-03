# Defines ggplot panel by ratio, size, unit size, center, and axis breaks

Defines ggplot panel by ratio, size, unit size, center, and axis breaks

## Usage

``` r
.set_continuous_axes(
  p,
  x.axis.limits = NULL,
  y.axis.limits = NULL,
  x.axis.breaks = NULL,
  y.axis.breaks = NULL,
  aspect.ratio = 1,
  plot.center = NULL,
  axis.unit.ratio = NULL,
  coord_fun = coord_fixed,
  expand.x.axis = c(0, 0),
  expand.y.axis = c(0, 0)
)
```

## Arguments

- p:

  plot

- x.axis.limits:

  vector containing lower and upper x-axis limits

- y.axis.limits:

  vector containing lower and upper y-axis limits

- x.axis.breaks:

  distance between x-axis breaks

- y.axis.breaks:

  distance between y-axis breaks

- aspect.ratio:

  absolute length of x-axis/y-axis

- plot.center:

  vector for center of plot

- axis.unit.ratio:

  ratio between x- and y-axis units

- coord_fun:

  coordinate function to apply (e.g. ggplot2::coord_cartesian)

- expand.x.axis:

  expand x.axis (see scale_x_continuous)

- expand.y.axis:

  expand x.axis (see scale_y_continuous)
