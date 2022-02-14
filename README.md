
## R Notebook with scripts for running the bulk deconvolution and simulations.

You can find the following files in the repository:
1. **R Notebook with examples:** [CRC_organoids_and_fibroblasts_notebook.Rmd](CRC_organoids_and_fibroblasts_notebook.Rmd)
2. **Html with examples:** [CRC_organoids_and_fibroblasts_notebook.html](https://htmlpreview.github.io/?https://github.com/crhisto/CRC_organoids_and_fibroblasts_notebook/blob/master/CRC_organoids_and_fibroblasts_notebook.html)
2. **Additional R functions:** [generic_functions.R](scripts/generic_functions.R)
3. **Files with the Bulk data:** [merged_rsem_counts_annotated.tsv.zip](data/bulk_dataset/merged_rsem_counts_annotated.tsv.zip)

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
            
Publication: [Colorectal cancer organoids-fibroblast co-cultures closely recapitulate in vivo tumors as revealed by RNA sequencing and histochemical analyses](https://www.doi.org/)
