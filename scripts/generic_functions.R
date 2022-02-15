#Funtion to extract the count matrix of a seurat object.
create_count_matrix <- function(seurat_object){
  counts <-  as(seurat_object@assays$RNA@counts, "dgCMatrix")
  
  # Make the column names as the cell IDs and the row names as the gene IDs
  rownames(counts) <- rownames(seurat_object@assays$RNA@counts)
  colnames(counts) <- seurat_object@meta.data$index_cell_id
  
  counts
}

#Funtion to create a Eset object base on features as parameters.
getESET <- function (exprs, fdata, pdata)
{
  pdata <- as.data.frame(pdata)
  fdata <- as.data.frame(fdata)
  exprs <- Matrix(exprs, sparse = TRUE)
  rownames(pdata) <- colnames(exprs)
  rownames(fdata) <- rownames(exprs)
  eset <- ExpressionSet(exprs, AnnotatedDataFrame(pdata),
                        AnnotatedDataFrame(fdata))
}

#Function to create a set of vln plots based on a seurat object
plot.vln.seurat <- function(seurat.smc, idents.object){
  Idents(seurat.smc) <- idents.object
  
  plot.all <- VlnPlot(seurat.smc, features = c("nFeature_RNA", "nCount_RNA", 'percent.mt'), ncol = 1)   + theme(legend.position = 'top')
  print(plot.all)
  plot.percent.mt <- VlnPlot(object = seurat.smc, features = c("percent.mt"), ncol = 1) + theme(legend.position = 'down')
  print(plot.percent.mt)
  plot.nFeature_RNA <- VlnPlot(object = seurat.smc, features = c("nFeature_RNA"), ncol = 1) + theme(legend.position = 'top')
  plot.nCount_RNA <- VlnPlot(object = seurat.smc, features = c("nCount_RNA"), ncol = 1) + theme(legend.position = 'none')
}

#Function to plot the sorted proportions of the deconvolution for the SMC dataset.
smc.plot.proportions.sorting <- function(title = NULL, data.plot.proportions.df.melt = NULL){
  data.plot.proportions.df.melt$translated_label <- factor(data.plot.proportions.df.melt$translated_label, levels= rev(list.columns.samples.all.df$translated_label))
  
  color.palette <- c("#ff205b", "#06cd6c", "#019bde", "#af5aba",
                     "#ffc51f", "#f28622", "#a1b1ba", "#a7761d", "#ff7fa7")
  
  #plot with all the samples
  proportions.deconvolution.epithelial.plot.all <- 
    ggplot(data=data.plot.proportions.df.melt, aes(x=translated_label, y=proportion, fill=Cell_subtype)) +
    geom_bar(position="fill", stat="identity") + theme_minimal()  +
    coord_flip() + 
    scale_fill_manual(values = color.palette) +
    xlab("Sample") + 
    ylab("Proportion (%)") + labs(fill = "Cell type", title=title)
}

#Create the eset object with the sparse capability for the SMC dataset.
create_sparse_eset_object_smc_kul3 <- function(count, seurat_object){
  sparse_matrix <- as(count, "dgCMatrix")
  fdata.dataset <- rownames(sparse_matrix)
  pdata.dataset <- cbind(patient = seurat_object@meta.data$Patient, 
                         class = as.character(seurat_object@meta.data$Class),           
                         sample = as.character(seurat_object@meta.data$Sample), 
                         cell_type = as.character(seurat_object@meta.data$Cell_type),
                         cell_subtype = as.character(seurat_object@meta.data$Cell_subtype),
                         cluster_normalized = as.character(seurat_object@meta.data$cluster_normalized), 
                         cluster_normalized_cell_type = as.character(seurat_object@meta.data$cluster_normalized_Cell_type))
  eset.sc.sparse <- getESET(sparse_matrix, fdata = fdata.dataset, pdata = pdata.dataset)
  
  eset.sc.sparse
}

#Create the eset object with the sparse capability for the Qian dataset.
create_sparse_eset_object_Qian <- function(count, seurat_object){
  sparse_matrix <- as(count, "dgCMatrix")
  fdata.dataset <- rownames(sparse_matrix)
  pdata.dataset <- cbind(CellFromTumor = seurat_object@meta.data$CellFromTumor, 
                         PatientNumber = as.character(seurat_object@meta.data$PatientNumber),           
                         TumorType = as.character(seurat_object@meta.data$TumorType), 
                         TumorSite = as.character(seurat_object@meta.data$TumorSite),
                         CellType = as.character(seurat_object@meta.data$CellType),
                         cluster_normalized = as.character(seurat_object@meta.data$cluster_normalized))
  eset.sc.sparse <- getESET(sparse_matrix, fdata = fdata.dataset, pdata = pdata.dataset)
  
  eset.sc.sparse
}

#Function to plot the sorted proportions of the deconvolution for the Qian dataset.
Qian.plot.proportions.sorting <- function(title = NULL){
  Qian.data.plot.proportions.df.melt$translated_label <- factor(Qian.data.plot.proportions.df.melt$translated_label, levels= rev(list.columns.samples.all.df$translated_label))
  
  color.palette <- c("#ff205b", "#019bde", "#06cd6c", "#af5aba")
  
  #plot with all the samples
  proportions.deconvolution.Qian.plot.all <- 
    ggplot(data=Qian.data.plot.proportions.df.melt, aes(x=translated_label, y=proportion, fill=CellType)) +
    geom_bar(position="fill", stat="identity") + theme_minimal()  +
    coord_flip() + 
    scale_fill_manual(values = color.palette) +
    xlab("Sample") + 
    ylab("Proportion (%)") + labs(fill = "Cell type", title=title)
}