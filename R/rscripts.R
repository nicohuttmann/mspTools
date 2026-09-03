#' Title
#'
#' @param dir folder holding the scripts
#' @param backup_dir folder the backup is written to
#'
#' @returns
#' @export
#'
#' @examples
backup_scripts <- function(dir, backup_dir) {
  
  
  files <- list.files(dir, full.names = T, recursive = T, pattern = "(.R$)|(.Rmd$)")
  
  n_files <- length(files)
  
  size_files <- round(sum(file.size(files)) / 1000000, 1)
  
  
  dirs <- list.dirs(dir) 
  
  dirs_visible <- dirs[!str_detect(dirs, "/\\.")]
  
  start <- menu(c("Yes", "No"), 
                title = paste0(n_files, 
                               ' scripts (~', 
                               size_files, 
                               ' MB) will be copied from "', 
                               dir, '" to "', backup_dir, '". Start?'))
  
  if (start == 1) {
    
    dir.create(backup_dir)
    
    # Create folder structure 
    purrr::map(file.path(backup_dir, dirs_visible), dir.create)
    
    # Copy files 
    purrr::map2(files, 
                file.path(backup_dir, files), 
                file.copy)
    
    message("Done.")
    
    return(invisible(T))
    
  } else {
    
    return(invisible(F))
    
  }
  
}
