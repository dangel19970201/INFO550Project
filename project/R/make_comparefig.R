#! /usr/bin/env Rscript

# read data
summaryg <- read.csv(file="data/summaryg.csv",header = TRUE,row.names = 1)
summaryp <- read.csv(file="data/summaryp.csv",header = TRUE,row.names = 1)
summarys <- read.csv(file="data/summarys.csv",header = TRUE,row.names = 1)
summaryz <- read.csv(file="data/summaryz.csv",header = TRUE,row.names = 1)

# plot of biom1 by age and biom2 by age
png(filename ="figs/heatmaps.png",
    type = "cairo",
    res = 300,
    width = 6000, height = 6000,
    bg = "transparent")
heatmap(as.matrix(summarys), cexRow=0.5,cexCol=0.8, margins=c(14,18), main = "singscores")
dev.off()
png(filename ="figs/heatmapz.png",
    type = "cairo",
    res = 300,
    width = 6000, height = 6000,
    bg = "transparent")
heatmap(as.matrix(summaryz),cexRow=0.5,cexCol=0.8, margins=c(14,18), main = "z-scores")
dev.off()
png(filename ="figs/heatmapp.png",
    type = "cairo",
    res = 300,
    width = 6000, height = 6000,
    bg = "transparent")
heatmap(as.matrix(summaryp),cexRow=0.5,cexCol=0.8, margins=c(14,18), main = "PLAGE scores")
dev.off()
png(filename ="figs/heatmapg.png",
    type = "cairo",
    res = 300,
    width = 6000, height = 6000,
    bg = "transparent")
heatmap(as.matrix(summaryg),cexRow=0.5,cexCol=0.8, margins=c(14,18), main = "GSVA scores")
dev.off()