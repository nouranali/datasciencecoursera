rankhospital <- function(state,outcome ,num){
        valid_outcome <- c("heart attack", "heart failure", "pneumonia")
        
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        data <- data[c(2,7,11,17,23)]
        
        names(data)[1] = "name"
        names(data)[2] = "state"
        names(data)[3] = "heart attack"
        names(data)[4] = "heart failure"
        names(data)[5] = "pneumonia"
        
        if(outcome %in% valid_outcome == FALSE){
                stop("Invalid outcome")
        }
        
        vec <-data[,2]
        vec<- unique(vec)
        
        if (state %in% vec==FALSE ){
                stop("Invalid state")
        }
        
        if(num !="best" && num!= "worst" && num %% 1!=0 ){
                stop ("Invalid num")
        }
        
        data <- data[data$state==state & data[outcome]!= 'Not Available', ]
        
        data [outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
        data <- data [order(data$name,decreasing=F),]
        
        data <- data [order(data[outcome],decreasing = F),]
        
        val <- data [,outcome]
        if(num=="best"){
                rowNum <- which.min(val)
        }
        else if (num=="worst") {
                rowNum <- which.max(val)
        }
        else {rowNum <- num}
        data [rowNum,] $name
}