
## R Notebook with scripts for running the bulk deconvolution and simulations.

You can find the following files in the repository:
1. **R Notebook with examples:** [CRC_organoids_and_fibroblasts_notebook.Rmd](CRC_organoids_and_fibroblasts_notebook.Rmd)
2. **Html with examples:** [CRC_organoids_and_fibroblasts_notebook.html](https://htmlpreview.github.io/?https://htmlpreview.github.io/?https://github.com/crhisto/CRC_organoids_and_fibroblasts_notebook/blob/main/CRC_organoids_and_fibroblasts_notebook.html)
2. **Additional R functions:** [generic_functions.R](scripts/generic_functions.R)
3. **Files with the Bulk data:** 
      - Count matrix: [merged_rsem_counts_annotated.tsv.zip](data/bulk_dataset/merged_rsem_counts_annotated.tsv.zip)
      - Labels of samples: [label_translation_samples.csv.zip](data/bulk_dataset/label_translation_samples.csv.zip)
## Libraries 

In order to execute the complete pipeline, at the beginning of the R Notebook the following modified libraries must be installed:
1. *SCDC*:    
   - **Repository**: https://github.com/crhisto/SCDC
   - **Modifications**: 
     - Compatibility with sparse matrices using: `dgCMatrix` objects in R.
     - Routines with parallelization
     - Dynamic threshold for markers selection
     - Improvements in logs and so on.
   - **Original repository**: https://github.com/meichendong/SCDC
         
2. *Biobase*: 
   - **Repository**: https://github.com/crhisto/Biobase.
   - **Modifications**: Compatibility with sparse matrices using: `dgCMatrix` objects in R.
   - **Original repository**: https://github.com/Bioconductor/Biobase
            
3. *Xbioc*:   
   - **Repository**: https://github.com/crhisto/xbioc. Original repository: 
   - **Modifications**: Compatibility with sparse matrices using: `dgCMatrix` objects in R.
   - **Original repository**: https://github.com/renozao/xbioc
            
biorxiv: [Mimicking tumor cell heterogeneity of colorectal cancer in a patient-derived organoid-fibroblast model
](https://doi.org/10.1101/2022.03.07.483214)
