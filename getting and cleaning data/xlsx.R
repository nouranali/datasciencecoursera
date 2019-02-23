library(rJava)
library(xlsx)
fileur <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
dffile <- download.file(fileur,destfile = "./dataex.xlsx" ,mode = "wb")
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("dataex.xlsx", sheetIndex = 1 , colIndex = colIndex , rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)
