## A code to create matrix inverse then caches it in the memory

## makeCacheMatrix creates a matrix 
## -set the value of the matrix
## -get the value of the matrix
## -set the inverse
## -get the inverse

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


## The next function checks the inverse of the matrix created with the above function.
## 1- checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips
## the computation. Otherwise, it calculates the inverse of the matrix and sets the value of the inverse in the cache via 
## the setinverse function.


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
