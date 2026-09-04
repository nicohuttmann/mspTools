#' Title
#'
#' @param protein_range residue range to show, as c(start, end)
#' @param protein_width height of the protein bar
#' @param add.length padding added to each end of the sequence axis
#' @param x_lab x axis label
#' @param y_lab y axis label
#' @param color column mapped to colour
#' @param alpha column mapped to transparency
#' @param base_size base font size of the theme
#'
#' @returns
#' @export
#'
#' @examples
.plot_protein_seq <- function(protein_range = c(1, 100), 
                              protein_width = 0.6, 
                              add.length = 0, 
                              x_lab = "protein", 
                              y_lab = "", 
                              color = "#b0b0b0", 
                              alpha = 0.5, 
                              base_size = 16) {
  
  p_protein <- ggplot2::ggplot() + 
    ggplot2::annotate("rect", 
                      xmin = protein_range[1] - add.length, 
                      xmax = protein_range[2] + add.length, 
                      ymin = - protein_width / 2, 
                      ymax =   protein_width / 2, 
                      fill = color, 
                      alpha = alpha) + 
    ggplot2::theme_classic(base_size = base_size) + 
    ggplot2::scale_x_continuous(expand = c(0, 0)) + 
    ggplot2::coord_cartesian(xlim = protein_range) + 
    ggplot2::labs(x = x_lab, y = y_lab)
  
  return(p_protein)
  
} 


#' Extract sequence-specific UniProt information from downloaded data 
#'
#' @param data_UniProt data frame of proteins and UniProt info as returned by 
#' get_UniProt_data()
#' @param info_cols name of column to be extracted
#' @param rename_cols vector of names to rename extracted columns to (works 
#' sequentially)
#' @param remove.na remove proteins without information 
#'
#' @returns
#' @export
#'
#' @examples
.extract_UniProt_seqinfo <- function(data_UniProt, 
                                     info_cols, 
                                     rename_cols = c("name"), 
                                     remove.na = T) {
  
  if (length(info_cols) == 0) {
    
    return(data_UniProt %>% 
             select(1))
    
  } else if (length(info_cols) > 1) {
    
    data_output_m <- 
      purrr::map(setNames(info_cols, info_cols), 
                 \(x) .extract_UniProt_seqinfo(data_UniProt = data_UniProt, 
                                               info_cols = x, 
                                               rename_cols = rename_cols, 
                                               remove.na = remove.na)) %>% 
      dplyr::bind_rows(.id = "Source")
    
    return(data_output_m)
    
  } else {
    
    data_name <- data_UniProt[[info_cols]] %>% 
      na.omit() %>% 
      str_extract('^[A-Z]+') %>% 
      unique() 
    
    if (length(data_name) == 0) 
      return(tibble::tibble(!!info_cols := character()))
    
    data_separated <- data_UniProt %>% 
      rename(info_column = !!info_cols) %>% 
      select(1, info_column) %>% 
      mutate(info_column = str_replace_all(info_column, 
                                           paste0("; (?=", data_name, ")"), 
                                           ";here ")) %>% 
      separate_longer_delim(cols = info_column, 
                            delim = ";here ")
    
    subfields <- data_separated$info_column %>% 
      str_extract_all('(?<=/)([a-zA-Z_]+)') %>% 
      unlist() %>% 
      na.omit() %>% 
      unique() 
    
    data_output <- data_separated %>% 
      mutate(type = ifelse(!is.na(info_column), data_name, NA_character_), 
             position = str_extract(info_column, paste0("(?<=", data_name, " )\\d+\\.\\.\\d+|\\d+")) %>% 
               str_replace("\\.\\.", "-"), 
             from = strsplit_keep_first(position, "-") %>% 
               as.numeric(), 
             to = strsplit_keep_last(position, "-") %>% 
               as.numeric())
    
    for (i in subfields) {
      data_output <- data_output %>% 
        mutate(!!i := str_extract(info_column, paste0('(?<=/', i, '=")[^"]+')) %||% NA)
    }
    
    if (length(rename_cols) > 0 && !is.null(rename_cols) && !is.na(rename_cols)) 
      for (i in seq_along(rename_cols))
        data_output <- data_output %>% 
      dplyr::rename(!!rename_cols[i] := !!subfields[i])
    
    if (remove.na) 
      data_output <- data_output %>% 
      filter(!is.na(info_column))
    
    data_output <- data_output %>% 
      rename(Info := "info_column") %>% 
      dplyr::mutate(Source = info_cols, 
                    .before = "Info")
    
    return(data_output)
    
  }
  
}


