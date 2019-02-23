library(datasets)
data("iris")
iris
ir<- subset(iris, Species== 'virginica')
ir
avg<-mean(ir$Sepal.Length)
avg
round(avg)
meanofcol<-apply(iris[, 1:4], 2, mean)
meanofcol

##mtcars
library(datasets)
data(mtcars)
four<- subset(mtcars, cyl==4)
eight <- subset(mtcars,cyl==8)
d1 <- mean(four$hp)
d1
d2=mean(eight$hp)
d2
d<-abs(d1-d2)
round(d)