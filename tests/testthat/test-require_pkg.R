# Helper: run .require_pkg() with some packages pretended missing, so the
# guards can be tested without actually uninstalling anything.
with_missing <- function(hidden, pkgs, fn) {
  g <- mspTools:::.require_pkg
  e <- new.env(parent = environment(g))
  assign("requireNamespace",
         function(pkg, ...) if (pkg %in% hidden) FALSE
                            else base::requireNamespace(pkg, ...),
         envir = e)
  environment(g) <- e
  g(pkgs, fn)
}


test_that(".require_pkg() passes when the packages are installed", {

  expect_null(mspTools:::.require_pkg("dplyr", "somewhere"))
  expect_null(mspTools:::.require_pkg(c("dplyr", "purrr"), "somewhere"))
})


test_that(".require_pkg() names the function and the missing package", {

  expect_error(with_missing("GO.db", "GO.db", "GO_add_ancestors"),
               "GO_add_ancestors() needs the package \"GO.db\"", fixed = TRUE)
})


test_that("Bioconductor packages are pointed at BiocManager, others at CRAN", {

  expect_error(with_missing("GO.db", "GO.db", "f"),
               'BiocManager::install("GO.db")', fixed = TRUE)
  expect_error(with_missing("AnnotationDbi", "AnnotationDbi", "f"),
               'BiocManager::install("AnnotationDbi")', fixed = TRUE)
  expect_error(with_missing("ComplexHeatmap", "ComplexHeatmap", "f"),
               'BiocManager::install("ComplexHeatmap")', fixed = TRUE)

  expect_error(with_missing("vroom", "vroom", "f"),
               'install.packages("vroom")', fixed = TRUE)
  expect_error(with_missing("httr2", "httr2", "f"),
               'install.packages("httr2")', fixed = TRUE)
  expect_error(with_missing("ggrepel", "ggrepel", "f"),
               'install.packages("ggrepel")', fixed = TRUE)
})


test_that("several missing packages are listed together, pluralised", {

  err <- tryCatch(with_missing(c("ComplexHeatmap", "ggsci"),
                               c("ComplexHeatmap", "ggsci"), "cheatmap"),
                  error = conditionMessage)

  expect_match(err, "needs the packages", fixed = TRUE)
  expect_match(err, 'BiocManager::install("ComplexHeatmap")', fixed = TRUE)
  expect_match(err, 'install.packages("ggsci")', fixed = TRUE)
})


test_that("only the absent packages are reported", {

  # ggsci present, ComplexHeatmap not
  err <- tryCatch(with_missing("ComplexHeatmap",
                               c("ComplexHeatmap", "ggsci"), "cheatmap"),
                  error = conditionMessage)

  expect_match(err, "needs the package ", fixed = TRUE)
  expect_match(err, "ComplexHeatmap", fixed = TRUE)
  expect_false(grepl("ggsci", err, fixed = TRUE))
})


test_that("every guarded function calls the guard first", {

  guarded <- c("GO_add_ancestors", "GO_filter_ontology", "GO_append_description",
               "cheatmap", "get_UniProt_data", "get_UniProt_data_1o",
               "get_UniProt_data_o", "download_UniParc_sequence_features",
               ".plot_peptides_on_seq")

  for (fn in guarded) {
    body_txt <- paste(deparse(get(fn, envir = asNamespace("mspTools"))),
                      collapse = "\n")
    expect_match(body_txt, ".require_pkg(", fixed = TRUE, info = fn)
  }
})
