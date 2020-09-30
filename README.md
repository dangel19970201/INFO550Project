## Repository for INFO 550 Project
Data: The eighth version of the GTEx dataset. We obtained RNA-seq gene expression levels from 15253 tissue samples (54 unique tissue types) from 948 unique subjects in the GTEx Project data released in 2017. Of the individuals with gene expression data, genome-wide genotypes were available for 838 individuals. While all 15201 tissue samples were used (to generate the quantitative traits--individual-level pathway scores such as GSVA scores, z-scores, PLAGE, and sing-scores) of gene expression, we used the 49 tissues with the largest sample sizes (n > 70) when calculating. 69763935 non-ambiguous strand SNPs were retained for subsequent analyses of heritability. 

Before the analysis, I have done the following:
1. Use 'Plink' to extract all the SNPs
2. Use 'GCTA' to calculate the GRM for each autosome and then merge the 22 GRMs
3. Use R to reformat the file of pathways scores to make them as the specific phenotype input in the GCTA software
4. Use 'GCTA' to calculate the heritability for all 186 KEGG pathways across 49 tissues

So the data used here is the summarized information about the heritability calculated before. In order to make the data anonymous, the data are simulated ones that have the same format as the original ones. 

For my project, I will do subsequent analyses of heritability, including further summarizing the heritability values, drawing heatmaps, analyzing the pattern of different methods, and so on.

To analyze the data you will need to install some R packages: ggplot2, ComplexHeatmap, circlize, dplyr. The required packages can be installed using R commands.