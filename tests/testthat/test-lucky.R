context("lucky")
test_that("lucky works", {
  expect_equal(lucky(1,message = FALSE, nseed = 1), "#8D757B")
})


test_that("lucky works", {
  expect_equal(lucky(1,message = FALSE, nseed = 1, rev = TRUE), "#FFF8EF")
})
