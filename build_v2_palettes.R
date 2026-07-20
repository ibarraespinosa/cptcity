#!/usr/bin/env Rscript
#
# build_v2_palettes.R — cptcity v2.0.0 palette generator
#
# Generates ~200 new colour palettes inspired by:
#   Art, Architecture, Historical Periods, Decades, Books,
#   Cyberpunk, Space Agencies, TV/Movies/Games, Street Fighter,
#   Metro-Goldwyn-Mayer, and more.
#
# Output: data/cpt_names.rda (updated) and R/sysdata.rda (rebuilt)
# ============================================================================

library(grDevices)

REPO <- "/home/sibarra/.hermes/profiles/aire/home/.hermes/profiles/aire/home/hermes_vein/cptcity"
setwd(REPO)

# ── Helper: hex vector → interpolated data.frame ──────────────────────────
hex_to_palette <- function(hex_vec, n_stops = 256) {
  # hex_vec: character vector of hex colours (e.g. c("#000000", "#FFFFFF"))
  # Returns data.frame with id, r, g, b columns (0-1 range, n_stops rows)

  # Create colour ramp from the key stops
  ramp <- colorRampPalette(hex_vec)

  # Generate n_stops interpolated colours
  cols <- ramp(n_stops)

  # Convert hex → RGB matrix
  rgb_mat <- col2rgb(cols) / 255

  data.frame(
    id  = seq(0, 1, length.out = n_stops),
    r   = rgb_mat[1, ],
    g   = rgb_mat[2, ],
    b   = rgb_mat[3, ],
    stringsAsFactors = FALSE
  )
}

# ── Shortcut: quick palette with fewer stops for punchy themes ────────────
qpal <- function(hex_vec, n_stops = 128) hex_to_palette(hex_vec, n_stops)

# ══════════════════════════════════════════════════════════════════════════
#  ART MOVEMENTS
# ══════════════════════════════════════════════════════════════════════════

art <- list()

art[["art_impressionism_monet"]] <- qpal(c(
  "#2C4251", "#4B7F8C", "#8DB5A4", "#C4C89F",
  "#E8C77A", "#D4934A", "#BF6A3A", "#8B3A2A"
))

art[["art_impressionism_renoir"]] <- qpal(c(
  "#3D2030", "#6B3840", "#A65D57", "#D4846A",
  "#F2B892", "#E8D2B0", "#C4D0C0", "#8BAB9E"
))

art[["art_post_impressionism_van_gogh"]] <- qpal(c(
  "#0D1B2A", "#1B3A4B", "#2E5D6B",
  "#C9A020", "#E8C547", "#F4D97C",
  "#E8A838", "#D4731A", "#8B3A0A"
))

art[["art_cubism_picasso"]] <- qpal(c(
  "#2C2C2C", "#4A4A4A", "#8B7355",
  "#C4A46A", "#8B8B83", "#A0A0A0",
  "#6B8B7A", "#4A6B5A", "#3A4A3A"
))

art[["art_surrealism_dali"]] <- qpal(c(
  "#1A0A2E", "#3B1F5E", "#6B3FA0",
  "#C4A050", "#E8C878", "#F0E0A0",
  "#D4833A", "#A05A20", "#4A2A10"
))

art[["art_abstract_kandinsky"]] <- qpal(c(
  "#1A1A2E", "#E84545", "#F4A020",
  "#2E8B57", "#C42040", "#D4A040",
  "#2070A0", "#8040C0", "#F0E8C0"
))

art[["art_abstract_mondrian"]] <- qpal(c(
  "#FFFFFF", "#FF0000", "#FFFFFF",
  "#FFDE00", "#FFFFFF", "#004C99",
  "#FFFFFF", "#000000", "#FFFFFF"
))

art[["art_pop_warhol"]] <- qpal(c(
  "#FF1493", "#FF4500", "#FFD700",
  "#00CED1", "#FF69B4", "#FF6347",
  "#32CD32", "#1E90FF", "#9400D3"
))

art[["art_pop_lichtenstein"]] <- qpal(c(
  "#FFDE00", "#FF0000", "#FFFFFF",
  "#004C99", "#FFDE00", "#000000",
  "#FF0000", "#004C99", "#FFFFFF"
))

art[["art_expressionism_munch"]] <- qpal(c(
  "#1A0A0A", "#4A1A0A", "#C4401A",
  "#E8783A", "#E8A060", "#C4C0A0",
  "#8B8BA0", "#4A6B8B", "#1A2A4A"
))

art[["art_baroque_caravaggio"]] <- qpal(c(
  "#0A0A0A", "#1A0A0A", "#3A1A0A",
  "#6B3A1A", "#8B5A3A", "#C49A6A",
  "#E8C8A0", "#F0E0C8", "#FFF8F0"
))

art[["art_renaissance_botticelli"]] <- qpal(c(
  "#2A3A4A", "#4A6B8B", "#8BB0C0",
  "#C4D4D4", "#E8D4C0", "#F0D8C0",
  "#E8C0A0", "#D4A080", "#C08B6B"
))

art[["art_art_nouveau_mucha"]] <- qpal(c(
  "#1A2A1A", "#3A5A3A", "#6B8B4A",
  "#A0C46A", "#C4D48B", "#E8D4A0",
  "#C49A6A", "#A06B4A", "#6B3A2A"
))

