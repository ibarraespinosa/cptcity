context("lucky")
test_that("lucky works", {
  expect_equal(lucky(1,message = TRUE, nseed = 1), "#8D757B")
  expect_equal(lucky(1,message = TRUE, nseed = 1, colorRampPalette = TRUE)(1), "#8D757B")
})


test_that("lucky works", {
  expect_equal(lucky(1,message = FALSE, nseed = 1, rev = TRUE), "#FFF8EF")
})



skip_if_no_db <- function() {
  if (exists(lucky(1,message = FALSE))) {
    skip("exists")
  }
}

test_that("nopes", {
  skip_if_no_db()
})

