#' Return the First or Last Parts of a Zero-Indexed Object
#' 
#' Works like [utils::head()] and [utils::tail()].
#' 
#' Just because an object is zero-indexed, doesn't mean that the definition of,
#' for example, "the first 5 elements" or "the last two elements" has changed.
#' Thus we add methods `head()` and `tail()` to ensure they behave as normal.
#' 
#' @param x An `index0` object
#' @param ... Other arguments, passed to generic function
#' 
#' @return An `index0` object
#' 
#' @importFrom utils head tail
#' @rdname head
#' @export
head.index0 <- function(x, ...) {
  x <- as.index1(x)
  as.index0(NextMethod())
}

#' @rdname head
#' @export
tail.index0 <- function(x, ...) {
  x <- as.index1(x)
  as.index0(NextMethod())
}
