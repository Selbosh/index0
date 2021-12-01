
<!-- README.md is generated from README.Rmd. Please edit that file -->

# index0: Zero-based Indexing in R

<!-- badges: start -->

[![R-CMD-check](https://github.com/Selbosh/index0/workflows/R-CMD-check/badge.svg)](https://github.com/Selbosh/index0/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/index0)](https://CRAN.R-project.org/package=index0)
<!-- badges: end -->

The R programming language uses indices that start from 1, but sometimes
it might be handy to be able to index from zero, as is more typical in
mathematical notation and some other programming languages like C and
Python.

## Installation

Install the development version of **index0** from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("Selbosh/index0")
```

## Usage

This R package **index0** provides the `index0` class. Subsetting and
operations using `[` will index from zero rather than one. To return to
normal behaviour, use `as.index1` or just remove the `index0` class from
your object.

``` r
library(index0)
letters0 <- as.index0(letters)
numbers0 <- as.index0(c(2, 3, 4, 5, 6))
```

What is the zeroth letter of the alphabet? What is the zeroth number in
our set?

``` r
letters0[0]
#> [1] "a"
#> indexed from 0
numbers0[0]
#> [1] 2
#> indexed from 0
```

What are the first, second and fourth letters?

``` r
letters0[c(1, 2, 4)]
#> [1] "b" "c" "e"
#> indexed from 0
```

Replace the first and third numbers with `NA`:

``` r
numbers0[c(1, 3)] <- NA
numbers0
#> [1]  2 NA  4 NA  6
#> indexed from 0
```
