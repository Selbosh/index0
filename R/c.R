#' Combine zero-indexed vectors
#' 
#' When combining vectors, if the first argument to `c()` is zero-indexed, then
#' the result will be zero-indexed as well.
#' Otherwise, the output will revert to default \R behaviour of indexing from 1.
#' 
#' @param ... objects to be concatenated. All `NULL` entries are dropped.
#' 
#' @seealso [base::c()]
#' 
#' @examples
#' x <- as.index0(1:5)
#' y <- as.index0(6:10)
#' c(x, y)
#' c(1:5, y)
#' 
#' @return A zero-indexed vector of class [index0].
#' 
#' @export 
c.index0 <- function(...) {
  as.index0(NextMethod())
}
