#' UniProt data fields by category
#'
#' Named list of named character vectors (label = field name) to be used as 
#' the `fields` argument of get_UniProt_data(), get_UniProt_data_1o() and 
#' get_UniProt_data_o().
#'
#' @source <https://rest.uniprot.org/configure/uniprotkb/result-fields>
#' @export
#'
#' @examples
#' .UniProt_fields$`Gene Ontology (GO)`
.UniProt_fields <- list(
  `Names & Taxonomy` = c("Entry Name" = "id",
                         "Gene Names" = "gene_names",
                         "Gene Names (ordered locus)" = "gene_oln",
                         "Gene Names (ORF)" = "gene_orf",
                         "Gene Names (primary)" = "gene_primary",
                         "Gene Names (synonym)" = "gene_synonym",
                         "Organism" = "organism_name",
                         "Organism (ID)" = "organism_id",
                         "Protein names" = "protein_name",
                         "Proteomes" = "xref_proteomes",
                         "Taxonomic lineage" = "lineage",
                         "Taxonomic lineage (Ids)" = "lineage_ids",
                         "Virus hosts" = "virus_hosts"), 
  Sequences = c("Alternative products (isoforms)" = "cc_alternative_products",
                "Alternative sequence" = "ft_var_seq",
                "Erroneous gene model prediction" = "cc_sc_epred",
                "Fragment" = "fragment",
                "Encoded in" = "encoded_in",
                "Length" = "length",
                "Mass" = "mass",
                "Mass spectrometry" = "cc_mass_spectrometry",
                "Natural variant" = "ft_variant",
                "Non-adjacent residues" = "ft_non_cons",
                "Non-standard residue" = "ft_non_std",
                "Non-terminal residue" = "ft_non_ter",
                "Polymorphism" = "cc_polymorphism",
                "RNA Editing" = "cc_rna_editing",
                "Sequence" = "sequence",
                "Sequence caution" = "cc_sequence_caution",
                "Sequence conflict" = "ft_conflict",
                "Sequence uncertainty" = "ft_unsure",
                "Sequence version" = "sequence_version"), 
  Function = c("Absorption" = "absorption",
               "Active site" = "ft_act_site",
               "Binding site" = "ft_binding",
               "Catalytic activity" = "cc_catalytic_activity",
               "Cofactor" = "cc_cofactor",
               "DNA binding" = "ft_dna_bind",
               "EC number" = "ec",
               "Activity regulation" = "cc_activity_regulation",
               "Function [CC]" = "cc_function",
               "Kinetics" = "kinetics",
               "Pathway" = "cc_pathway",
               "pH dependence" = "ph_dependence",
               "Redox potential" = "redox_potential",
               "Rhea ID" = "rhea",
               "Site" = "ft_site",
               "Temperature dependence" = "temp_dependence"), 
  Miscellaneous = c("Annotation" = "annotation_score",
                    "Caution" = "cc_caution",
                    "Keywords" = "keyword",
                    "Keyword ID" = "keywordid",
                    "Miscellaneous [CC]" = "cc_miscellaneous",
                    "Protein existence" = "protein_existence",
                    "Reviewed" = "reviewed",
                    "Tools" = "tools",
                    "UniParc" = "uniparc_id",
                    "Comments" = "comment_count",
                    "Features" = "feature_count"), 
  Interaction = c("Interacts with" = "cc_interaction",
                  "Subunit structure" = "cc_subunit"), 
  Expression = c("Developmental stage" = "cc_developmental_stage",
                 "Induction" = "cc_induction",
                 "Tissue specificity" = "cc_tissue_specificity"), 
  `Gene Ontology (GO)` = c("Gene Ontology (biological process)" = "go_p",
                           "Gene Ontology (cellular component)" = "go_c",
                           "Gene Ontology (GO)" = "go",
                           "Gene Ontology (molecular function)" = "go_f",
                           "Gene Ontology IDs" = "go_id"), 
  `Pathology & Biotech` = c("Allergenic Properties" = "cc_allergen",
                            "Biotechnological use" = "cc_biotechnology",
                            "Disruption phenotype" = "cc_disruption_phenotype",
                            "Involvement in disease" = "cc_disease",
                            "Mutagenesis" = "ft_mutagen",
                            "Pharmaceutical use" = "cc_pharmaceutical",
                            "Toxic dose" = "cc_toxic_dose"), 
  `Subcellular location` = c("Intramembrane" = "ft_intramem",
                             "Subcellular location [CC]" = "cc_subcellular_location",
                             "Topological domain" = "ft_topo_dom",
                             "Transmembrane" = "ft_transmem"), 
  `PTM / Processing` = c("Chain" = "ft_chain",
                         "Cross-link" = "ft_crosslnk",
                         "Disulfide bond" = "ft_disulfid",
                         "Glycosylation" = "ft_carbohyd",
                         "Initiator methionine" = "ft_init_met",
                         "Lipidation" = "ft_lipid",
                         "Modified residue" = "ft_mod_res",
                         "Peptide" = "ft_peptide",
                         "Post-translational modification" = "cc_ptm",
                         "Propeptide" = "ft_propep",
                         "Signal peptide" = "ft_signal",
                         "Transit peptide" = "ft_transit"), 
  Structure = c("3D" = "structure_3d",
                "Beta strand" = "ft_strand",
                "Helix" = "ft_helix",
                "Turn" = "ft_turn"), 
  Publications = c("PubMed ID" = "lit_pubmed_id",
                   "DOI ID" = "lit_doi_id"), 
  `Date of` = c("Date of creation" = "date_created",
                "Date of last modification" = "date_modified",
                "Date of last sequence modification" = "date_sequence_modified",
                "Entry version" = "version"), 
  `Family & Domains` = c("Coiled coil" = "ft_coiled",
                         "Compositional bias" = "ft_compbias",
                         "Domain [CC]" = "cc_domain",
                         "Domain [FT]" = "ft_domain",
                         "Motif" = "ft_motif",
                         "Protein families" = "protein_families",
                         "Region" = "ft_region",
                         "Repeat" = "ft_repeat",
                         "Sequence similarities" = "cc_similarity",
                         "Zinc finger" = "ft_zn_fing"), 
  # External Resources 
  xref_Sequence = c("CCDS" = "xref_ccds",
                    "EMBL" = "xref_embl",
                    "GeneRIF" = "xref_generif",
                    "PIR" = "xref_pir",
                    "RefSeq" = "xref_refseq"), 
  `xref_3D structure` = c("AlphaFoldDB" = "xref_alphafolddb",
                          "BMRB" = "xref_bmrb",
                          "EMDB" = "xref_emdb",
                          "MDposit" = "xref_mdposit",
                          "MDRepo" = "xref_mdrepo",
                          "PCDDB" = "xref_pcddb",
                          "PDB" = "xref_pdb_full",
                          "PDBsum" = "xref_pdbsum",
                          "SASBDB" = "xref_sasbdb",
                          "SMR" = "xref_smr"), 
  `xref_Protein-protein interaction` = c("BioGRID" = "xref_biogrid_full",
                                         "CORUM" = "xref_corum",
                                         "ComplexPortal" = "xref_complexportal_full",
                                         "DIP" = "xref_dip",
                                         "ELM" = "xref_elm",
                                         "FunCoup" = "xref_funcoup",
                                         "IntAct" = "xref_intact_full",
                                         "MINT" = "xref_mint",
                                         "NDEx" = "xref_ndex",
                                         "STRING" = "xref_string"), 
  xref_Chemistry = c("BindingDB" = "xref_bindingdb",
                     "ChEBI" = "xref_chebi",
                     "ChEMBL" = "xref_chembl",
                     "DrugBank" = "xref_drugbank",
                     "DrugCentral" = "xref_drugcentral",
                     "GuidetoPHARMACOLOGY" = "xref_guidetopharmacology",
                     "SwissLipids" = "xref_swisslipids"), 
  `xref_Protein family/group` = c("Allergome" = "xref_allergome",
                                  "CARD" = "xref_card",
                                  "CAZy" = "xref_cazy",
                                  "ESTHER" = "xref_esther",
                                  "IMGT_GENE-DB" = "xref_imgt_gene-db",
                                  "MEROPS" = "xref_merops",
                                  "MoonDB" = "xref_moondb",
                                  "MoonProt" = "xref_moonprot",
                                  "PeroxiBase" = "xref_peroxibase",
                                  "REBASE" = "xref_rebase",
                                  "TCDB" = "xref_tcdb",
                                  "UniLectin" = "xref_unilectin"), 
  xref_PTM = c("CarbonylDB" = "xref_carbonyldb",
               "DEPOD" = "xref_depod",
               "GlyConnect" = "xref_glyconnect",
               "GlyCosmos" = "xref_glycosmos",
               "GlyGen" = "xref_glygen",
               "MetOSite" = "xref_metosite",
               "PhosphoSitePlus" = "xref_phosphositeplus",
               "SwissPalm" = "xref_swisspalm",
               "UniCarbKB" = "xref_unicarbkb",
               "iPTMnet" = "xref_iptmnet"), 
  `xref_Genetic variation` = c("Alzforum" = "xref_alzforum",
                               "BioMuta" = "xref_biomuta",
                               "DMDM" = "xref_dmdm",
                               "dbSNP" = "xref_dbsnp"), 
  `xref_2D gel` = c("OGP" = "xref_ogp",
                    "REPRODUCTION-2DPAGE" = "xref_reproduction-2dpage"), 
  xref_Proteomic = c("CPTAC" = "xref_cptac",
                     "MassIVE" = "xref_massive",
                     "PRIDE" = "xref_pride",
                     "PaxDb" = "xref_paxdb",
                     "PeptideAtlas" = "xref_peptideatlas",
                     "ProMEX" = "xref_promex",
                     "ProteomicsDB" = "xref_proteomicsdb",
                     "Pumba" = "xref_pumba",
                     "TopDownProteomics" = "xref_topdownproteomics",
                     "jPOST" = "xref_jpost"), 
  `xref_Protocols and materials` = c("ABCD" = "xref_abcd",
                                     "Antibodypedia" = "xref_antibodypedia",
                                     "CPTC" = "xref_cptc",
                                     "DNASU" = "xref_dnasu",
                                     "YCharOS" = "xref_ycharos"), 
  `xref_Genome annotation` = c("Ensembl" = "xref_ensembl",
                               "EnsemblBacteria" = "xref_ensemblbacteria",
                               "EnsemblFungi" = "xref_ensemblfungi",
                               "EnsemblMetazoa" = "xref_ensemblmetazoa",
                               "EnsemblPlants" = "xref_ensemblplants",
                               "EnsemblProtists" = "xref_ensemblprotists",
                               "GeneID" = "xref_geneid",
                               "Gramene" = "xref_gramene",
                               "KEGG" = "xref_kegg",
                               "MANE-Select" = "xref_mane-select",
                               "PATRIC" = "xref_patric",
                               "UCSC" = "xref_ucsc",
                               "VectorBase" = "xref_vectorbase",
                               "WBParaSite" = "xref_wbparasite"), 
  `xref_Organism-specific` = c("AGR" = "xref_agr",
                               "ArachnoServer" = "xref_arachnoserver",
                               "Araport" = "xref_araport",
                               "CGD" = "xref_cgd",
                               "CIViC" = "xref_civic",
                               "CTD" = "xref_ctd",
                               "ClinPGx" = "xref_clinpgx",
                               "ConoServer" = "xref_conoserver",
                               "DisGeNET" = "xref_disgenet",
                               "EchoBASE" = "xref_echobase",
                               "FlyBase" = "xref_flybase",
                               "GeneCards" = "xref_genecards",
                               "GeneReviews" = "xref_genereviews",
                               "HGNC" = "xref_hgnc",
                               "HPA" = "xref_hpa",
                               "IC4R" = "xref_ic4r",
                               "JaponicusDB" = "xref_japonicusdb",
                               "LegioList" = "xref_legiolist",
                               "Leproma" = "xref_leproma",
                               "MGI" = "xref_mgi",
                               "MIM" = "xref_mim",
                               "MaizeGDB" = "xref_maizegdb",
                               "MalaCards" = "xref_malacards",
                               "NIAGADS" = "xref_niagads",
                               "OpenTargets" = "xref_opentargets",
                               "Orphanet" = "xref_orphanet",
                               "PomBase" = "xref_pombase",
                               "PseudoCAP" = "xref_pseudocap",
                               "RGD" = "xref_rgd",
                               "SGD" = "xref_sgd",
                               "TAIR" = "xref_tair",
                               "TubercuList" = "xref_tuberculist",
                               "VEuPathDB" = "xref_veupathdb",
                               "VGNC" = "xref_vgnc",
                               "WormBase" = "xref_wormbase",
                               "Xenbase" = "xref_xenbase",
                               "ZFIN" = "xref_zfin",
                               "dictyBase" = "xref_dictybase",
                               "euHCVdb" = "xref_euhcvdb"), 
  xref_Phylogenomic = c("GeneTree" = "xref_genetree",
                        "HOGENOM" = "xref_hogenom",
                        "InParanoid" = "xref_inparanoid",
                        "OMA" = "xref_oma",
                        "OrthoDB" = "xref_orthodb",
                        "PAN-GO" = "xref_pan-go",
                        "PhylomeDB" = "xref_phylomedb",
                        "eggNOG" = "xref_eggnog"), 
  `xref_Enzyme and pathway` = c("BRENDA" = "xref_brenda",
                                "BioCyc" = "xref_biocyc",
                                "PathwayCommons" = "xref_pathwaycommons",
                                "PlantReactome" = "xref_plantreactome",
                                "Reactome" = "xref_reactome",
                                "SABIO-RK" = "xref_sabio-rk",
                                "SIGNOR" = "xref_signor",
                                "STRENDA-DB" = "xref_strenda-db",
                                "SignaLink" = "xref_signalink",
                                "UniPathway" = "xref_unipathway"), 
  xref_Miscellaneous = c("Agora" = "xref_agora",
                         "BioGRID-ORCS" = "xref_biogrid-orcs",
                         "CD-CODE" = "xref_cd-code",
                         "ChiTaRS" = "xref_chitars",
                         "EvolutionaryTrace" = "xref_evolutionarytrace",
                         "GeneWiki" = "xref_genewiki",
                         "GenomeRNAi" = "xref_genomernai",
                         "ORCID" = "xref_orcid",
                         "PGenN" = "xref_pgenn",
                         "PHI-base" = "xref_phi-base",
                         "PRO" = "xref_pro",
                         "Pharos" = "xref_pharos",
                         "PubTator" = "xref_pubtator",
                         "RNAct" = "xref_rnact",
                         "eMIND" = "xref_emind"), 
  `xref_Gene expression` = c("AbasyAtlas" = "xref_abasyatlas",
                             "Bgee" = "xref_bgee",
                             "CleanEx" = "xref_cleanex",
                             "CollecTF" = "xref_collectf",
                             "ExpressionAtlas" = "xref_expressionatlas"), 
  `xref_Family and domain` = c("AntiFam" = "xref_antifam_full",
                               "CDD" = "xref_cdd_full",
                               "DisProt" = "xref_disprot",
                               "FunFam" = "xref_funfam_full",
                               "Gene3D" = "xref_gene3d_full",
                               "HAMAP" = "xref_hamap_full",
                               "IDEAL" = "xref_ideal",
                               "InterPro" = "xref_interpro_full",
                               "NCBIfam" = "xref_ncbifam_full",
                               "PANTHER" = "xref_panther_full",
                               "PIRSF" = "xref_pirsf_full",
                               "PRINTS" = "xref_prints_full",
                               "PROSITE" = "xref_prosite_full",
                               "Pfam" = "xref_pfam_full",
                               "SFLD" = "xref_sfld_full",
                               "SMART" = "xref_smart_full",
                               "SUPFAM" = "xref_supfam_full"))


