##Q1
fileurlS<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurlS,destfile = "./survey.csv",method = "curl")
sur<-read.csv("./survey.csv")
head(sur)
strsplit(names(sur),"wgtp")
##Q2

fileurlg<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurlg,destfile = "./gross.csv",method="curl")
gross<- read.csv("./gross.csv",nrows=190,skip = 4)
head(gross)
ro<- gross$X.4
ro <- as.integer(gsub(",", "" , ro))
mean(ro,na.rm = T)

#Q3
grep("^United",gross$X.3)

#Q4
fileur1<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileur2<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileur1,destfile = "./gd.csv",method = "curl")
download.file(fileur2,destfile = "./edu.csv",method = "curl")
gd<-read.csv("./gd.csv")
edu<-read.csv("./edu.csv")
library(data.table)
x4 <- fread("./gd.csv",skip = 5 ,nrows = 190,select = c(1,2,4,5),col.names =c("CountryCode", "Rank", "Economy", "Total") )

