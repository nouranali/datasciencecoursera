corr <- function (directory, threshold= 0){
  file_names <- list.files(path= directory , full.names = T)
  correlattion <- c()
  for (i in seq_along(file_names)){
    file1 <- read.csv(file_names[i])
    cnt <- sum(complete.cases(file1))
    if(cnt > threshold){
      correlattion <- c(correlattion, cor(file1$ sulfate , file1$nitrate , use= "complete.obs"))
    }
    
  }
   correlattion
}
#TEST CASES
cr <- corr("specdata", 150)
head(cr)
summary(cr)

#____________
cr <- corr("specdata", 400)
head(cr)
summary(cr)
#____________
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
#____________
cr <- corr("specdata")
summary(cr)
length(cr)