#' Title
#'
#' @param vector_UniProt character vector of UniProt feature strings
#'
#' @returns
#' @export
#'
#' @examples
.identify_UniProt_infotype <- function(vector_UniProt) {
  
  if (any(vector_UniProt %>% 
          na.omit %>% 
          str_detect("/note|/evidence")))
    return("sequence_features")
  else if(any(vector_UniProt %>% 
              na.omit %>% 
              str_detect("; ")))
    return("protein_feature_multiple") 
  else 
    return("protein_feature_single")
}



#' Title
#'
#' @param data_sites tibble of sequence features to draw
#' @param p a ggplot object to add to
#' @param name column holding the feature name
#' @param start column holding the feature start position
#' @param end column holding the feature end position
#' @param add.length padding added to each end of the sequence axis
#' @param merge_name_position merge features that share a name and position
#' @param protein_width height of the protein bar
#' @param base_size base font size of the theme
#' @param multiple_scaling_factor vertical scaling applied when features overlap
#' @param legend.position legend position, passed to ggplot2::theme()
#' @param legend_width width of the legend
#' @param colors_manual named vector of colours for the features
#'
#' @returns
#' @export
#'
#' @examples
.plot_protein_features <- function(data_sites, 
                                   p, 
                                   name = "name", 
                                   start = "from", 
                                   end = "to", 
                                   add.length = 0, 
                                   merge_name_position = F, 
                                   protein_width = 0.6, 
                                   base_size = 16, 
                                   multiple_scaling_factor = 8, 
                                   legend.position = "bottom", 
                                   legend_width = 4, 
                                   colors_manual) {
  
  if (!hasArg(data_sites) |
      is.null(data_sites) | 
      nrow(data_sites) == 0) {
    if (!hasArg(p)) {
      return(ggplot()) 
    } else {
      return(p)
    }
  }
  
  data_sites_p <- data_sites %>% 
    mutate(ymin = -1, 
           ymax = 1) %>% 
    rename(name = all_of(name), 
           start = all_of(start), 
           end = all_of(end)) %>% 
    mutate(position = ifelse(start != end, 
                             paste0(start, 
                                    "-", 
                                    end), 
                             start)) %>%  
    arrange(start, end, name)
  
  
  
  # new plot if nothing given 
  if (!hasArg(p))
    p_peptides <- ggplot() + 
    annotate("rect", 
             xmin = 1, 
             xmax = max(data_sites_p$end), 
             ymin = - protein_width / 2, 
             ymax =   protein_width / 2, 
             fill = "grey")
  else 
    p_peptides <- p
  
  
  # Merge same feature name at different positions 
  if (merge_name_position) 
    data_sites_p <- data_sites_p %>% 
    mutate(name = paste0(unique(name), " (", 
                         paste(position, collapse = "/"), 
                         ")"), 
           .by = "name")
  
  
  for (i in 1:nrow(data_sites_p)) {
    if (i == 1) 
      y_height <- protein_width
    else 
      y_height <- c(y_height, 
                    protein_width * (1 - sum(data_sites_p$start[i] < 
                                               data_sites_p$end[1:(i-1)]) / multiple_scaling_factor))
  }
  
  
  data_sites_p <- data_sites_p %>% 
    mutate(ymin = - y_height / 2, 
           ymax =   y_height / 2, 
           name = factor(name, 
                         levels = unique(name))) 
  
  p_protein <- p_peptides + 
    geom_rect(aes(xmin = start - add.length, 
                  xmax = end + add.length, 
                  ymin = ymin, 
                  ymax = ymax, 
                  fill = name), 
              data_sites_p) + 
    theme_classic(base_size = base_size) + 
    guides(fill = guide_legend(title = "features", 
                               position = legend.position, 
                               ncol = legend_width))
  
  if (hasArg(colors)) 
    p_protein <- p_protein + 
    scale_fill_manual(values = colors_manual)
  else if (length(unique(data_sites_p$name)) <= 7)
    p_protein <- p_protein + 
    scale_fill_embl()
  else 
    p_protein <- p_protein + 
    scale_fill_discrete()
  
  
  return(p_protein)
  
}


