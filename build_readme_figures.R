#!/usr/bin/env Rscript
#
# build_readme_figures.R — Generate showcase images for cptcity v2.0.0 README
# ============================================================================

library(cptcity)
library(grDevices)

REPO <- "/home/sibarra/.hermes/profiles/aire/home/.hermes/profiles/aire/home/hermes_vein/cptcity"
setwd(REPO)

dir.create("README_files/figure-gfm", showWarnings = FALSE, recursive = TRUE)
out <- function(name) file.path("README_files/figure-gfm", paste0(name, ".png"))

# ── Helper: draw a horizontal colour bar ─────────────────────────────────
draw_bar <- function(pal_name, n = 200) {
  cols <- cpt(pal_name, n = n)
  image(matrix(1:n, nrow = 1), col = cols, xaxt = "n", yaxt = "n", bty = "n")
}

# ══════════════════════════════════════════════════════════════════════════
#  1. HERO BANNER — 6 flagship palettes in a strip
# ══════════════════════════════════════════════════════════════════════════

png(out("hero_banner"), width = 1600, height = 600, res = 150)
par(mfrow = c(3, 1), mar = c(0.5, 0.5, 0.5, 0.5), bg = "#0A0A0A")

# Row 1: Cyberpunk → Space → Nature
layout(matrix(c(1,1,1,1,2,2,3,3,3,3,4,4), nrow = 3, byrow = TRUE))
par(mar = c(0.2, 0.2, 0.2, 0.2), bg = "#0A0A0A")

