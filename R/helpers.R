#' Creates limma contrasts from design matrix 
#'
#' @param design 
#' @param combinations 
#' @param copy2clipboard 
#'
#' @return
#' @export
#'
#' @examples .cat_contrasts.fit(limma_list[["design"]])
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