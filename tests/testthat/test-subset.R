test_that("Coercing to zero-indexing", {
  x <- letters
  expect_type(x, 'character')
  x <- as.index0(x)
  expect_s3_class(x, 'index0')
  expect_true(is.index0(x))
  y <- index_from_0(1:5)
  expect_s3_class(y, 'index0')
  expect_true(is.index0(y))
})

test_that("Zero-based subsetting vectors", {
  expect_equal(letters[0], character(0))
  letters0 <- as.index0(letters)
  expect_equal(letters0[0], as.index0('a'))
  expect_equal(letters0[0:3], as.index0(c('a', 'b', 'c', 'd')))
  expect_equal(letters0[26], as.index0(NA_character_))
  expect_equal(letters0[], letters0)
})

test_that("Zero-based replacement of vectors", {
  letters0 <- as.index0(letters[1:5]) # a, b, c, d, e
  letters0[0] <- 'first'
  expect_equal(letters0[0], 'first', ignore_attr = T)
  expect_equal(letters0[0:4], c('first', 'b', 'c', 'd', 'e'), ignore_attr = T)
  letters0[2:3] <- c('three', 'four')
  expect_equal(letters0, c('first', 'b', 'three', 'four', 'e'), ignore_attr = T)
})

test_that("Head and tail functions behave normally", {
  x <- as.index0(letters)
  expect_equal(head(x, 1), as.index0('a'))
  expect_equal(head(x, 2), as.index0(c('a', 'b')))
  expect_equal(head(x, 0), as.index0(character(0)))
  expect_equal(tail(x, 1), as.index0('z'))
  expect_equal(tail(x, 2), as.index0(c('y', 'z')))
  expect_equal(tail(x, 0), as.index0(character(0)))
})