#' Title
#'
#' @param data_peptides tibble of peptides to draw on the sequence
#' @param p a ggplot object to add to
#' @param yvalue column mapped to the y axis
#' @param color column mapped to colour
#' @param color.scale named vector of colours for <color>
#' @param linewidth column mapped to line width
#' @param alpha column mapped to transparency
#' @param Start column holding the peptide start position
#' @param End column holding the peptide end position
#' @param add.length padding added to each end of the sequence axis
#' @param title plot title
#' @param base_size base font size of the theme
#' @param min_y_range minimum span of the y axis
#' @param protein_width height of the protein bar
#' @param protein_range residue range to show, as c(start, end)
#' @param add.labels label the peptides
#' @param label column holding the label text
#' @param label.size text size of the labels
#' @param nudge_x horizontal nudge passed to ggrepel
#' @param nudge_y vertical nudge passed to ggrepel
#' @param hjust horizontal justification of the labels
#' @param vjust vertical justification of the labels
#' @param direction direction ggrepel may move labels in ("both", "x" or "y")
#' @param min.segment.length shortest leader line ggrepel will draw
#'
#' @returns
#' @export
#'
#' @examples
.plot_peptides_on_seq <- function(data_peptides, 
                                  p, 
                                  yvalue = "estimate", 
                                  color = "regulation", 
                                  color.scale = NULL, 
                                  linewidth = "peptide_group", 
                                  alpha = "peptide_group", 
                                  Start = "Start", 
                                  End = "End", 
                                  add.length = 0, 
                                  title = "", 
                                  base_size = 16, 
                                  min_y_range = 1, 
                                  protein_width = 0.6, 
                                  protein_range, 
                                  add.labels = F, 
                                  label = "regulation", 
                                  label.size = 5, 
                                  nudge_x = 0, 
                                  nudge_y = 0, 
                                  hjust = 0,
                                  vjust = 0, 
                                  direction = "both", 
                                  min.segment.length = 2) {

  .require_pkg("ggrepel", ".plot_peptides_on_seq")
  
  
  data_p <- data_peptides %>% 
    mutate(yvalue = !!rlang::sym(yvalue), 
           Start = !!rlang::sym(Start), 
           End = !!rlang::sym(End), 
           color = !!rlang::sym(color), 
           alpha = !!rlang::sym(alpha), 
           linewidth = !!rlang::sym(linewidth), 
           label = !!rlang::sym(label))
  
  # add if
  if (!hasArg(protein_range))
    protein_range <- c(min(data_p$Start), 
                       max(data_p$End))
  
  # new plot if nothing given 
  if (!hasArg(p))
    p_peptides <- ggplot() + 
      annotate("rect", 
               xmin = protein_range[1], 
               xmax = protein_range[2], 
               ymin = - protein_width / 2, 
               ymax =   protein_width / 2, 
               fill = "grey")
  else 
    p_peptides <- p
  
  # Add peptides 
  p_peptides <- p_peptides + 
    geom_segment(aes(x = Start - add.length, 
                     xend = End + add.length, 
                     y = yvalue, 
                     yend = yvalue, 
                     color = color, 
                     alpha = alpha, 
                     linewidth = linewidth), 
                 data = data_p) + 
    theme_classic(base_size = base_size) + 
    scale_color_manual(values = color.scale) + 
    scale_alpha_manual(values = c(regular = 0.9, 
                                  highlight = 1)) + 
    scale_linewidth_manual(values = c(regular = 1.2, 
                                      highlight = 2.2)) + 
    scale_x_continuous(expand = c(0, 0)) + 
    coord_cartesian(xlim = protein_range, 
                    ylim = c(min(c(-min_y_range, data_p$yvalue), na.rm = T), 
                             max(c(min_y_range, data_p$yvalue), na.rm = T))) + 
    labs(color = color)
  
  # Annotate peptides 
  if (add.labels)
    p_peptides <- p_peptides + 
    ggrepel::geom_text_repel(ggplot2::aes(x = End + add.length, 
                                          y = yvalue, 
                                          label = label), 
                             data = data_p, 
                             size = label.size, 
                             nudge_x = nudge_x,
                             nudge_y = nudge_y,
                             hjust = hjust,
                             vjust = vjust, 
                             direction = direction, 
                             min.segment.length = min.segment.length)
  
  return(p_peptides)
  
}


