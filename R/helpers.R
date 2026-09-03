#' Creates limma contrasts from design matrix 
#'
#' @param design design matrix
#' @param combinations contrasts to build, as pairs of design columns
#' @param copy2clipboard copy the code to the clipboard
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#'   .cat_contrasts.fit(limma_list[["design"]])
#' }
.cat_contrasts.fit <- function(design, combinations = tibble(a=c(), b=c()), copy2clipboard = T) {
  
  if (nrow(combinations) == 0) {
    
    combinations <- tidyr::expand_grid(a = colnames(design), 
                                       b = colnames(design))
    
    combinations <- combinations %>% 
      dplyr::filter(a != b)
    
  } 
  
  combinations <- combinations %>% 
    dplyr::mutate(contrasts = paste(a, b, sep = "-")) %>% 
    dplyr::arrange(b, a) %>% 
    dplyr::pull(contrasts)
  
  
  code <- paste0('makeContrasts(',
                 paste(combinations, collapse = ',\n\t'), 
                 ',\n\tlevels=',
                 deparse(substitute(design)),
                 ')')
  
  if (copy2clipboard)
    cat(code, 
        file = "clipboard")
  
  cat(code)
  
  return(invisible(eval(parse(text = code))))
  
}

#' Title
#'
#' @param x vector containing values from 0 to 1
#' @param steps breakpoints used to bin the values
#' @param as_factor return a factor instead of a character vector
#'
#' @returns
#' @export
#'
#' @examples
#'   bin_percent(seq(0, 1, 0.05))
bin_percent <- function(x, steps = c(0, 0.25, 0.5, 0.75, 1), as_factor = F) {
  
  y <- x / max(x)
  
  xy <- rep("0%", length(x))
  
  steps <- setNames(steps, 
                    case_when(
                      steps == 0 ~ ">0%", 
                      steps == 1 ~ "100%", 
                      .default = paste0(">", steps*100, "%")))
  
  for (i in names(steps)) {
    
    if (i == ">0%")
      xy <- ifelse(y > steps[i], i, xy)
    else if (i == "100%")
      xy <- ifelse(y == steps[i], i, xy)
    else 
      xy <- ifelse(y >= steps[i], i, xy)
    
  }
  
  if (as_factor) 
    xy <- factor(xy, levels = names(steps))
  
  return(xy)
  
}

#' Reverse the factor level order 
#'
#' @param x factor vector
#'
#' @returns
#' @export
#'
#' @examples
#'   rev_lvl(factor(c("a", "b", "c")))
rev_lvl <- function(x) {
  
  factor(x, levels = rev(levels(x)))
  
}

#' Calculate minimum along two vectors 
#'
#' @param x numeric vector 1
#' @param y numeric vector 2
#' @param na.rm should missing values be removed 
#'
#' @returns
#' @export
#'
#' @examples
min_2 <- function(x, y, na.rm = FALSE) {
  map2_dbl(x, y, \(.x, .y) min(.x, .y, na.rm = na.rm))
}

#' Calculate maximum along two vectors 
#'
#' @param x numeric vector 1
#' @param y numeric vector 2
#' @param na.rm should missing values be removed 
#'
#' @returns
#' @export
#'
#' @examples
max_2 <- function(x, y, na.rm = FALSE) {
  map2_dbl(x, y, \(.x, .y) max(.x, .y, na.rm = na.rm))
}