#' Return list of vectors of UniProt data fields (see .UniProt_fields)
#'
#' @returns named list of named character vectors
#' @export
#'
#' @examples
#' UniProt_fields()
UniProt_fields <- function() {

  return(.UniProt_fields)

}


#' Download UniProt data for given protein accessions and data fields
#' (see available fields with .UniProt_fields)
#'
#' @param accession vector of UniProt accessions 
#' @param fields UniProt data fields to query
#' @param max.query maximum number of accessions to query at once; if the 
#' the number exceeds max.query, the query is split up in multiple parts 
#'
#' @returns
#' @export
#'
#' @examples
get_UniProt_data <- function(accession, 
                             fields = c("accession", 
                                        "gene_names", 
                                        "organism_name"), 
                             max.query = 100) {
  
  .require_pkg("vroom", "get_UniProt_data")
  
  # Add accession as field
  if (!"accession" %in% fields) fields <- c("accession", fields)
  
  # Check fields
  fields <- fields[!is.na(fields)]
  fields_unknown <- setdiff(stringr::str_remove(fields, "_full$"), 
                            stringr::str_remove(c("accession", unlist(.UniProt_fields)), "_full$"))
  if (length(fields_unknown) > 0) 
    stop("Unknown UniProt field(s): <", paste(fields_unknown, collapse = ">, <"), 
         ">. See .UniProt_fields for available fields.")
  
  # Check accession for ;
  if (any(stringr::str_detect(accession, ";"))) 
    stop("There are accessions contanining a semicolon (;);, please remove or correct protein groups with multiple Ids.")
  
  # Only query unique accessions 
  accession_query <- unique(accession)
  
  
  # Formulate query/ies and download data 
  if (length(accession_query) > max.query) {
    
    l <- length(accession_query)
    from <- seq(1, l, max.query)
    to <- c(seq(1, l, max.query)[-1] - 1, l)
    
    data_download <- purrr::map2(from, to, 
                                 \(from, to) get_UniProt_data(accession_query[from:to], 
                                                              fields = fields, 
                                                              max.query = max.query)) %>% 
      bind_rows()
    
  } else {
    
    query_url <- paste0("https://rest.uniprot.org/uniprotkb/stream?", 
                        "format=tsv", 
                        "&fields=", 
                        paste(fields, collapse = "%2C"), 
                        "&query=", 
                        paste(
                          paste0("accession%3A", accession_query), 
                          collapse = "+OR+"))
    
    data_download <- vroom::vroom(query_url, 
                                  delim = "\t", 
                                  col_types = vroom::cols())
    
  }
  
  # Merge given accessions and downloaded data 
  data_output <- dplyr::left_join(tibble::tibble(Entry = accession), 
                                  data_download, 
                                  by = "Entry")
  
  # Return tibble with accessions as Entry and data columns 
  return(data_output)
  
}


