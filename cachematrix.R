## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Function to create a special "matrix" object that caches its inverse
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL  # Initialize the inverse matrix cache
  
  # Function to set the matrix
  set <- function(newValue) {
    x <<- newValue
    inverse <<- NULL  # Reset the inverse cache
  }
  
  # Function to get the matrix
  get <- function() {
    x
  }
  
  # Function to compute and cache the inverse of the matrix
  setInverse <- function() {
    if (is.null(inverse)) {
      inverse <<- solve(x)
    } else {
      message("Retrieving the cached inverse")
    }
    inverse
  }
  
  # Function to get the cached inverse of the matrix
  getInverse <- function() {
    inverse
  }
  
  # Return a list of functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# Function to compute the inverse of the special "matrix" using caching
cacheSolve <- function(cacheMatrix) {
  cacheMatrix$setInverse()
}
