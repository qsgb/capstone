library(stringr)
library(NLP)
library(tm)
library(magrittr)
load("n-gram.RData")

backoff <- function(text) {
  
  # clean text
  words <- tolower(text) %>%
    removePunctuation %>%
    removeNumbers %>%
    stripWhitespace %>%
    str_trim %>%
    strsplit(split=" ") %>%
    unlist
  
  max<-3
  i<-length(words)
  if (i==0){ 
    return("Invalid input")
  } else {
    for (j in min(i,max):1){
      ind<- grep(paste("^", paste(tail(words, j),collapse = " "), sep=""),data[[j]]$txt)
     texts<-strsplit(as.character(head(data[[j]]$txt[ind],3)),split=" ")
     predict<-sapply(texts,function(x)tail(x,1))
    if (length(predict)>=3) break
     }
  }
  if(length(predict)!=0){ 
    return(predict)
    
  } else {
    return(as.character(uni$txt))
  }
}
  
  