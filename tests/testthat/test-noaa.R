context("noaa")

test_that("12 NOAA palettes are accessible and return valid colours", {
  noaa <- c(
    "space_noaa_nws", "space_noaa_nhc", "space_noaa_nexrad", "space_noaa_goes",
    "space_noaa_buoy", "space_noaa_ncei", "space_noaa_nmfs", "space_noaa_jetstream",
    "space_noaa_tornado", "space_noaa_wind_chill", "space_noaa_heat_index",
    "space_noaa_coastal"
  )

  for (pal in noaa) {
    cols <- cpt(pal, n = 10)
    expect_type(cols, "character")
    expect_length(cols, 10)
    expect_true(all(grepl("^#[0-9A-F]{6}$", cols)))
  }
})

test_that("find_cpt discovers NOAA palettes", {
  found <- find_cpt("noaa")
  expect_true(all(c("space_noaa", "space_noaa_storm",
                    "space_noaa_nws", "space_noaa_nhc",
                    "space_noaa_nexrad", "space_noaa_goes") %in% found))
  expect_true(length(found) >= 14)
})

test_that("NOAA palettes work with colorRampPalette = TRUE", {
  for (pal in c("space_noaa_nhc", "space_noaa_nexrad", "space_noaa_goes")) {
    fun <- cpt(pal, colorRampPalette = TRUE)
    expect_type(fun, "closure")
    expect_length(fun(5), 5)
  }
})

test_that("NHC palette follows the Saffir-Simpson key colours", {
  cols <- cpt("space_noaa_nhc", n = 5)
  expect_equal(toupper(cols[1]), "#2ECC71")   # cat 1 green
  expect_equal(toupper(cols[5]), "#8E44AD")   # cat 5 magenta
})

test_that("NEXRAD palette spans low to extreme reflectivity", {
  cols <- cpt("space_noaa_nexrad", n = 7)
  expect_equal(toupper(cols[1]), "#00FFFF")   # low dBZ cyan
  expect_equal(toupper(cols[7]), "#FFFFFF")   # extreme white
})

test_that("NWS palette runs NOAA navy to white", {
  cols <- cpt("space_noaa_nws", n = 2)
  expect_equal(toupper(cols[1]), "#0B2D72")   # NOAA navy
  expect_equal(toupper(cols[2]), "#F7FBFF")   # near-white
})

test_that("wind chill runs white to deep cold navy", {
  cols <- cpt("space_noaa_wind_chill", n = 2)
  expect_equal(toupper(cols[1]), "#FFFFFF")
  expect_equal(toupper(cols[2]), "#0B2D72")
})

test_that("find_cpt returns unique names", {
  out <- find_cpt("spider_miles")
  expect_equal(anyDuplicated(out), 0)
})
