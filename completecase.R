complete <- function(directory ,id= 1:332){
  
  file_names <- list.files(path= directory ,full.names = T)
  ids<- c()
  d<- data.frame()
  
  for(i in id){
    file1 <- read.csv(file_names[i])
    ids<- c(ids,i)
    counts <- sum(complete.cases(file1))
   tempo <- data.frame(i,counts)
   d<- rbind(d,tempo)
  }
 colnames(d) <- c("id","nobs")
 d
}

#TEST CASES
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 30:25)