#' Plot PELSA results on a protein sequence including protein domain features 
#'
#' @param data dataset or list holding the peptide data
#' @param data_features tibble of sequence features to draw
#' @param protein protein group to plot
#' @param protein_range residue range to show, as c(start, end)
#' @param title plot title
#'
#' @returns
#' @export
#'
#' @examples
plot_protein_sequence <- function(data, 
                                  data_features, 
                                  protein = "P49841", 
                                  protein_range, 
                                  title) {
  
  # Protein range
  if (!hasArg(protein_range) && 
      "data_protein_annotation" %in% names(data) && 
      "Length" %in% names(data$data_protein_annotation)) {
    protein_range <- c(1, data$data_protein_annotation %>% 
                         filter(Protein.Group == protein) %>% 
                         pull(Length) %>% 
                         first())
  } else {
    protein_range <- c(NA, NA)
  }
  
  # Title 
  if (!hasArg(title) && 
      "data_peptides" %in% names(data) && 
      "Genes" %in% names(data$data_peptides)) {
    title <- data$data_peptides %>% 
      filter(Protein.Group == protein) %>% 
      pull(Genes) %>% 
      first()
  } else {
    title <- protein
  }
  
  
  # 1. Plot protein range 
  p <- .plot_protein_seq(
    protein_range = protein_range, 
    x_lab = paste0(title, " (", protein_range[1], "-", protein_range[2], ")"), 
    add.length = 0.45)
  
  
  # 2. Add protein features 
  if (hasArg(data_features)) {
    if ("Entry" %in% names(data_features)) {
      data_features <- data_features %>% 
        filter(Entry == protein)
    }
    p <- p %>% 
      .plot_protein_features(data_sites = data_features, 
                             p = ., 
                             merge_name_position = T, 
                             add.length = 0.5, 
                             multiple_scaling_factor = 8, 
                             legend_width = 4)
  } 
  
  
  # 3a. Use log2.fc
  if ("log2.fc" %in% names(data$data_peptides)) {
    
    p <- p %>% 
      # 3. add peptides on top 
      .plot_peptides_on_seq(data_peptides = data$data_peptides %>% 
                              filter(Protein.Group == protein) %>% 
                              mutate(peptide_type = "regular") %>% 
                              mutate(log2.fc = replace_na(log2.fc, 0)) %>% 
                              mutate(label = paste0(Peptide.Id, " [", from, 
                                                    "-", to, "]")), 
                            yvalue = "log2.fc", 
                            color = "regulation", 
                            color.scale = c(destabilized = "#FF0000", # "red", 
                                            stabilized = "#0000FF"), # "blue", 
                            linewidth = "peptide_type", 
                            alpha = "peptide_type", 
                            Start = "from", 
                            End = "to",  
                            base_size = 16, 
                            #protein_range = protein_range, 
                            add.length = 0.45, 
                            add.labels = replace(protein_range[1], 
                                                 is.na(protein_range[1]), 
                                                 1) != 1, 
                            label = "label") + 
      labs(y = expression(paste(log[2], " fold-change")))
    
    # 3b. Use pEC50_signed
  } else if ("pEC50_signed" %in% names(data$data_peptides)) {
    
    p <- p %>% 
      # 3. add peptides on top 
      .plot_peptides_on_seq(data_peptides = data$data_peptides %>% 
                              filter(Protein.Group == protein) %>% 
                              mutate(peptide_type = "regular") %>% 
                              mutate(pEC50_signed = replace_na(pEC50_signed, 0)) %>% 
                              mutate(label = paste0(Peptide.Id, " [", from, 
                                                    "-", to, "]")), 
                            yvalue = "pEC50_signed", 
                            color = "regulation", 
                            color.scale = parameters$peptide_colors, 
                            linewidth = "peptide_type", 
                            alpha = "peptide_type", 
                            Start = "from", 
                            End = "to", 
                            base_size = 16, 
                            #protein_range = protein_range, 
                            add.length = 0.45, 
                            add.labels = replace(protein_range[1], 
                                                 is.na(protein_range[1]), 
                                                 1) != 1, 
                            label = "label") + 
      labs(y = expression(paste("signed ", pEC[50])))
    
  } 
  
  p + 
    guides(color = guide_legend(position = "right"), 
           fill = guide_legend(title = "features", 
                               position = "bottom", 
                               ncol = 4), 
           linewidth = "none", 
           alpha = "none") + 
    theme(legend.position = "bottom")
  
}