art[["art_art_deco_gatsby"]] <- qpal(c(
  "#0A0A1A", "#1A1A3A", "#C4A020",
  "#E8D440", "#F0E860", "#C4A020",
  "#8B6B20", "#4A3A10", "#0A0A1A"
))

art[["art_bauhaus_gropius"]] <- qpal(c(
  "#E84545", "#F4A020", "#F0E020",
  "#2E8B57", "#2070A0", "#8040C0",
  "#000000", "#FFFFFF", "#808080"
))

art[["art_minimalism_judd"]] <- qpal(c(
  "#F8F8F8", "#E0E0E0", "#C0C0C0",
  "#A0A0A0", "#808080", "#606060",
  "#404040", "#202020", "#080808"
))

art[["art_rococo_fragonard"]] <- qpal(c(
  "#F0E0E0", "#F8D8D8", "#E8C0C4",
  "#D4A0A8", "#C08B9B", "#A8C0D0",
  "#8BB0C4", "#6B9BA8", "#4A7B8B"
))

# ══════════════════════════════════════════════════════════════════════════
#  ARCHITECTURE
# ══════════════════════════════════════════════════════════════════════════

arch <- list()

arch[["arch_fallingwater_wright"]] <- qpal(c(
  "#3A2A1A", "#6B4A2A", "#8B6B4A",
  "#A0806B", "#C4A080", "#D4B090",
  "#C4D0C0", "#8BAB8B", "#4A6B4A"
))

arch[["arch_guggenheim_wright"]] <- qpal(c(
  "#F8F8F0", "#E8E0D0", "#D0C8B8",
  "#B8B0A0", "#A09888", "#888078",
  "#706860", "#585048", "#403830"
))

arch[["arch_sagrada_familia_gaudi"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C49A6A",
  "#E8C8A0", "#F0E0C0", "#C4D4B0",
  "#8BB0A0", "#4A8B8B", "#2A5A6B"
))

arch[["arch_brutalism_concrete"]] <- qpal(c(
  "#D0C8C0", "#B8B0A8", "#A09890",
  "#888078", "#706860", "#585048",
  "#404038", "#303028", "#282820"
))

arch[["arch_chrysler_building"]] <- qpal(c(
  "#1A1A2A", "#3A3A5A", "#6B6B8B",
  "#A0A0A0", "#C0C0C0", "#E0E0E0",
  "#D4A040", "#C4902A", "#8B6B1A"
))

arch[["arch_empire_state"]] <- qpal(c(
  "#0A0A1A", "#1A2A3A", "#3A4A5A",
  "#6B7B8B", "#8B9BA0", "#C0C0C0",
  "#D4C8A0", "#C4B090", "#8B7B5A"
))

arch[["arch_neuschwanstein"]] <- qpal(c(
  "#2A2A3A", "#4A4A6B", "#6B6B8B",
  "#A0A0B8", "#C0C0D0", "#E0E0E8",
  "#8B8B6B", "#6B6B4A", "#4A4A2A"
))

arch[["arch_burj_khalifa"]] <- qpal(c(
  "#0A1A2A", "#1A3A5A", "#2A5A8B",
  "#6BA0C0", "#A0C4D4", "#C0D8E0",
  "#E0E8E8", "#D0D0D0", "#A0A0A0"
))

arch[["arch_sydney_opera"]] <- qpal(c(
  "#F8F8F0", "#E8E0D0", "#D0C8B8",
  "#B8B0A0", "#E0D8C8", "#C8C0B0",
  "#B0A898", "#F0E8D8", "#FFFFFF"
))

arch[["arch_taj_mahal"]] <- qpal(c(
  "#F8F8F8", "#F0F0F0", "#E8E8E0",
  "#E0D8C8", "#D0C8B0", "#C0B8A0",
  "#F0F0E8", "#E8E0D0", "#FFFFFF"
))

arch[["arch_colosseum_rome"]] <- qpal(c(
  "#6B6B4A", "#8B8B6B", "#A0A080",
  "#B8B0A0", "#C8C0B0", "#D0C8B8",
  "#A09888", "#8B8070", "#6B6048"
))

arch[["arch_machu_picchu"]] <- qpal(c(
  "#4A4A3A", "#6B6B5A", "#8B8B6B",
  "#A0A080", "#B0B090", "#C0C098",
  "#8B9B6B", "#6B8B4A", "#4A6B3A"
))

# ══════════════════════════════════════════════════════════════════════════
#  DECADES (historical colour palettes)
# ══════════════════════════════════════════════════════════════════════════

decade <- list()

decade[["decade_1920s_gatsby"]] <- qpal(c(
  "#1A1A2E", "#C4A020", "#E8D440",
  "#F0E8C0", "#C4A8A0", "#8B6B6B",
  "#6B4A4A", "#4A2A2A", "#1A0A0A"
))

decade[["decade_1920s_art_deco"]] <- qpal(c(
  "#0A0A1A", "#C4A020", "#E8C878",
  "#000000", "#F0E0C0", "#8B8B8B",
  "#C4A040", "#6B6B4A", "#1A1A0A"
))

decade[["decade_1930s_dust_bowl"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C49A6A",
  "#D4B080", "#C4A070", "#A08060",
  "#8B6B4A", "#6B4A2A", "#3A2A1A"
))

decade[["decade_1940s_wartime"]] <- qpal(c(
  "#2A2A2A", "#4A4A3A", "#6B6B4A",
  "#8B8B6B", "#A0A080", "#8B8B6B",
  "#6B5A3A", "#4A3A2A", "#2A2A1A"
))

