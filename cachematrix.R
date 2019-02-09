## A code to create matrix inverse then caches it in the memory

## creates a matrix and store the inverse in a variable

makeCacheMatrix <- function(x = matrix()) {
        inv<-NULL
        set <- function(y){
                x<<-y
                inv<<-NULL
        }
  get <- function() x
  setInverse <- function(inverse) inv<<- inverse
  getInverse <- function () inv
  list (set=set , get=get,
        setInverse=setInverse, getInverse=getInverse)
  
}


## returns the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if(!is.null(inv)){
                message("Getting Cached DATA")
                return (inv)
                
        }
        matx <- x$get()
        inv <- solve(matx,...)
        x$setInverse(inv)
        inv
}
