#' Stops if a suggested package is not installed
#'
#' The Bioconductor, network and optional plotting packages are in `Suggests`
#' rather than `Imports`, so that mspTools installs without them. Every
#' function that needs one checks for it first and says how to get it -
#' Bioconductor packages need `BiocManager`, the rest come from CRAN.
#'
#' @param pkgs packages the calling function needs
#' @param fn name of the calling function, shown in the message
#'
#' @returns nothing; stops when a package is missing
#' @keywords internal
.require_pkg <- function(pkgs, fn) {
  
  bioc <- c("GO.db", "AnnotationDbi", "ComplexHeatmap")
  
  absent <- pkgs[!vapply(pkgs, 
                         requireNamespace, 
                         logical(1), 
                         quietly = T)]
  
  if (length(absent) == 0) return(invisible(NULL))
  
  how <- vapply(absent, 
                \(p) if (p %in% bioc) paste0('BiocManager::install("', p, '")')
                     else paste0('install.packages("', p, '")'), 
                character(1))
  
  stop(fn, 
       "() needs the package", 
       if (length(absent) > 1) "s " else " ", 
       paste0('"', absent, '"', collapse = ", "), 
       ". Install with:\n  ", 
       paste(how, collapse = "\n  "), 
       call. = F)
  
}
