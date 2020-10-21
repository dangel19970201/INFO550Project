#! /usr/bin/env Rscript

library(ComplexHeatmap)
library(circlize)

# read data
summaryg <- read.csv(file="data/summaryg.csv",header = TRUE,row.names = 1)
summaryp <- read.csv(file="data/summaryp.csv",header = TRUE,row.names = 1)
summarys <- read.csv(file="data/summarys.csv",header = TRUE,row.names = 1)
summaryz <- read.csv(file="data/summaryz.csv",header = TRUE,row.names = 1)

# plot of biom1 by age and biom2 by age
png(filename ="figs/comparefig.png",
    type = "cairo",
    res = 300,
    width = 6000, height = 6000,
    bg = "transparent")
col_fun = colorRamp2(c(0,0.25, 0.5), c("blue","white","red"))
p1<-Heatmap(summarys,cluster_rows = FALSE,cluster_columns = FALSE,col = col_fun,
            name = "heritability for singscores",row_title = "KEGG Pathway", column_title = "singscores",
            row_names_gp = gpar(fontsize = 5) ,column_names_gp = gpar(fontsize = 6))
p2<-Heatmap(summaryz,cluster_rows = FALSE,cluster_columns = FALSE,col = col_fun,
            name = "heritability for z-scores",row_title = "KEGG Pathway", column_title = "z-scores",
            row_names_gp = gpar(fontsize = 5),column_names_gp = gpar(fontsize = 6))
p3<-Heatmap(summaryp,cluster_rows = FALSE,cluster_columns = FALSE,col = col_fun,
            name = "heritability for PLAGE scores",row_title = "KEGG Pathway", column_title = "PLAGE",
            row_names_gp = gpar(fontsize = 5),column_names_gp = gpar(fontsize = 6))
p4<-Heatmap(summaryg,cluster_rows = FALSE,cluster_columns = FALSE,col = col_fun,
            name = "heritability for GSVA scores",row_title = "KEGG Pathway", column_title = "GSVA",
            row_names_gp = gpar(fontsize = 5),column_names_gp = gpar(fontsize = 6))
htlist<- p1+p2+p3+p4
draw(htlist, column_title = "Tissues", column_title_gp = gpar(fontsize = 12))
dev.off()