test_that("Combining zero-indexed vectors", {
  x <- as.index0(1:5)
  y <- as.index0(letters[1:5])
  expect_true(is.index0(c(x)))
  expect_true(is.index0(c(x, y)))
  expect_true(is.index0(c(x, 6:10)))
  expect_false(is.index0(c(1:5, y)))
})

test_that("Printing structure with str()", {
  x <- as.index0(1:4)
  m <- as.index0(matrix(as.double(1:4), 2))
  expect_output(str(x), 'zero-indexed int \\[1:4\\] 1 2 3 4')
  expect_output(str(m), 'zero-indexed \'matrix\' num \\[1:2, 1:2\\] 1 2 3 4')
})
