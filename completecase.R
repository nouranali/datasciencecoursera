complete <- function(directory ,id= 1:332){
  
  file_names <- list.files(path= directory, pattern= "*.csv" ,full.names = T)
  ids<- c()
  
  for(i in seq_along(id)){
    file1 <- read.csv(file_names[i])
    ids<- c(ids,i)
    
    counts <- sum(complete.cases(file1))
  }
  data.frame(id= ids, nobs=counts)
}

#TEST CASES
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 30:25)
