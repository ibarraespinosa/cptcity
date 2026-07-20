context("sf integration")

test_that("cpt with colorRampPalette=TRUE works with sf plot", {
  skip_if_not_installed("sf")
  library(sf)
  nc <- st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)

  # colorRampPalette=TRUE returns a function that sf::plot.sf accepts
  pal_fun <- cpt("mpl_inferno", colorRampPalette = TRUE)
  expect_type(pal_fun, "closure")

  # This should run without the "must have one more break than colour" error
  expect_silent({
    # Use a temp PDF device so we don't pop open windows
    tf <- tempfile(fileext = ".pdf")
    pdf(tf)
    plot(nc["AREA"], pal = pal_fun, main = "")
    dev.off()
    unlink(tf)
  })
})

test_that("lucky colorRampPalette=TRUE works with sf plot", {
  skip_if_not_installed("sf")
  library(sf)
  nc <- st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)

  pal_fun <- lucky(colorRampPalette = TRUE, message = FALSE, nseed = 1)
  expect_type(pal_fun, "closure")

  expect_silent({
    tf <- tempfile(fileext = ".pdf")
    pdf(tf)
    plot(nc["AREA"], pal = pal_fun, main = "")
    dev.off()
    unlink(tf)
  })
})