# strip 1
par(mar = c(0.3, 6, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("cyber_2077_night_city", 200),
      xaxt = "n", yaxt = "n", bty = "n")
mtext("CYBERPUNK 2077", side = 2, line = -1, col = "#FF00FF", cex = 1.2, font = 2)

par(mar = c(0.3, 0.3, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("decade_1980s_synthwave", 200),
      xaxt = "n", yaxt = "n", bty = "n")

par(mar = c(0.3, 0.3, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("space_nasa", 200),
      xaxt = "n", yaxt = "n", bty = "n")

# strip 2
par(mar = c(0.3, 6, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("nature_aurora_borealis", 200),
      xaxt = "n", yaxt = "n", bty = "n")
mtext("AURORA", side = 2, line = -1, col = "#00CED1", cex = 1.2, font = 2)

par(mar = c(0.3, 0.3, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("art_impressionism_monet", 200),
      xaxt = "n", yaxt = "n", bty = "n")

par(mar = c(0.3, 0.3, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("game_pacman", 200),
      xaxt = "n", yaxt = "n", bty = "n")

# strip 3
par(mar = c(0.3, 6, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("book_dune_arrakis", 200),
      xaxt = "n", yaxt = "n", bty = "n")
mtext("DUNE", side = 2, line = -1, col = "#D4B878", cex = 1.2, font = 2)

par(mar = c(0.3, 0.3, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("arch_fallingwater_wright", 200),
      xaxt = "n", yaxt = "n", bty = "n")

par(mar = c(0.3, 0.3, 0.3, 0.3))
image(matrix(1:200, nrow = 1), col = cpt("tv_stranger_things", 200),
      xaxt = "n", yaxt = "n", bty = "n")

dev.off()
cat("✓ hero_banner.png\n")

# ══════════════════════════════════════════════════════════════════════════
#  2. CATEGORY GRID — all categories in a compact matrix
# ══════════════════════════════════════════════════════════════════════════

categories <- list(
  "Art" = "art_impressionism_monet",
  "Architecture" = "arch_fallingwater_wright",
  "Decades" = "decade_1980s_synthwave",
  "Books" = "book_dune_arrakis",
  "Cyberpunk" = "cyber_2077_night_city",
  "Space" = "space_nasa",
  "Cinema" = "cinema_mgm_lion",
  "Games" = "game_street_fighter_ryu",
  "TV" = "tv_stranger_things",
  "Eras" = "era_ancient_egypt",
  "Nature" = "nature_aurora_borealis",
  "Misc" = "misc_vaporwave"
)

png(out("category_grid"), width = 1600, height = 800, res = 150)
par(mfrow = c(3, 4), mar = c(1.5, 6, 1.5, 1), bg = "#0A0A0A")

for (cat_name in names(categories)) {
  pal <- categories[[cat_name]]
  cols <- cpt(pal, n = 200)
  image(matrix(1:200, nrow = 1), col = cols,
        xaxt = "n", yaxt = "n", bty = "n")
  mtext(cat_name, side = 2, line = -1, col = "#FFFFFF", cex = 1.6, font = 2)
}

dev.off()
cat("✓ category_grid.png\n")

# ══════════════════════════════════════════════════════════════════════════
#  3. SPACE AGENCIES SHOWCASE
# ══════════════════════════════════════════════════════════════════════════

space_pals <- c("space_nasa", "space_nasa_meatball", "space_noaa_storm",
                "space_jaxa", "space_esa", "space_spacex",
                "space_hubble", "space_jwst", "space_mars_rover",
                "space_apollo", "space_voyager", "space_roscosmos")

png(out("space_showcase"), width = 1600, height = 900, res = 150)
par(mfrow = c(4, 3), mar = c(1, 8, 1, 1), bg = "#050510")

for (pal in space_pals) {
  cols <- cpt(pal, n = 200)
  image(matrix(1:200, nrow = 1), col = cols,
        xaxt = "n", yaxt = "n", bty = "n")
  label <- gsub("space_", "", pal)
  label <- gsub("_", " ", label)
  mtext(toupper(label), side = 2, line = -1, col = "#FFFFFF", cex = 1.2, font = 2)
}

dev.off()
cat("✓ space_showcase.png\n")

# ══════════════════════════════════════════════════════════════════════════
#  4. STREET FIGHTER + GAMES
# ══════════════════════════════════════════════════════════════════════════

game_pals <- c("game_street_fighter_ryu", "game_street_fighter_chun_li",
               "game_street_fighter_akuma", "game_street_fighter_vega",
               "game_pacman", "game_tetris", "game_super_mario",
               "game_zelda", "game_metroid", "game_sonic",
               "game_doom", "game_portal")

png(out("games_showcase"), width = 1600, height = 900, res = 150)
par(mfrow = c(4, 3), mar = c(1, 8, 1, 1), bg = "#0A0A0A")

for (pal in game_pals) {
  cols <- cpt(pal, n = 200)
  image(matrix(1:200, nrow = 1), col = cols,
        xaxt = "n", yaxt = "n", bty = "n")
  label <- gsub("game_street_fighter_", "SF: ", pal)
  label <- gsub("game_", "", label)
  label <- gsub("_", " ", label)
  mtext(toupper(label), side = 2, line = -1, col = "#FFFFFF", cex = 1.2, font = 2)
}

dev.off()
cat("✓ games_showcase.png\n")

# ══════════════════════════════════════════════════════════════════════════
#  5. DECADES TIMELINE
# ══════════════════════════════════════════════════════════════════════════

decade_pals <- c("decade_1920s_gatsby", "decade_1930s_dust_bowl", "decade_1940s_wartime",
                 "decade_1950s_diner", "decade_1960s_psychedelic", "decade_1970s_earth_tones",
                 "decade_1980s_neon", "decade_1990s_grunge", "decade_2000s_y2k",
                 "decade_2010s_flat_design", "decade_2020s_gradient")

png(out("decades_timeline"), width = 1600, height = 400, res = 150)
par(mfrow = c(1, 1), mar = c(0.5, 0.5, 0.5, 0.5), bg = "#050510")

layout(matrix(1:11, nrow = 11))
par(mar = c(0.1, 6, 0.1, 0.3))

for (pal in decade_pals) {
  cols <- cpt(pal, n = 300)
  image(matrix(1:300, nrow = 1), col = cols,
        xaxt = "n", yaxt = "n", bty = "n")
  decade_label <- gsub("decade_", "", pal)
  decade_label <- gsub("_", " ", decade_label)
  mtext(decade_label, side = 2, line = -1, col = "#FFFFFF", cex = 0.9, font = 2)
}

dev.off()
cat("✓ decades_timeline.png\n")

# ══════════════════════════════════════════════════════════════════════════
#  6. ART MOVEMENTS SHOWCASE
# ══════════════════════════════════════════════════════════════════════════

art_pals <- c("art_impressionism_monet", "art_post_impressionism_van_gogh",
              "art_cubism_picasso", "art_surrealism_dali",
              "art_abstract_kandinsky", "art_abstract_mondrian",
              "art_pop_warhol", "art_pop_lichtenstein",
              "art_expressionism_munch", "art_baroque_caravaggio",
              "art_art_nouveau_mucha", "art_art_deco_gatsby",
              "art_bauhaus_gropius", "art_minimalism_judd",
              "art_renaissance_botticelli", "art_rococo_fragonard")

png(out("art_showcase"), width = 1600, height = 1000, res = 150)
par(mfrow = c(4, 4), mar = c(1, 8, 1, 1), bg = "#0A0A0A")

for (pal in art_pals) {
  cols <- cpt(pal, n = 200)
  image(matrix(1:200, nrow = 1), col = cols,
        xaxt = "n", yaxt = "n", bty = "n")
  label <- gsub("art_", "", pal)
  label <- gsub("_", " ", label)
  label <- tools::toTitleCase(label)
  mtext(label, side = 2, line = -1, col = "#FFFFFF", cex = 1.1, font = 2)
}

dev.off()
cat("✓ art_showcase.png\n")

# ══════════════════════════════════════════════════════════════════════════
#  7. SF + CPT DEMO
# ══════════════════════════════════════════════════════════════════════════

library(sf)
nc <- st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)

png(out("sf_demo"), width = 1200, height = 600, res = 150, bg = "#0A0A0A")
par(mfrow = c(1, 2), mar = c(0.5, 0.5, 2, 0.5), bg = "#0A0A0A")

plot(nc["AREA"], pal = cpt("cyber_2077_night_city", colorRampPalette = TRUE),
     main = "", key.pos = NULL, border = NA)
title(main = "Cyberpunk 2077", col.main = "#FF00FF", cex.main = 2)

plot(nc["AREA"], pal = cpt("game_pacman", colorRampPalette = TRUE),
     main = "", key.pos = NULL, border = NA)
title(main = "Pac-Man", col.main = "#FFD700", cex.main = 2)

dev.off()
cat("✓ sf_demo.png\n")

cat("\n=== ALL FIGURES BUILT ===\n")