decade[["decade_1940s_pinup"]] <- qpal(c(
  "#C4203A", "#E84545", "#F4A0A0",
  "#F0E0C0", "#D4B090", "#C4A080",
  "#8B6B4A", "#6B4A3A", "#3A2A2A"
))

decade[["decade_1950s_diner"]] <- qpal(c(
  "#FF1493", "#FF4500", "#FFD700",
  "#00CED1", "#C4203A", "#F0E0C0",
  "#A0A0A0", "#808080", "#404040"
))

decade[["decade_1950s_americana"]] <- qpal(c(
  "#C4203A", "#FFFFFF", "#004C99",
  "#C4203A", "#FFFFFF", "#004C99",
  "#F0E0C0", "#D4B090", "#8B6B4A"
))

decade[["decade_1960s_psychedelic"]] <- qpal(c(
  "#FF1493", "#FFD700", "#00FF00",
  "#1E90FF", "#FF4500", "#9400D3",
  "#FF69B4", "#00CED1", "#FF6347"
))

decade[["decade_1960s_mod"]] <- qpal(c(
  "#000000", "#FFFFFF", "#FF0000",
  "#000000", "#FFFFFF", "#004C99",
  "#808080", "#C0C0C0", "#000000"
))

decade[["decade_1970s_earth_tones"]] <- qpal(c(
  "#8B4513", "#A0522D", "#CD853F",
  "#DEB887", "#F5DEB3", "#D2B48C",
  "#BC8F8F", "#A0522D", "#8B4513"
))

decade[["decade_1970s_disco"]] <- qpal(c(
  "#9400D3", "#FF1493", "#FFD700",
  "#FF4500", "#00CED1", "#FF69B4",
  "#32CD32", "#1E90FF", "#9400D3"
))

decade[["decade_1980s_neon"]] <- qpal(c(
  "#FF00FF", "#00FFFF", "#FF0000",
  "#00FF00", "#FFD700", "#FF1493",
  "#1E90FF", "#FF4500", "#FF00FF"
))

decade[["decade_1980s_synthwave"]] <- qpal(c(
  "#0A0020", "#2A0050", "#6B00B0",
  "#C400FF", "#FF00FF", "#FF1493",
  "#FF4500", "#FFD700", "#0A0020"
))

decade[["decade_1980s_memphis"]] <- qpal(c(
  "#FF6B6B", "#4ECDC4", "#FFE66D",
  "#1A535C", "#FF6B6B", "#FFFFFF",
  "#000000", "#FFE66D", "#4ECDC4"
))

decade[["decade_1990s_grunge"]] <- qpal(c(
  "#2A2A2A", "#4A4A3A", "#6B5A4A",
  "#8B6B5A", "#A0806B", "#8B7B6B",
  "#6B5A4A", "#4A3A2A", "#2A2A2A"
))

decade[["decade_1990s_web_1_0"]] <- qpal(c(
  "#000080", "#008000", "#808080",
  "#C0C0C0", "#FFFFFF", "#FFFF00",
  "#FF0000", "#800080", "#000080"
))

decade[["decade_2000s_y2k"]] <- qpal(c(
  "#C0C0C0", "#808080", "#00CED1",
  "#FF1493", "#C0C0C0", "#A0A0A0",
  "#808080", "#606060", "#404040"
))

decade[["decade_2010s_flat_design"]] <- qpal(c(
  "#3498DB", "#2ECC71", "#E74C3C",
  "#F39C12", "#9B59B6", "#1ABC9C",
  "#E67E22", "#34495E", "#7F8C8D"
))

decade[["decade_2020s_gradient"]] <- qpal(c(
  "#6C5CE7", "#A29BFE", "#74B9FF",
  "#0984E3", "#55EFC4", "#00CE35",
  "#FDCB6E", "#E17055", "#D63031"
))

# ══════════════════════════════════════════════════════════════════════════
#  BOOKS / LITERATURE
# ══════════════════════════════════════════════════════════════════════════

book <- list()

book[["book_lotr_fellowship"]] <- qpal(c(
  "#1A2A0A", "#3A5A2A", "#6B8B4A",
  "#A0C46A", "#C4D48B", "#E8D4A0",
  "#C49A6A", "#8B6B4A", "#4A3A2A"
))

book[["book_lotr_mordor"]] <- qpal(c(
  "#0A0A0A", "#2A1A0A", "#4A2A0A",
  "#C4401A", "#E8783A", "#E8A060",
  "#4A1A0A", "#2A0A0A", "#0A0A0A"
))

book[["book_dune_arrakis"]] <- qpal(c(
  "#C4A060", "#D4B878", "#E8C898",
  "#F0D8B0", "#D4B080", "#C49A60",
  "#8B6B3A", "#6B4A2A", "#4A3A2A"
))

book[["book_dune_spice"]] <- qpal(c(
  "#1A0A2E", "#3B1F5E", "#6B3FA0",
  "#C4A020", "#E8C840", "#F0D860",
  "#D4A830", "#8B6B20", "#4A3A10"
))

book[["book_neuromancer"]] <- qpal(c(
  "#0A0A1A", "#1A2A4A", "#2A4A6B",
  "#00CED1", "#FF00FF", "#00FFFF",
  "#4A6B8B", "#2A4A6B", "#0A0A1A"
))

