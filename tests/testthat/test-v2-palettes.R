context("v2 palettes")

test_that("v2 palettes are accessible and return valid colours", {
  new_pals <- c(
    "cyber_2077_night_city", "space_nasa", "game_street_fighter_ryu",
    "nature_aurora_borealis", "decade_1980s_synthwave",
    "book_dune_arrakis", "art_impressionism_monet",
    "arch_fallingwater_wright", "cinema_mgm_lion",
    "era_ancient_egypt", "misc_vaporwave", "tv_stranger_things"
  )

  for (pal in new_pals) {
    cols <- cpt(pal, n = 10)
    expect_type(cols, "character")
    expect_length(cols, 10)
    expect_true(all(grepl("^#[0-9A-F]{6}$", cols)))
  }
})

test_that("v2 palettes work with colorRampPalette=TRUE", {
  for (pal in c("game_pacman", "nature_coral_reef", "decade_1960s_psychedelic")) {
    fun <- cpt(pal, colorRampPalette = TRUE)
    expect_type(fun, "closure")
    expect_length(fun(5), 5)
  }
})

test_that("find_cpt discovers v2 palettes", {
  expect_true(length(find_cpt("cyber")) > 0)
  expect_true(length(find_cpt("game_street")) > 0)
  expect_true(length(find_cpt("space_nasa")) > 0)
  expect_true(length(find_cpt("tv_")) > 0)
  expect_true(length(find_cpt("decade_1980")) > 0)
})

test_that("v2 palettes have consistent naming convention", {
  cyber_pals <- find_cpt("^cyber_")
  expect_true(all(grepl("^cyber_", cyber_pals)))

  game_pals <- find_cpt("^game_")
  expect_true(all(grepl("^game_", game_pals)))

  space_pals <- find_cpt("^space_")
  expect_true(all(grepl("^space_", space_pals)))
})

test_that("lucky can discover v2 palettes", {
  set.seed(9999)
  # The random pool now includes v2 palettes — just verify it returns valid output
  cols <- lucky(10, message = FALSE, nseed = 9999)
  expect_type(cols, "character")
  expect_length(cols, 10)
})
