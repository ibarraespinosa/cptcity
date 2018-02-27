context("find_cpt")

test_that("find colour works", {
  expect_equal(find_cpt("temperature"),
               c("arendal_temperature",
                 "idv_temperature",
                 "jjg_misc_temperature",
                 "kst_03_red_temperature")
               )
})
