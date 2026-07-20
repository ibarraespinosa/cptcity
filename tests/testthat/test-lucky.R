context("lucky")

test_that("lucky returns reproducible output with nseed", {
  expect_equal(
    lucky(1, message = FALSE, nseed = 1),
    "#8D757B"
  )
})

test_that("lucky with colorRampPalette=TRUE returns a function", {
  fun <- lucky(1, message = FALSE, nseed = 1, colorRampPalette = TRUE)
  expect_type(fun, "closure")
  expect_equal(fun(1), "#8D757B")
})

test_that("lucky with rev=TRUE reverses the palette", {
  expect_equal(
    lucky(1, message = FALSE, nseed = 1, rev = TRUE),
    "#FFF8EF"
  )
})

test_that("lucky prints message when message=TRUE", {
  expect_output(
    lucky(1, message = TRUE, nseed = 42),
    "Colour gradient:"
  )
})
