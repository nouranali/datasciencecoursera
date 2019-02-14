rankall <- function (outcome, num="best"){
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
        
        if(num !="best" && num!= "worst" && num %% 1!=0 ){
                stop ("Invalid num")
        }
        
        data <- data[data[outcome] != 'Not Available', ]
        
        
        data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
        data <- data[order(data$name, decreasing = FALSE), ]
        data <- data[order(data[outcome], decreasing = FALSE), ]
        
        gethospbyrank <- function (df, st, n){
                df<- df [df$state==st,]
                val <- df [,outcome]
                if (n=="best"){
                        rowNum <- which.min(val)
                }
                else if (n=="worst"){
                        rowNum <-which.max(val)
                }
                else {
                        rowNum <- n
                }
                df [rowNum,]$name
                
        }
        states <- data [ ,2]
        states <- unique(states)
        
        res <- data.frame("hospital" = character(), "state"= character())
       for (st in states){
               hosp<- gethospbyrank(data,st,num)
               res <- rbind (res, data.frame(hospital=hosp,state=st))
       }
        res <- res [order(res['state'],decreasing = F),]
        res
}