# Return list of vectors of UniProt data fields

Return list of vectors of UniProt data fields

## Usage

``` r
UniProt_fields()
```

## Examples

``` r
UniProt_fields()
#> $`Names & Taxonomy`
#>                 Entry Name                 Gene Names 
#>                       "id"               "gene_names" 
#> Gene Names (ordered locus)           Gene Names (ORF) 
#>                 "gene_oln"                 "gene_orf" 
#>       Gene Names (primary)       Gene Names (synonym) 
#>             "gene_primary"             "gene_synonym" 
#>                   Organism              Organism (ID) 
#>            "organism_name"              "organism_id" 
#>              Protein names                  Proteomes 
#>             "protein_name"           "xref_proteomes" 
#>          Taxonomic lineage    Taxonomic lineage (Ids) 
#>                  "lineage"              "lineage_ids" 
#>                Virus hosts 
#>              "virus_hosts" 
#> 
#> $Sequences
#> Alternative products (isoforms)            Alternative sequence 
#>       "cc_alternative_products"                    "ft_var_seq" 
#> Erroneous gene model prediction                        Fragment 
#>             "error_gmodel_pred"                      "fragment" 
#>                 Gene encoded by                          Length 
#>                     "organelle"                        "length" 
#>                            Mass               Mass spectrometry 
#>                          "mass"          "cc_mass_spectrometry" 
#>                 Natural variant           Non-adjacent residues 
#>                    "ft_variant"                   "ft_non_cons" 
#>            Non-standard residue            Non-terminal residue 
#>                    "ft_non_std"                    "ft_non_ter" 
#>                    Polymorphism                     RNA Editing 
#>               "cc_polymorphism"                "cc_rna_editing" 
#>                        Sequence                Sequence caution 
#>                      "sequence"           "cc_sequence_caution" 
#>               Sequence conflict            Sequence uncertainty 
#>                   "ft_conflict"                     "ft_unsure" 
#>                Sequence version 
#>              "sequence_version" 
#> 
#> $Function
#>               Absorption              Active site             Binding site 
#>             "absorption"            "ft_act_site"             "ft_binding" 
#>       Catalytic activity                 Cofactor              DNA binding 
#>  "cc_catalytic_activity"            "cc_cofactor"            "ft_dna_bind" 
#>                EC number      Activity regulation            Function [CC] 
#>                     "ec" "cc_activity_regulation"            "cc_function" 
#>                 Kinetics                  Pathway            pH dependence 
#>               "kinetics"             "cc_pathway"          "ph_dependence" 
#>          Redox potential                  Rhea ID                     Site 
#>        "redox_potential"                   "rhea"                "ft_site" 
#>   Temperature dependence 
#>        "temp_dependence" 
#> 
#> $Miscellaneous
#>          Annotation             Caution            Keywords          Keyword ID 
#>  "annotation_score"        "cc_caution"           "keyword"         "keywordid" 
#>  Miscellaneous [CC]   Protein existence            Reviewed               Tools 
#>  "cc_miscellaneous" "protein_existence"          "reviewed"             "tools" 
#>             UniParc            Comments            Features 
#>        "uniparc_id"     "comment_count"     "feature_count" 
#> 
#> $Interaction
#>    Interacts with Subunit structure 
#>  "cc_interaction"      "cc_subunit" 
#> 
#> $Expression
#>      Developmental stage                Induction       Tissue specificity 
#> "cc_developmental_stage"           "cc_induction"  "cc_tissue_specificity" 
#> 
#> $`Gene Ontology (GO)`
#> Gene Ontology (biological process) Gene Ontology (cellular component) 
#>                             "go_p"                             "go_c" 
#>                 Gene Ontology (GO) Gene Ontology (molecular function) 
#>                               "go"                             "go_f" 
#>                  Gene Ontology IDs 
#>                            "go_id" 
#> 
#> $`Pathology & Biotech`
#>     Allergenic Properties      Biotechnological use      Disruption phenotype 
#>             "cc_allergen"        "cc_biotechnology" "cc_disruption_phenotype" 
#>    Involvement in disease               Mutagenesis        Pharmaceutical use 
#>              "cc_disease"              "ft_mutagen"       "cc_pharmaceutical" 
#>                Toxic dose 
#>           "cc_toxic_dose" 
#> 
#> $`Subcellular location`
#>             Intramembrane Subcellular location [CC]        Topological domain 
#>             "ft_intramem" "cc_subcellular_location"             "ft_topo_dom" 
#>             Transmembrane 
#>             "ft_transmem" 
#> 
#> $`PTM / Processing`
#>                           Chain                      Cross-link 
#>                      "ft_chain"                   "ft_crosslnk" 
#>                  Disulfide bond                   Glycosylation 
#>                   "ft_disulfid"                   "ft_carbohyd" 
#>            Initiator methionine                      Lipidation 
#>                   "ft_init_met"                      "ft_lipid" 
#>                Modified residue                         Peptide 
#>                    "ft_mod_res"                    "ft_peptide" 
#> Post-translational modification                      Propeptide 
#>                        "cc_ptm"                     "ft_propep" 
#>                  Signal peptide                 Transit peptide 
#>                     "ft_signal"                    "ft_transit" 
#> 
#> $Structure
#>             3D    Beta strand          Helix           Turn 
#> "structure_3d"    "ft_strand"     "ft_helix"      "ft_turn" 
#> 
#> $Publications
#>       PubMed ID          DOI ID 
#> "lit_pubmed_id"    "lit_doi_id" 
#> 
#> $`Data of`
#>                   Date of creation          Date of last modification 
#>                     "date_created"                    "date_modified" 
#> Date of last sequence modification                      Entry version 
#>           "date_sequence_modified"                          "version" 
#> 
#> $`Family & Domains`
#>           Coiled coil    Compositional bias           Domain [CC] 
#>           "ft_coiled"         "ft_compbias"           "cc_domain" 
#>           Domain [FT]                 Motif      Protein families 
#>           "ft_domain"            "ft_motif"    "protein_families" 
#>                Region                Repeat Sequence similarities 
#>           "ft_region"           "ft_repeat"       "cc_similarity" 
#>           Zinc finger 
#>          "ft_zn_fing" 
#> 
#> $xref_Sequence
#>           CCDS           EMBL        GeneRIF            PIR         RefSeq 
#>    "xref_ccds"    "xref_embl" "xref_generif"     "xref_pir"  "xref_refseq" 
#> 
#> $`xref_3D structure`
#>        AlphaFoldDB               BMRB               EMDB              PCDDB 
#> "xref_alphafolddb"        "xref_bmrb"        "xref_emdb"       "xref_pcddb" 
#>                PDB             PDBsum             SASBDB                SMR 
#>    "xref_pdb_full"      "xref_pdbsum"      "xref_sasbdb"         "xref_smr" 
#> 
#> $`xref_Protein-protein interaction`
#>                   BioGRID                     CORUM             ComplexPortal 
#>       "xref_biogrid_full"              "xref_corum" "xref_complexportal_full" 
#>                       DIP                       ELM                    IntAct 
#>                "xref_dip"                "xref_elm"        "xref_intact_full" 
#>                      MINT                    STRING 
#>               "xref_mint"             "xref_string" 
#> 
#> $xref_Chemisty
#> [1] NA
#> 
#> $`xref_Protein family/group`
#> [1] NA
#> 
#> $xref_PTM
#> [1] NA
#> 
#> $`xref_Genetic variation`
#> [1] NA
#> 
#> $`xref_2D gel`
#> [1] NA
#> 
#> $xref_Proteomic
#> [1] NA
#> 
#> $`xref_Protocols and materials`
#> [1] NA
#> 
#> $`xref_Genome annotation`
#>                Ensembl        EnsemblBacteria           EnsemblFungi 
#>         "xref_ensembl" "xref_ensemblbacteria"    "xref_ensemblfungi" 
#>         EnsemblMetazoa          EnsemblPlants        EnsemblProtists 
#>  "xref_ensemblmetazoa"   "xref_ensemblplants" "xref_ensemblprotists" 
#>                 GeneID                Gramene                   KEGG 
#>          "xref_geneid"         "xref_gramene"            "xref_kegg" 
#>            MANE-Select                 PATRIC                   UCSC 
#>     "xref_mane-select"          "xref_patric"            "xref_ucsc" 
#>             VectorBase             WBParaSite 
#>      "xref_vectorbase"      "xref_wbparasite" 
#> 
#> $`xref_Organism-specific`
#> [1] NA
#> 
#> $xref_Phylogenomic
#> [1] NA
#> 
#> $`xref_Enzyme and pathway`
#> [1] NA
#> 
#> $xref_Miscellaneous
#> [1] NA
#> 
#> $`xref_Gene expression`
#> [1] NA
#> 
#> $`xref_Family and domain`
#>              AntiFam                  CDD              DisProt 
#>  "xref_antifam_full"      "xref_cdd_full"       "xref_disprot" 
#>               FunFam               Gene3D                HAMAP 
#>   "xref_funfam_full"   "xref_gene3d_full"    "xref_hamap_full" 
#>                IDEAL             InterPro              NCBIfam 
#>         "xref_ideal" "xref_interpro_full"  "xref_ncbifam_full" 
#>              PANTHER                PIRSF               PRINTS 
#>  "xref_panther_full"    "xref_pirsf_full"   "xref_prints_full" 
#>              PROSITE                 Pfam                 SFLD 
#>  "xref_prosite_full"     "xref_pfam_full"     "xref_sfld_full" 
#>                SMART               SUPFAM 
#>    "xref_smart_full"   "xref_supfam_full" 
#> 
```
