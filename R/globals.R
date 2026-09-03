#' @importFrom dplyr across all_of arrange bind_rows case_when everything
#' @importFrom dplyr filter first left_join mutate pull rename select
#' @importFrom dplyr starts_with summarise
#' @importFrom ggplot2 aes annotate coord_cartesian geom_rect geom_segment
#' @importFrom ggplot2 ggplot guide_legend guides labs scale_alpha_manual
#' @importFrom ggplot2 scale_color_manual scale_fill_discrete scale_fill_manual
#' @importFrom ggplot2 scale_linewidth_manual scale_x_continuous
#' @importFrom ggplot2 scale_y_continuous theme theme_classic xlab ylab
#' @importFrom msTools strsplit_keep_first strsplit_keep_last
#' @importFrom purrr map map_lgl map2_dbl
#' @importFrom rlang :=
#' @importFrom stringr str_detect str_extract str_extract_all str_replace
#' @importFrom stringr str_replace_all
#' @importFrom tibble tibble
#' @importFrom tidyr replace_na separate_longer_delim
#' @importFrom magrittr %>%
#' @importFrom methods hasArg
#' @importFrom stats setNames na.omit
NULL

# Columns referred to by non-standard evaluation inside dplyr and tidyr
# pipelines, plus the magrittr placeholder.
utils::globalVariables(c(".",
                         ".data",
                         "observations",
                         "variables"))