#' Download UniProt data for given protein accessions, multiple taxonomy 
#' identifiers and data fields (faster for 1000s of proteins; see available fields with 
#' .UniProt_fields)
#'
#' @param accession vector of UniProt accessions 
#' @param fields UniProt data fields to query
#' @param taxon_id taxonomy Id
#'
#' @returns
#' @export
#'
#' @examples
get_UniProt_data_1o <- function(accession, 
                                fields = c("accession", 
                                           "gene_names", 
                                           "organism_name"), 
                                taxon_id = c(human = 9606, 
                                             mouse = 10090, 
                                             E.coliK12 = 83333)) {
  
  .require_pkg("vroom", "get_UniProt_data_1o")
  
  # Check organism identifier
  if (length(taxon_id) > 1) 
    warning("More than one taxon_id provided, only using the first one.")
  
  # Add accession as field
  if (!"accession" %in% fields) fields <- c("accession", fields)
  
  # Check fields
  fields <- fields[!is.na(fields)]
  fields_unknown <- setdiff(stringr::str_remove(fields, "_full$"), 
                            stringr::str_remove(c("accession", unlist(.UniProt_fields)), "_full$"))
  if (length(fields_unknown) > 0) 
    stop("Unknown UniProt field(s): <", paste(fields_unknown, collapse = ">, <"), 
         ">. See .UniProt_fields for available fields.")
  
  
  # Formulate query and download data 
  query_url <- paste0("https://rest.uniprot.org/uniprotkb/stream?", 
                      "format=tsv", 
                      "&fields=", 
                      paste(fields, collapse = "%2C"), 
                      "&query=%28taxonomy_id%3A", 
                      taxon_id[1], "%29")
  
  data_download <- vroom::vroom(query_url, 
                                delim = "\t", 
                                col_types = vroom::cols())
  
  
  # Merge given accessions and downloaded data 
  if (hasArg(accession)) {
    data_output <- dplyr::left_join(tibble::tibble(Entry = accession), 
                                    data_download, 
                                    by = "Entry")
  } else {
    data_output <- data_download
  }
  
  
  # Return tibble with accessions as Entry and data columns 
  return(data_output)
  
}


