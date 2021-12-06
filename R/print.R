#' Print Zero-Indexed Values
#' 
#' When printing zero-indexed objects, it only seems fair that the printed
#' output is zero-indexed as well. So we replace those little numbers in square
#' brackets so that they start from zero.
#' 
#' @note Not yet implemented for matrices, arrays or data frames.
#' 
#' @seealso [base::print], [utils::str]
#' 
#' @name print
#' @export
print.index0 <- function(x, ...) {
  x <- as.index1(x)
  if (is.vector(x)) reprint_indices(x, ...) else NextMethod()
  cat('indexed from 0\n')
  invisible(x)
}

#' @rdname print
#' @param x,object An object to inspect/print, of class `index0`.
#' @param ... Other arguments, passed to generic function
#' @export
str.index0 <- function(object, ...) {
  object <- as.index1(object)
  cat('zero-indexed')
  NextMethod()
}

#' @importFrom utils capture.output
reprint_indices <- function(x, ...) {
  out <- capture.output(print(x, ...))
  ind <- as.numeric(sub('^ *\\[(.*?)\\].*$', '\\1', out))
  out[ind %% 10 == 0] <- paste0(' ', out[ind %% 10 == 0]) # re-space ids ending in 0
  cat(
    mapply(out, ind, USE.NAMES = F,
           FUN = function(x, i) sub(paste0('^( *\\[)', i),
                                    paste0('\\1', i - 1), x)),
    sep = '\n')
}
