
best <- function(state,outcome){
        valid_outcome <- c("heart attack", "heart failure", "pneumonia")
        if(outcome %in% valid_outcome == FALSE){
                stop("Invalid outcome")
        }
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- data[c(2,7,11,17,23)]
        names(data)[1] = "name"
        names(data)[2] = "state"
        names(data)[3] = "heart attack"
        names(data)[4] = "heart failure"
        names(data)[5] = "pneumonia"
        vec <-data[,2]
        vec<- unique(vec)
        
        if (state %in% vec==FALSE ){
                stop('Invalid state')
        }
        

        data <- data[data$state==state & data[outcome]!= 'Not Available', ]
        val <- data[,outcome]
        rowNum <- which.min(val)
        data[rowNum, ]$name
}