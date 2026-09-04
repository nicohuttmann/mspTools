#' Title
#'
#' @param matrix numeric matrix to draw
#' @param draw draw the heatmap, or return the object unrendered
#' @param show_clusters annotate the cluster each row belongs to
#' @param add_cluster_n add the number of rows per cluster to the annotation
#' @param ... additional arguments for ComplexHeatmap::Heatmap()
#'
#' @returns
#' @export
#'
#' @examples
cheatmap <- function(matrix, 
                     draw = T, 
                     show_clusters = NULL, 
                     add_cluster_n = T, 
                     ...) {

  .require_pkg(c("ComplexHeatmap", "ggsci"), "cheatmap")
  
  # Make matrix 
  if (tibble::is_tibble(matrix)) {
    matrix_try <- msTools::tibble2matrix(matrix)
    
    if (is.numeric(matrix_try)) {
      matrix <- matrix_try
    } else {
      warning("Provided tibble could not be converted to a matrix. Trying to generate a heatmap regardless.")
    }
  }
  
  # Set defaults 
  show_row_names <- if (nrow(matrix) > 100) F else T
  show_column_names <- if (ncol(matrix) > 200) F else T
  use_raster <- if (nrow(matrix) > 2000) T else F
  
  
  # Do first clustering 
  pdf(file = NULL)
  data_hm <- suppressMessages(
    ComplexHeatmap::prepare(
      ComplexHeatmap::Heatmap(matrix, 
                              show_row_names = show_row_names, 
                              show_column_names = show_column_names, 
                              use_raster = use_raster, 
                              ...)))
  dev.off()
  
  # Reorder matrix 
  row_order <- data_hm %>% 
    ComplexHeatmap::row_order() %>% 
    suppressWarnings()
  
  column_order <- data_hm %>% 
    ComplexHeatmap::column_order() %>% 
    suppressWarnings()
  
  matrix_ordered <- matrix[row_order, column_order]
  
  # Cluster ordered matrix 
  pdf(file = NULL)
  data_hm <- ComplexHeatmap::Heatmap(matrix_ordered, 
                                     show_row_names = show_row_names, 
                                     show_column_names = show_column_names, 
                                     use_raster = use_raster, 
                                     ...)  %>% 
    ComplexHeatmap::prepare()
  dev.off()
  
  
  # Annotate clusters 
  if (!is.null(show_clusters)) {
    
    row_dend <- data_hm %>% 
      ComplexHeatmap::row_dend() %>% 
      suppressWarnings() %>% 
      as.dendrogram() %>% 
      as.hclust()
    
    row_clusters <- row_dend %>% 
      cutree(k = show_clusters) 
    
    row_clusters_legend <- row_clusters
    
    if (add_cluster_n) 
      row_clusters_legend[] <- setNames(paste0(1:show_clusters, 
                                               " (", table(row_clusters), ")"), 
                                        1:show_clusters)[row_clusters]
    
    row_clusters_legend <- factor(row_clusters_legend, 
                                  levels = unique(row_clusters_legend))
    
    pdf(file = NULL)
    data_hm <- ComplexHeatmap::Heatmap(
      matrix_ordered, 
      show_row_names = show_row_names, 
      show_column_names = show_column_names, 
      use_raster = use_raster, 
      right_annotation = 
        ComplexHeatmap::rowAnnotation(
          Clusters = row_clusters_legend, 
          col = list(Clusters = setNames(ggsci::pal_igv()(show_clusters), 
                                         levels(row_clusters_legend)))), 
      ...) %>% 
      ComplexHeatmap::prepare()
    dev.off()
    
    column_dend <- data_hm %>% 
      ComplexHeatmap::column_dend() %>% 
      suppressWarnings()
    
  } 
  
  # Draw 
  if (draw) suppressMessages(ComplexHeatmap::draw(data_hm))
  
  
  # Return only heatmap 
  if (is.null(show_clusters)) 
    return(invisible(data_hm))
  
  # Return heatmap + dendrograms 
  else 
    return(invisible(list(hm = data_hm, 
                          row_dend = row_dend, 
                          column_dend = column_dend, 
                          row_clusters = row_clusters)))
  
}


