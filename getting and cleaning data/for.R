library(utils)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
paste(fileUrl,"http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for")
mydata <- read.fwf(fileUrl, skip = 4,width =c(12, 7, 4, 9, 4, 9, 4, 9, 4))
sum(mydata[,4])