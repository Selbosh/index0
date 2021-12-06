test_that("Combining zero-indexed vectors", {
  x <- as.index0(1:5)
  y <- as.index0(letters[1:5])
  expect_true(is.index0(c(x)))
  expect_true(is.index0(c(x, y)))
  expect_true(is.index0(c(x, 6:10)))
  expect_false(is.index0(c(1:5, y)))
})
