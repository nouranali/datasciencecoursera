pollutantmean <- function (directory,pollutant ,id= 1:332){
  file_names <- list.files(path= directory, full.names = T)
  results <- vector("numeric")
  for(i in id){
    data <- read.csv(file_names[i])
    results <- c(results, data[,pollutant])
  }
  mean(results, na.rm = T)
  
  
}
#TEST CASES
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
