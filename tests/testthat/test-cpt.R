context("cpt")

test_that("cpt works", {
  expect_equal(cpt("mpl_inferno", 10),
               c("#000004", "#1B0C41", "#4B0C6B", "#781C6D",
                 "#A52C60", "#CE4346", "#ED6925", "#FB9906",
                 "#F7D03C", "#FCFFA4")
               )
})
