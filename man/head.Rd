% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/head.R
\name{head.index0}
\alias{head.index0}
\alias{tail.index0}
\title{Return the First or Last Parts of a Zero-Indexed Object}
\usage{
\method{head}{index0}(x, ...)

\method{tail}{index0}(x, ...)
}
\arguments{
\item{x}{An \code{index0} object}

\item{...}{Other arguments, passed to generic function}
}
\value{
An \code{index0} object
}
\description{
Works like \code{\link[utils:head]{utils::head()}} and \code{\link[utils:head]{utils::tail()}}.
}
\details{
Just because an object is zero-indexed, doesn't mean that the definition of,
for example, "the first 5 elements" or "the last two elements" has changed.
Thus we add methods \code{head()} and \code{tail()} to ensure they behave as normal.
}
