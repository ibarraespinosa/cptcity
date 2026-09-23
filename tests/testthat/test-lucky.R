context("lucky")

test_that("lucky returns reproducible output with nseed", {
  expect_equal(
    lucky(1, message = FALSE, nseed = 1),
    "#FFFFFF"
  )
})

test_that("lucky with colorRampPalette=TRUE returns a function", {
  fun <- lucky(1, message = FALSE, nseed = 1, colorRampPalette = TRUE)
  expect_type(fun, "closure")
  expect_equal(fun(1), "#FFFFFF")
})

test_that("lucky with rev=TRUE reverses the palette", {
  expect_equal(
    lucky(1, message = FALSE, nseed = 1, rev = TRUE),
    "#FCFCFC"
  )
})

test_that("lucky prints message when message=TRUE", {
  expect_output(
    lucky(1, message = TRUE, nseed = 42),
    "Colour gradient:"
  )
})

test_that("lucky never returns the internal cpt_names vector", {
  for (s in 1:200) {
    out <- lucky(3, message = FALSE, nseed = s)
    expect_type(out, "character")
    expect_length(out, 3)
  }
})
