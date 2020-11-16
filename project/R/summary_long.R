summary_long <- function(x){
  datasum<-c()
  for(i in 1:length(x)){
    datasum<-rbind(datasum,cbind(rep(names(x)[i],nrow(x[[1]])),rownames(x[[1]]),
                                 x[[i]]$`V(G)/Vp`,x[[i]]$n))
  }
  datasum<-as.data.frame(datasum)
  colnames(datasum)  <- c('tissue','pathway','hsquare','n')
  return(datasum)
}
