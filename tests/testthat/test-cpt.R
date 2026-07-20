context("cpt")

test_that("cpt returns expected hex colours for mpl_inferno", {
  out <- cpt("mpl_inferno", 10)
  expect_equal(out, c(
    "#000004", "#1B0C41", "#4B0C6B", "#781C6D",
    "#A52C60", "#CE4346", "#ED6925", "#FB9906",
    "#F7D03C", "#FCFFA4"
  ))
})

test_that("cpt with colorRampPalette=TRUE returns a function", {
  fun <- cpt(pal = "mpl_inferno", colorRampPalette = TRUE)
  expect_type(fun, "closure")
  # fun(n) should equal cpt(..., n) with colorRampPalette=FALSE
  expect_equal(fun(10), cpt("mpl_inferno", 10))
  expect_length(fun(5), 5)
  expect_length(fun(20), 20)
})

test_that("cpt rev=TRUE reverses the palette", {
  expect_equal(cpt("mpl_inferno", 1, rev = TRUE), "#FCFFA4")
  fwd <- cpt("mpl_inferno", 10)
  rev_out <- cpt("mpl_inferno", 10, rev = TRUE)
  expect_equal(rev_out, rev(fwd))
})

test_that("cpt errors on unknown palette", {
  expect_error(cpt("nonexistent_palette_xyz"), "not found in cptcity")
})

test_that("cpt with frgb scales colour channels", {
  # scaling red to zero should alter colours
  x <- cpt("mpl_inferno", 10, frgb = c(0, 1, 1))
  y <- cpt("mpl_inferno", 10, frgb = c(1, 1, 1))
  expect_type(x, "character")
  expect_length(x, 10)
  expect_false(identical(x, y))
})
