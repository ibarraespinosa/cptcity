context("find_cpt")

test_that("find_cpt matches palettes by keyword (case-insensitive default)", {
  out <- find_cpt("temperature")
  expect_equal(out, c(
    "arendal_temperature",
    "idv_temperature",
    "jjg_misc_temperature",
    "kst_03_red_temperature"
  ))
})

test_that("find_cpt with ignore.case=FALSE is case-sensitive", {
  out <- find_cpt("Temperature", ignore.case = FALSE)
  expect_length(out, 0)
})

test_that("find_cpt regex works", {
  out <- find_cpt("^mpl_")
  expect_true(all(grepl("^mpl_", out)))
  expect_true(length(out) > 0)
})

test_that("find_cpt fixed=TRUE does literal match", {
  out <- find_cpt("rain", fixed = TRUE)
  expect_true(all(grepl("rain", out)))
})

test_that("find_cpt returns empty vector on no match", {
  out <- find_cpt("zzz_nonexistent_xyz")
  expect_length(out, 0)
})
