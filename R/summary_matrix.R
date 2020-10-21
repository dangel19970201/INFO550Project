summary_matrix <- function(x){
  summary <- c()
  for(i in 1:length(x)){
    summary <- cbind(summary,x[[i]]$`V(G)/Vp`)
  }
  rownames(summary) <- rownames(x[[1]])
  colnames(summary)  <- names(x)
  return(summary)
}