#' Download UniProt data for given protein accessions, taxonomy identifiers and 
#' data fields (faster for 1000s of proteins; see available fields with 
#' .UniProt_fields)
#'
#' @param accession vector of UniProt accessions 
#' @param fields UniProt data fields to query
#' @param taxon_ids taxonomy Ids
#'
#' @returns
#' @export
#'
#' @examples
get_UniProt_data_o <- function(accession, 
                               fields = c("accession", 
                                          "gene_names", 
                                          "organism_name"), 
                               taxon_ids = c(human = 9606, 
                                             mouse = 10090, 
                                             E.coliK12 = 83333)) {
  
  .require_pkg("vroom", "get_UniProt_data_o")
  
  # Check organism identifier
  # if (length(taxon_id) > 1) 
  #   warning("More than one taxon_id provided, only using the first one.")
  
  # Add accession as field
  if (!"accession" %in% fields) fields <- c("accession", fields)
  
  # Check fields
  fields <- fields[!is.na(fields)]
  fields_unknown <- setdiff(stringr::str_remove(fields, "_full$"), 
                            stringr::str_remove(c("accession", unlist(.UniProt_fields)), "_full$"))
  if (length(fields_unknown) > 0) 
    stop("Unknown UniProt field(s): <", paste(fields_unknown, collapse = ">, <"), 
         ">. See .UniProt_fields for available fields.")
  
  data_download <- purrr::map(
    taxon_ids, 
    \(x) {
      
      # Formulate query and download data 
      query_url <- paste0("https://rest.uniprot.org/uniprotkb/stream?", 
                          "format=tsv", 
                          "&fields=", 
                          paste(fields, collapse = "%2C"), 
                          "&query=%28taxonomy_id%3A", 
                          x, "%29")
      
      vroom::vroom(query_url, 
                   delim = "\t", 
                   col_types = vroom::cols())}) %>% 
    dplyr::bind_rows()
  
  
  # Merge given accessions and downloaded data 
  if (hasArg(accession)) {
    data_output <- dplyr::left_join(tibble::tibble(Entry = accession), 
                                    data_download, 
                                    by = "Entry")
  } else {
    data_output <- data_download
  }
  
  
  # Return tibble with accessions as Entry and data columns 
  return(data_output)
  
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
      str_extract('^[A-Z_]+') %>% 
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
             from = str_extract(position, "[^-]+") %>% 
               as.numeric(), 
             to = str_extract(position, "[^-]+$") %>% 
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


#' Get quick information about a protein from its UniProt accession
#'
#' @param x protein accession
#'
#' @returns
#' @export
#'
#' @examples
#'\dontrun{
#'whos_that_protein("P06993")
#'}
whos_that_protein <- function(x) {
  
  x <- stringr::str_extract(x, "[^;]+")
  
  data_UniProt <- get_UniProt_data(x, 
                                   fields = c("gene_primary", 
                                              "protein_name", 
                                              "organism_name"))
  
  cat(
    paste0("Entry: ", data_UniProt$Entry), 
    paste0("Gene: ", data_UniProt$`Gene Names (primary)`), 
    paste0("Description: ", str_extract(data_UniProt$`Protein names`, "[^(]+")), 
    paste0("Organism: ", data_UniProt$Organism),
    cli::style_hyperlink(
      text = paste0("https://www.uniprot.org/uniprotkb/", x),
      url = paste0("https://www.uniprot.org/uniprotkb/", x)
    ), 
    sep = "\n"
  )
  
  return(invisible(data_UniProt$`Gene Names (primary)`))
}


#' Get quick information about a protein from its UniProt accession with 
#' extra function description 
#'
#' @param x protein accession 
#'
#' @returns
#' @export
#'
#' @examples
#'\dontrun{
#'whos_that_proteinx("P06993")
#'}
whos_that_proteinx <- function(x) {
  
  x <- stringr::str_extract(x, "[^;]+")
  
  data_UniProt <- get_UniProt_data(x, 
                                   fields = c("gene_primary", 
                                              "protein_name", 
                                              "organism_name", 
                                              "cc_function"))
  
  message(paste0("Entry: ", data_UniProt$Entry))
  message(paste0("Gene: ", data_UniProt$`Gene Names (primary)`)) 
  message(paste0("Description: ", str_extract(data_UniProt$`Protein names`, "[^(]+"))) 
  message(paste0("Organism: ", data_UniProt$Organism))
  message(paste0("Function: ", str_extract(data_UniProt$`Function [CC]`, "[^{]+")))
  
  cat(
    paste0("Entry: ", data_UniProt$Entry), 
    paste0("Gene: ", data_UniProt$`Gene Names (primary)`), 
    paste0("Description: ", str_extract(data_UniProt$`Protein names`, "[^(]+")), 
    paste0("Organism: ", data_UniProt$Organism),
    "", 
    paste0("Function: ", str_extract(data_UniProt$`Function [CC]`, "(?<=FUNCTION: )[^{]+")),
    "", 
    cli::style_hyperlink(
      text = paste0("https://www.uniprot.org/uniprotkb/", x),
      url = paste0("https://www.uniprot.org/uniprotkb/", x)
    ), 
    sep = "\n"
  )
  
  return(invisible(data_UniProt$`Gene Names (primary)`))
}