book[["book_snow_crash"]] <- qpal(c(
  "#0A0A1A", "#1A2A3A", "#3A5A6B",
  "#FF1493", "#00FFFF", "#FFD700",
  "#6B8B8B", "#3A5A5A", "#0A0A1A"
))

book[["book_1984_orwell"]] <- qpal(c(
  "#1A1A1A", "#3A3A3A", "#6B6B6B",
  "#8B0000", "#C4202A", "#6B6B6B",
  "#3A3A3A", "#1A1A1A", "#0A0A0A"
))

book[["book_brave_new_world"]] <- qpal(c(
  "#E0E0E0", "#C0C0C0", "#A0A0A0",
  "#00CED1", "#1E90FF", "#00CED1",
  "#A0A0A0", "#808080", "#606060"
))

book[["book_fahrenheit451"]] <- qpal(c(
  "#0A0A0A", "#C4401A", "#E8783A",
  "#F4A020", "#FFD700", "#E8783A",
  "#C4401A", "#6B1A0A", "#0A0A0A"
))

book[["book_foundation_asimov"]] <- qpal(c(
  "#0A0A2A", "#1A2A5A", "#2A4A8B",
  "#6BA0C4", "#A0C4D4", "#6BA0C4",
  "#2A4A8B", "#1A2A5A", "#0A0A2A"
))

book[["book_moby_dick"]] <- qpal(c(
  "#0A2A3A", "#1A4A6B", "#2A6B8B",
  "#4A8BA0", "#6BA0B0", "#8BB8C0",
  "#6B8BA0", "#4A6B80", "#2A4A60"
))

book[["book_alice_wonderland"]] <- qpal(c(
  "#1E90FF", "#FFFFFF", "#FF1493",
  "#FFD700", "#00FF00", "#FF4500",
  "#9400D3", "#00CED1", "#FF69B4"
))

book[["book_dracula"]] <- qpal(c(
  "#0A0A0A", "#1A0A0A", "#3A1A1A",
  "#8B0000", "#C4202A", "#8B0000",
  "#3A1A1A", "#1A0A0A", "#0A0A0A"
))

