#' Zero-based indexing of vectors
#'
#' Normally R is indexed from 1, but with the special `index0` class, you can
#' have vectors that are indexed from zero. Works both for subsetting (extraction)
#' and (sub-)assignment.
#' An `index0` object is just like a normal vector or matrix, but `x[i]` returns
#' or replaces the `(i+1)`th index.
#'
#' Assign the class `index0` to a vector, using `as.index0()` or `index_from_0()`,
#' then use the subset operators normally and they will be indexed from zero.
#' You can reverse the operation (reset to indexing from 1) with `as.index1()`
#' or by manually removing the `index0` class.
#' Character indices _seem_ to be unaffected. Be cautious with logical indices.
#' See examples.
#'
#' @name index0
#'
#' @param x object from which to extract element(s) or in which to replace element(s)
#' @param i,j indices specifying elements to extract or replace. Starting from 1.
#' @param ... other arguments passed to generic methods.
#'
#' @examples
#' # Vectors
#' v <- as.index0(letters)
#' v[0:3]
#' v[c(0, 2)] <- c('zeroth', 'second')
#' v
#'
#' # Matrices and arrays
#' m <- index_from_0(matrix(1:4, 2))
#' m[0, 1]
#' m[0, 1] <- 99
#' m
#' 
#' @return
#' `as.index0` returns the input (typically a vector or matrix) unchanged except
#' for the addition of an `index0` class attribute, which enables the zero-based
#' indexing behaviour. Use `as.index1` to remove this class again, if present.
#' 
#' If `x` is a zero-indexed object with class `index0`, then `x[i]` returns an
#' appropriate subset of `x`. The returned subset is also zero-indexed.
#' `x[i] <- value` changes the `i`th element (effectively `(i+1)`th element in
#' ordinary R code) in place.
#' 
#' `is.index0(x)` returns `TRUE` if `x` is indexed from zero, otherwise `FALSE`.
#'
#' @source
#' Partially inspired by this Stack Overflow answer:
#' [Zero based arrays/vectors in R](https://stackoverflow.com/a/49927880)
#'
#' @export
`[.index0` <- function(x, i, j, ...) {
  if (!missing(i))
    i <- i + 1
  if (!missing(j))
    j <- j + 1
  as.index0(NextMethod())
}

#' @rdname index0
#' @param value typically an array-like \R object of a similar class as `x`.
#' @export
`[<-.index0` <- function(x, i, j, ..., value) {
  if (!missing(i))
    i <- i + 1
  if (!missing(j))
    j <- j + 1
  as.index0(NextMethod())
}

#' @rdname index0
#' @export
as.index0 <- function(x) {
  class(x) <- union(class(x), 'index0')
  x
}

#' @rdname index0
#' @export
as.index1 <- function(x) {
  class(x) <- setdiff(class(x), 'index0')
  x
}

#' @rdname index0
#' @export
is.index0 <- function(x) {
  inherits(x, 'index0')
}

#' @rdname index0
#' @export
index_from_0 <- as.index0

#' @rdname index0
#' @export
print.index0 <- function(x, ...) {
  print(as.index1(x))
  cat('indexed from 0\n')
  invisible(x)
}
