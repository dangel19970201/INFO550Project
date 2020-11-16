#! /usr/bin/env Rscript

# read data
load("raw_data/resultg.RData")
load("raw_data/resultp.RData")
load("raw_data/results.RData")
load("raw_data/resultz.RData")

# summary data
source("R/summary_matrix.R")
summaryg <-summary_matrix(resultg)
summaryp <-summary_matrix(resultp)
summarys <-summary_matrix(results)
summaryz <-summary_matrix(resultz)


# save data
outf="data/"
write.csv(summaryg,file=paste0(outf,"summaryg.csv"),quote=F,row.names=T,col.names=T)
write.csv(summaryp,file=paste0(outf,"summaryp.csv"),quote=F,row.names=T,col.names=T)
write.csv(summarys,file=paste0(outf,"summarys.csv"),quote=F,row.names=T,col.names=T)
write.csv(summaryz,file=paste0(outf,"summaryz.csv"),quote=F,row.names=T,col.names=T)