book[["book_frankenstein"]] <- qpal(c(
  "#0A2A0A", "#1A4A1A", "#2A6B2A",
  "#4A8B4A", "#808080", "#4A8B4A",
  "#2A6B2A", "#1A4A1A", "#0A0A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  CYBERPUNK & SCI-FI AESTHETICS
# ══════════════════════════════════════════════════════════════════════════

cyber <- list()

cyber[["cyber_2077_night_city"]] <- qpal(c(
  "#0A0A0A", "#1A002A", "#3A0060",
  "#FF00FF", "#00FFFF", "#FF1493",
  "#C400FF", "#6B00B0", "#0A0A0A"
))

cyber[["cyber_2077_johnny_silverhand"]] <- qpal(c(
  "#1A1A2A", "#3A3A5A", "#8B8B8B",
  "#C0C0C0", "#8B0000", "#C4202A",
  "#6B6B6B", "#3A3A3A", "#0A0A0A"
))

cyber[["cyber_blade_runner"]] <- qpal(c(
  "#0A0A0A", "#2A2A1A", "#8B6B1A",
  "#C4A020", "#FF1493", "#00FFFF",
  "#4A2A6B", "#1A1A3A", "#0A0A0A"
))

cyber[["cyber_ghost_in_shell"]] <- qpal(c(
  "#0A2A2A", "#1A5A4A", "#2A8B6A",
  "#00FF88", "#00CED1", "#C4A8A0",
  "#8B6B6B", "#3A3A3A", "#0A0A0A"
))

cyber[["cyber_matrix"]] <- qpal(c(
  "#0A0A0A", "#005000", "#00A000",
  "#00FF00", "#00FF00", "#00A000",
  "#005000", "#002000", "#0A0A0A"
))

cyber[["cyber_tron"]] <- qpal(c(
  "#0A0A2A", "#000080", "#0000FF",
  "#1E90FF", "#00FFFF", "#1E90FF",
  "#0000FF", "#000080", "#0A0A2A"
))

cyber[["cyber_akira"]] <- qpal(c(
  "#C4202A", "#E84545", "#F4A0A0",
  "#0A0A0A", "#2A2A2A", "#8B8B8B",
  "#C4202A", "#8B0000", "#0A0A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  SPACE AGENCIES & AEROSPACE
# ══════════════════════════════════════════════════════════════════════════

space <- list()

space[["space_nasa"]] <- qpal(c(
  "#0A0A2A", "#1A2A5A", "#C4202A",
  "#FFFFFF", "#004C99", "#C4202A",
  "#1A2A5A", "#0A0A2A", "#000000"
))

space[["space_nasa_worm"]] <- qpal(c(
  "#C4202A", "#E84545", "#F4A0A0",
  "#0A0A0A", "#2A2A2A", "#6B6B6B",
  "#C4202A", "#8B0000", "#0A0A0A"
))

space[["space_nasa_meatball"]] <- qpal(c(
  "#0A2A6B", "#1E3A8B", "#004C99",
  "#FFFFFF", "#C4202A", "#FFFFFF",
  "#004C99", "#1A2A5A", "#0A0A2A"
))

space[["space_noaa"]] <- qpal(c(
  "#0A2A6B", "#1A4A8B", "#2A6BB0",
  "#4A8BC4", "#8BB8D4", "#C4D8E0",
  "#F0F0F0", "#E0E0E0", "#C0C0C0"
))

space[["space_noaa_storm"]] <- qpal(c(
  "#0A0A2A", "#1A2A6B", "#2A5A8B",
  "#E8783A", "#C4401A", "#F4A020",
  "#2A5A8B", "#1A2A5A", "#0A0A2A"
))

space[["space_jaxa"]] <- qpal(c(
  "#FFFFFF", "#C4202A", "#FFFFFF",
  "#004C99", "#FFFFFF", "#C4202A",
  "#FFFFFF", "#0A0A0A", "#FFFFFF"
))

space[["space_esa"]] <- qpal(c(
  "#0A2A5A", "#1A4A8B", "#2A6BB0",
  "#4A8BC4", "#0A2A5A", "#1A4A8B",
  "#2A6BB0", "#4A8BC4", "#0A2A5A"
))

space[["space_spacex"]] <- qpal(c(
  "#0A0A1A", "#1A1A2A", "#3A3A5A",
  "#6B6B8B", "#C0C0C0", "#F0F0F0",
  "#6B6B8B", "#3A3A5A", "#0A0A1A"
))

space[["space_roscosmos"]] <- qpal(c(
  "#C4202A", "#FFFFFF", "#004C99",
  "#C4202A", "#FFFFFF", "#004C99",
  "#C4202A", "#FFFFFF", "#004C99"
))

space[["space_apollo"]] <- qpal(c(
  "#1A1A2A", "#3A3A5A", "#8B8B8B",
  "#C0C0C0", "#F0E8C0", "#C4A060",
  "#8B6B3A", "#4A3A2A", "#0A0A0A"
))

space[["space_hubble"]] <- qpal(c(
  "#0A0A2A", "#1A0050", "#3A00A0",
  "#6B2AFF", "#C480FF", "#E0C0FF",
  "#C480FF", "#6B2AFF", "#0A0A2A"
))

space[["space_jwst"]] <- qpal(c(
  "#0A0A0A", "#1A1A2A", "#C4A020",
  "#E8C840", "#F0E8C0", "#E8C840",
  "#C4A020", "#6B6B3A", "#0A0A0A"
))

space[["space_mars_rover"]] <- qpal(c(
  "#C4401A", "#E8783A", "#F4A020",
  "#F0D860", "#D4B080", "#C49A6A",
  "#8B6B4A", "#6B4A3A", "#4A2A2A"
))

space[["space_voyager"]] <- qpal(c(
  "#0A0A2A", "#1A2A6B", "#C4A020",
  "#E8D440", "#2A6BB0", "#C4A020",
  "#1A2A6B", "#0A0A2A", "#000000"
))

# ══════════════════════════════════════════════════════════════════════════
#  CINEMA / STUDIOS
# ══════════════════════════════════════════════════════════════════════════

cinema <- list()

cinema[["cinema_mgm_lion"]] <- qpal(c(
  "#0A0A0A", "#C4A020", "#E8D440",
  "#F0E860", "#C4A020", "#8B6B20",
  "#C4202A", "#8B0000", "#0A0A0A"
))

cinema[["cinema_universal"]] <- qpal(c(
  "#0A2A5A", "#1A4A8B", "#2A6BB0",
  "#4A8BC4", "#F0E8C0", "#E8D4A0",
  "#C4A060", "#8B6B3A", "#0A2A5A"
))

cinema[["cinema_paramount"]] <- qpal(c(
  "#0A2A5A", "#1A4A8B", "#FFFFFF",
  "#C4A020", "#E8D440", "#C4A020",
  "#FFFFFF", "#1A4A8B", "#0A2A5A"
))

cinema[["cinema_warner_bros"]] <- qpal(c(
  "#C4A020", "#E8D440", "#0A2A5A",
  "#1A4A8B", "#C4A020", "#E8D440",
  "#0A2A5A", "#1A4A8B", "#C4A020"
))

cinema[["cinema_20th_century_fox"]] <- qpal(c(
  "#0A2A5A", "#1A4A8B", "#C4A020",
  "#F0E8C0", "#C4A020", "#E8D440",
  "#1A4A8B", "#0A2A5A", "#000000"
))

cinema[["cinema_technicolor"]] <- qpal(c(
  "#C4202A", "#E84545", "#F4A020",
  "#00C420", "#2E8B57", "#1E90FF",
  "#FF1493", "#FFD700", "#C4202A"
))

cinema[["cinema_film_noir"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#3A3A3A",
  "#6B6B6B", "#A0A0A0", "#6B6B6B",
  "#3A3A3A", "#1A1A1A", "#0A0A0A"
))

cinema[["cinema_technicolor_wizard_oz"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C4202A",
  "#FFD700", "#00A000", "#004C99",
  "#FF1493", "#C4202A", "#4A3A2A"
))

# ══════════════════════════════════════════════════════════════════════════
#  VIDEO GAMES
# ══════════════════════════════════════════════════════════════════════════

game <- list()

game[["game_street_fighter_ryu"]] <- qpal(c(
  "#FFFFFF", "#C0C0C0", "#C4202A",
  "#8B0000", "#0A0A0A", "#C4202A",
  "#FFFFFF", "#8B0000", "#0A0A0A"
))

game[["game_street_fighter_chun_li"]] <- qpal(c(
  "#004C99", "#1E90FF", "#C4A060",
  "#F0D8A0", "#C4202A", "#C4A060",
  "#004C99", "#1E90FF", "#FFFFFF"
))

game[["game_street_fighter_vega"]] <- qpal(c(
  "#9400D3", "#C400FF", "#FFD700",
  "#C4A020", "#9400D3", "#FFD700",
  "#C400FF", "#FFD700", "#9400D3"
))

game[["game_street_fighter_akuma"]] <- qpal(c(
  "#0A0A0A", "#2A0A0A", "#C4202A",
  "#E84545", "#F4A020", "#E84545",
  "#C4202A", "#2A0A0A", "#0A0A0A"
))

game[["game_street_fighter_blanka"]] <- qpal(c(
  "#00A000", "#00C420", "#F4A020",
  "#FFD700", "#00A000", "#00C420",
  "#F4A020", "#FFD700", "#00A000"
))

game[["game_pacman"]] <- qpal(c(
  "#0A0A0A", "#000080", "#FFFF00",
  "#FFD700", "#FF00FF", "#00FFFF",
  "#FF0000", "#FFFF00", "#0A0A0A"
))

game[["game_tetris"]] <- qpal(c(
  "#0A0A0A", "#FF0000", "#00FF00",
  "#0000FF", "#FFFF00", "#FF00FF",
  "#00FFFF", "#FFD700", "#0A0A0A"
))

game[["game_space_invaders"]] <- qpal(c(
  "#0A0A0A", "#00FF00", "#0A0A0A",
  "#00FF00", "#FFFFFF", "#00FF00",
  "#0A0A0A", "#00FF00", "#0A0A0A"
))

game[["game_super_mario"]] <- qpal(c(
  "#C4202A", "#FFFFFF", "#004C99",
  "#FFD700", "#C4202A", "#00A000",
  "#FFFFFF", "#004C99", "#C4202A"
))

game[["game_zelda"]] <- qpal(c(
  "#00A000", "#00C420", "#FFD700",
  "#C4A020", "#8B6B20", "#00A000",
  "#FFD700", "#C4202A", "#00C420"
))

game[["game_metroid"]] <- qpal(c(
  "#0A0A1A", "#1A2A4A", "#F4A020",
  "#FFD700", "#C4202A", "#F4A020",
  "#1A2A4A", "#0A0A1A", "#000000"
))

game[["game_sonic"]] <- qpal(c(
  "#1E90FF", "#00CED1", "#FFFFFF",
  "#C4202A", "#FFD700", "#00A000",
  "#1E90FF", "#004C99", "#0A0A0A"
))

game[["game_mega_man"]] <- qpal(c(
  "#1E90FF", "#00CED1", "#FFFFFF",
  "#1E90FF", "#004C99", "#FFD700",
  "#C4202A", "#1E90FF", "#004C99"
))

game[["game_castlevania"]] <- qpal(c(
  "#0A0A0A", "#2A0A0A", "#C4202A",
  "#8B0000", "#FFD700", "#C4A060",
  "#8B6B4A", "#4A3A2A", "#0A0A0A"
))

game[["game_final_fantasy"]] <- qpal(c(
  "#FFFFFF", "#C0C0C0", "#1E90FF",
  "#004C99", "#C4202A", "#FFD700",
  "#FFFFFF", "#1E90FF", "#004C99"
))

game[["game_doom"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#C4202A",
  "#E84545", "#F4A020", "#E8783A",
  "#C4401A", "#6B1A0A", "#0A0A0A"
))

game[["game_portal"]] <- qpal(c(
  "#FF4500", "#1E90FF", "#FFFFFF",
  "#808080", "#F4A020", "#00CED1",
  "#FF4500", "#1E90FF", "#808080"
))

game[["game_half_life"]] <- qpal(c(
  "#F4A020", "#FFD700", "#8B6B20",
  "#6B6B4A", "#4A6B4A", "#2A4A2A",
  "#F4A020", "#C4A020", "#8B6B20"
))

# ══════════════════════════════════════════════════════════════════════════
#  TV SHOWS & ERA
# ══════════════════════════════════════════════════════════════════════════

tv <- list()

tv[["tv_80s_sitcom"]] <- qpal(c(
  "#FF1493", "#FFD700", "#00CED1",
  "#FF4500", "#32CD32", "#FF69B4",
  "#1E90FF", "#FF6347", "#9400D3"
))

tv[["tv_90s_nickelodeon"]] <- qpal(c(
  "#FF4500", "#00A000", "#FFD700",
  "#1E90FF", "#FF1493", "#32CD32",
  "#FF6347", "#9400D3", "#00CED1"
))

tv[["tv_cartoon_network"]] <- qpal(c(
  "#000000", "#FFFFFF", "#FF0000",
  "#FFFF00", "#00FF00", "#0000FF",
  "#FF00FF", "#00FFFF", "#000000"
))

tv[["tv_twin_peaks"]] <- qpal(c(
  "#0A0A0A", "#2A1A1A", "#C4202A",
  "#8B0000", "#4A2A2A", "#8B6B4A",
  "#C4A060", "#4A2A2A", "#0A0A0A"
))

tv[["tv_x_files"]] <- qpal(c(
  "#0A0A0A", "#1A2A1A", "#2A4A2A",
  "#4A6B4A", "#6B8B4A", "#4A6B4A",
  "#2A4A2A", "#1A2A1A", "#0A0A0A"
))

tv[["tv_simpsons"]] <- qpal(c(
  "#FFD700", "#FF4500", "#1E90FF",
  "#00A000", "#FFFFFF", "#FF1493",
  "#FFD700", "#FF4500", "#1E90FF"
))

tv[["tv_breaking_bad"]] <- qpal(c(
  "#0A2A0A", "#1A4A1A", "#2A6B2A",
  "#4A8B4A", "#8B8B6B", "#C4C08B",
  "#A0A06B", "#6B8B4A", "#2A4A2A"
))

tv[["tv_stranger_things"]] <- qpal(c(
  "#0A0A0A", "#C4202A", "#FFD700",
  "#1E90FF", "#FF1493", "#00CED1",
  "#C4202A", "#2A0A0A", "#0A0A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  HISTORICAL ERAS
# ══════════════════════════════════════════════════════════════════════════

era <- list()

era[["era_ancient_egypt"]] <- qpal(c(
  "#C4A020", "#E8D440", "#F0E860",
  "#C4A8A0", "#8B7B6B", "#D4B080",
  "#A08060", "#6B4A3A", "#3A2A1A"
))

era[["era_ancient_greece"]] <- qpal(c(
  "#F0E8D8", "#E0D4C0", "#C8B8A0",
  "#B0A088", "#A09078", "#D0C0A8",
  "#C0B098", "#F0E8D8", "#FFFFFF"
))

era[["era_ancient_rome"]] <- qpal(c(
  "#8B0000", "#C4202A", "#C4A020",
  "#F0E8C0", "#E8D4A0", "#8B0000",
  "#C4202A", "#C4A020", "#6B6B4A"
))

era[["era_viking"]] <- qpal(c(
  "#2A2A2A", "#4A3A2A", "#6B5A4A",
  "#8B7B6B", "#A09888", "#6B8B8B",
  "#4A6B6B", "#2A4A4A", "#0A2A2A"
))

era[["era_medieval"]] <- qpal(c(
  "#2A2A1A", "#4A4A2A", "#6B6B4A",
  "#8B8B6B", "#A0A080", "#8B8B6B",
  "#6B6B4A", "#4A4A2A", "#2A2A1A"
))

era[["era_renaissance"]] <- qpal(c(
  "#2A3A4A", "#4A6B8B", "#8BB0C0",
  "#C4D4D4", "#F0E0C0", "#E8C8A0",
  "#D4A080", "#8B6B4A", "#4A3A2A"
))

era[["era_victorian"]] <- qpal(c(
  "#2A0A0A", "#4A2A1A", "#6B4A3A",
  "#8B6B5A", "#C4A8A0", "#A0806B",
  "#8B6B4A", "#4A3A2A", "#2A2A1A"
))

era[["era_industrial"]] <- qpal(c(
  "#1A1A1A", "#3A3A3A", "#6B6B6B",
  "#8B8B8B", "#A0A0A0", "#C4A080",
  "#8B6B4A", "#4A3A2A", "#1A1A1A"
))

era[["era_wild_west"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C49A6A",
  "#D4B080", "#E8C8A0", "#D4B080",
  "#8B6B4A", "#C4202A", "#4A2A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  NATURE & PHENOMENA
# ══════════════════════════════════════════════════════════════════════════

nature <- list()

nature[["nature_aurora_borealis"]] <- qpal(c(
  "#0A0A2A", "#00502A", "#00A050",
  "#00FF80", "#00CED1", "#C400FF",
  "#6B00B0", "#2A0050", "#0A0A2A"
))

nature[["nature_aurora_australis"]] <- qpal(c(
  "#0A2A2A", "#005050", "#00A0A0",
  "#FF1493", "#FF69B4", "#9400D3",
  "#4A00A0", "#1A0050", "#0A0A2A"
))

nature[["nature_coral_reef"]] <- qpal(c(
  "#00CED1", "#1E90FF", "#FF1493",
  "#FF69B4", "#FFD700", "#FF4500",
  "#32CD32", "#00CED1", "#1E90FF"
))

nature[["nature_volcano"]] <- qpal(c(
  "#0A0A0A", "#2A0A0A", "#C4401A",
  "#E8783A", "#F4A020", "#FFD700",
  "#E8783A", "#C4401A", "#0A0A0A"
))

nature[["nature_deep_ocean"]] <- qpal(c(
  "#0A0A2A", "#000050", "#000080",
  "#0000A0", "#0000C4", "#1E90FF",
  "#00CED1", "#00FFFF", "#E0F8FF"
))

nature[["nature_amazon"]] <- qpal(c(
  "#0A2A0A", "#005000", "#00A000",
  "#00C420", "#2E8B57", "#00A000",
  "#8B6B20", "#6B4A1A", "#2A2A0A"
))

nature[["nature_sahara"]] <- qpal(c(
  "#F0E0C0", "#E8D4A0", "#D4B080",
  "#C4A060", "#D4B080", "#E8C8A0",
  "#F0D8B0", "#F0E0C0", "#F8F0E0"
))

nature[["nature_sunset"]] <- qpal(c(
  "#0A2A4A", "#C4401A", "#E8783A",
  "#F4A020", "#FFD700", "#FF1493",
  "#9400D3", "#4A00A0", "#0A0A2A"
))

nature[["nature_forest_fire"]] <- qpal(c(
  "#0A0A0A", "#C4401A", "#F4A020",
  "#FFD700", "#E8783A", "#C4401A",
  "#F4A020", "#FFD700", "#C4401A"
))

nature[["nature_nebula"]] <- qpal(c(
  "#0A0A2A", "#1A0050", "#C400FF",
  "#FF69B4", "#00CED1", "#1E90FF",
  "#C400FF", "#6B00B0", "#0A0A2A"
))

nature[["nature_lightning"]] <- qpal(c(
  "#0A0A1A", "#2A2A4A", "#6B6B8B",
  "#F8F8FF", "#FFFFFF", "#F8F8FF",
  "#6B6B8B", "#2A2A4A", "#0A0A1A"
))

nature[["nature_autumn"]] <- qpal(c(
  "#8B0000", "#C4202A", "#E8783A",
  "#F4A020", "#FFD700", "#E8783A",
  "#8B6B20", "#4A3A10", "#2A2A0A"
))

nature[["nature_spring"]] <- qpal(c(
  "#FF69B4", "#FFB6C1", "#FFFFFF",
  "#98FB98", "#00FF00", "#98FB98",
  "#FFB6C1", "#FF69B4", "#FFFFFF"
))

nature[["nature_winter"]] <- qpal(c(
  "#FFFFFF", "#F0F0FF", "#E0E8FF",
  "#C0D0F0", "#A0C0E0", "#C0D0F0",
  "#E0E8FF", "#F0F0FF", "#FFFFFF"
))

# ══════════════════════════════════════════════════════════════════════════
#  MISCELLANEOUS / FUN
# ══════════════════════════════════════════════════════════════════════════

misc <- list()

misc[["misc_vaporwave"]] <- qpal(c(
  "#FF71CE", "#01CDFE", "#05FFA1",
  "#B967FF", "#FF71CE", "#FFFB96",
  "#01CDFE", "#B967FF", "#FF71CE"
))

misc[["misc_outrun"]] <- qpal(c(
  "#0A0020", "#C400FF", "#FF00FF",
  "#FF1493", "#FF4500", "#FFD700",
  "#FF00FF", "#C400FF", "#0A0020"
))

misc[["misc_sepia"]] <- qpal(c(
  "#F8F0E0", "#E8D8C0", "#D4C0A0",
  "#C4A880", "#B09068", "#A08058",
  "#8B6B40", "#6B4A2A", "#4A3A1A"
))

misc[["misc_cyanotype"]] <- qpal(c(
  "#F8F8FF", "#C4D4E8", "#8BB0D0",
  "#4A8BB8", "#1A5A9B", "#0A2A6B",
  "#C4D4E8", "#8BB0D0", "#F8F8FF"
))

misc[["misc_black_and_white"]] <- qpal(c(
  "#000000", "#202020", "#404040",
  "#606060", "#808080", "#A0A0A0",
  "#C0C0C0", "#E0E0E0", "#FFFFFF"
))

misc[["misc_steampunk"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C4A060",
  "#D4B080", "#C4A080", "#A0806B",
  "#8B7B6B", "#6B5A4A", "#2A1A0A"
))

misc[["misc_dieselpunk"]] <- qpal(c(
  "#2A2A2A", "#4A4A3A", "#6B6B4A",
  "#8B8B6B", "#6B5A3A", "#8B6B4A",
  "#4A3A2A", "#C4A060", "#2A2A2A"
))

misc[["misc_noir"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#2A2A2A",
  "#4A4A4A", "#6B6B6B", "#4A4A4A",
  "#2A2A2A", "#1A1A1A", "#0A0A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  ASSEMBLE ALL NEW PALETTES
# ══════════════════════════════════════════════════════════════════════════

all_categories <- list(
  art    = art,
  arch   = arch,
  decade = decade,
  book   = book,
  cyber  = cyber,
  space  = space,
  cinema = cinema,
  game   = game,
  tv     = tv,
  era    = era,
  nature = nature,
  misc   = misc
)

new_palettes <- list()
for (cat_name in names(all_categories)) {
  cat_pals <- all_categories[[cat_name]]
  for (pal_name in names(cat_pals)) {
    new_palettes[[pal_name]] <- cat_pals[[pal_name]]
  }
}

cat(sprintf("Created %d new palettes across %d categories.\n",
    length(new_palettes), length(all_categories)))

# ── Load existing sysdata ─────────────────────────────────────────────────
load("R/sysdata.rda")

old_count <- length(sysdata) - 1  # minus cpt_names

# ── Merge new palettes ────────────────────────────────────────────────────
for (pal_name in names(new_palettes)) {
  sysdata[[pal_name]] <- new_palettes[[pal_name]]
}

# ── Update cpt_names ──────────────────────────────────────────────────────
new_names <- names(new_palettes)
all_names <- c(sysdata[["cpt_names"]], new_names)
sysdata[["cpt_names"]] <- all_names

new_count <- length(sysdata) - 1
cat(sprintf("Before: %d palettes. After: %d palettes. Added: %d.\n",
    old_count, new_count, new_count - old_count))

# ── Save ──────────────────────────────────────────────────────────────────
save(sysdata, file = "R/sysdata.rda", compress = "xz")

# Save separate cpt_names dataset
cpt_names <- sysdata[["cpt_names"]]
save(cpt_names, file = "data/cpt_names.rda", compress = "xz")

cat(sprintf("\n=== Done! sysdata.rda has %d entries (%d palettes + cpt_names) ===\n",
    length(sysdata), length(sysdata) - 1))

# Print a few of the new names
cat("\nSample new palette names:\n")
print(sort(sample(new_names, min(20, length(new_names)))))
