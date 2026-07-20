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
#  MUSIC GENRES
# ══════════════════════════════════════════════════════════════════════════

music <- list()

music[["music_jazz"]] <- qpal(c(
  "#1A0A0A", "#3A1A0A", "#C4A020",
  "#E8C878", "#F0E0A0", "#C4A020",
  "#8B5A2A", "#4A2A1A", "#1A0A0A"
))

music[["music_blues"]] <- qpal(c(
  "#0A0A2A", "#1A1A4A", "#2A2A6B",
  "#4A4A8B", "#C4A060", "#E8C878",
  "#8B6B4A", "#4A3A2A", "#0A0A0A"
))

music[["music_rock"]] <- qpal(c(
  "#0A0A0A", "#C4202A", "#E84545",
  "#F4A0A0", "#0A0A0A", "#6B6B6B",
  "#C4202A", "#8B0000", "#0A0A0A"
))

music[["music_metal"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#3A3A3A",
  "#6B0000", "#8B0000", "#C4202A",
  "#3A3A3A", "#1A1A1A", "#0A0A0A"
))

music[["music_punk"]] <- qpal(c(
  "#FF1493", "#0A0A0A", "#FFD700",
  "#0A0A0A", "#00CED1", "#0A0A0A",
  "#C4202A", "#FFFFFF", "#0A0A0A"
))

music[["music_hip_hop"]] <- qpal(c(
  "#0A0A0A", "#C4A020", "#E8D440",
  "#F0E860", "#C4A020", "#8B6B20",
  "#4A3A10", "#0A0A0A", "#C4A020"
))

music[["music_electronic"]] <- qpal(c(
  "#0A002A", "#C400FF", "#FF00FF",
  "#00FFFF", "#00FF00", "#FFD700",
  "#FF00FF", "#C400FF", "#0A002A"
))

music[["music_techno"]] <- qpal(c(
  "#0A0A0A", "#1A1A2A", "#3A3A5A",
  "#FF00FF", "#00FFFF", "#FFD700",
  "#3A3A5A", "#1A1A2A", "#0A0A0A"
))

music[["music_house"]] <- qpal(c(
  "#FF4500", "#FFD700", "#FF1493",
  "#00CED1", "#32CD32", "#FFD700",
  "#FF4500", "#FF1493", "#00CED1"
))

music[["music_drum_and_bass"]] <- qpal(c(
  "#0A0A0A", "#1A2A3A", "#3A5A6B",
  "#FFD700", "#FF4500", "#00CED1",
  "#3A5A6B", "#1A2A3A", "#0A0A0A"
))

music[["music_reggae"]] <- qpal(c(
  "#006B0A", "#00A020", "#FFD700",
  "#C4202A", "#00A020", "#FFD700",
  "#C4202A", "#006B0A", "#002A00"
))

music[["music_classical"]] <- qpal(c(
  "#2A2A1A", "#4A3A2A", "#8B6B4A",
  "#C4A080", "#E8D4C0", "#F0E8D8",
  "#C4A080", "#8B6B4A", "#2A2A1A"
))

music[["music_bossa_nova"]] <- qpal(c(
  "#2A4A2A", "#4A6B3A", "#8BA060",
  "#C4D480", "#E8E8A0", "#C4D480",
  "#8BA060", "#4A6B3A", "#2A3A2A"
))

music[["music_samba"]] <- qpal(c(
  "#00A000", "#FFD700", "#00A000",
  "#1E90FF", "#FFFFFF", "#FFD700",
  "#00A000", "#FFD700", "#00A000"
))

music[["music_synthwave"]] <- qpal(c(
  "#0A0020", "#2A0050", "#C400FF",
  "#FF00FF", "#FF1493", "#FFD700",
  "#FF00FF", "#6B00B0", "#0A0020"
))

music[["music_vaporwave"]] <- qpal(c(
  "#FF71CE", "#01CDFE", "#05FFA1",
  "#B967FF", "#FFFB96", "#01CDFE",
  "#B967FF", "#FF71CE", "#01CDFE"
))

# ══════════════════════════════════════════════════════════════════════════
#  ANIME
# ══════════════════════════════════════════════════════════════════════════

anime <- list()

anime[["anime_studio_ghibli"]] <- qpal(c(
  "#2A4A2A", "#4A8B4A", "#8BC4A0",
  "#C4E0C0", "#F0E8D8", "#E8C8A0",
  "#C4A060", "#8B6B3A", "#4A3A2A"
))

anime[["anime_evangelion"]] <- qpal(c(
  "#9400D3", "#C400FF", "#00FF00",
  "#FF4500", "#0A0A0A", "#C4202A",
  "#9400D3", "#C400FF", "#0A0A0A"
))

anime[["anime_cowboy_bebop"]] <- qpal(c(
  "#0A0A2A", "#1A2A4A", "#3A5A6B",
  "#C4A060", "#E8C878", "#C4A060",
  "#8B6B3A", "#4A3A2A", "#0A0A2A"
))

anime[["anime_dragon_ball"]] <- qpal(c(
  "#FF4500", "#FFD700", "#1E90FF",
  "#FFFFFF", "#FF4500", "#FFD700",
  "#00A000", "#FF4500", "#1E90FF"
))

anime[["anime_sailor_moon"]] <- qpal(c(
  "#FF1493", "#FFFFFF", "#FFD700",
  "#1E90FF", "#FF69B4", "#FF1493",
  "#FFFFFF", "#FFD700", "#1E90FF"
))

anime[["anime_akira"]] <- qpal(c(
  "#C4202A", "#E84545", "#F4A0A0",
  "#0A0A0A", "#2A2A2A", "#8B8B8B",
  "#C4202A", "#8B0000", "#0A0A0A"
))

anime[["anime_totoro"]] <- qpal(c(
  "#4A6B4A", "#8BA06A", "#C4D48B",
  "#E8E0A0", "#8B8B6B", "#6B6B4A",
  "#4A4A3A", "#2A2A1A", "#1A1A0A"
))

anime[["anime_spirited_away"]] <- qpal(c(
  "#C4202A", "#E8783A", "#F4A020",
  "#FFD700", "#E8C8A0", "#C4A060",
  "#8B6B3A", "#4A3A2A", "#2A2A1A"
))

anime[["anime_one_punch"]] <- qpal(c(
  "#FFD700", "#C4202A", "#FFFFFF",
  "#C4202A", "#FFD700", "#FFFFFF",
  "#C4202A", "#1E90FF", "#FFD700"
))

anime[["anime_attack_titan"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C4A060",
  "#C4202A", "#8B0000", "#4A3A2A",
  "#6B6B4A", "#3A3A2A", "#1A1A0A"
))

anime[["anime_death_note"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#3A3A3A",
  "#C4202A", "#8B0000", "#C4202A",
  "#3A3A3A", "#1A1A1A", "#0A0A0A"
))

anime[["anime_your_name"]] <- qpal(c(
  "#FF69B4", "#FFB6C1", "#FFFFFF",
  "#87CEEB", "#FF4500", "#FF69B4",
  "#87CEEB", "#FFB6C1", "#FFFFFF"
))

anime[["anime_naruto"]] <- qpal(c(
  "#FF4500", "#FFD700", "#1E90FF",
  "#FF4500", "#FFD700", "#00A000",
  "#FF4500", "#1E90FF", "#FFD700"
))

# ══════════════════════════════════════════════════════════════════════════
#  CITIES
# ══════════════════════════════════════════════════════════════════════════

cities <- list()

cities[["city_tokyo_neon"]] <- qpal(c(
  "#0A0A1A", "#C400FF", "#FF00FF",
  "#00FFFF", "#FF1493", "#FFD700",
  "#FF00FF", "#C400FF", "#0A0A1A"
))

cities[["city_new_york"]] <- qpal(c(
  "#1A2A3A", "#3A4A5A", "#6B7B8B",
  "#C4A020", "#E8D440", "#F0E8C0",
  "#8B8B83", "#4A4A3A", "#1A1A0A"
))

cities[["city_rio_de_janeiro"]] <- qpal(c(
  "#00A000", "#00C420", "#FFD700",
  "#1E90FF", "#FFFFFF", "#00A000",
  "#FFD700", "#1E90FF", "#00C420"
))

cities[["city_paris"]] <- qpal(c(
  "#2A3A4A", "#4A6B8B", "#8BB0C0",
  "#C4A8A0", "#E8C8B0", "#F0E0D0",
  "#C4A8A0", "#8B7B6B", "#2A3A4A"
))

cities[["city_marrakesh"]] <- qpal(c(
  "#C4401A", "#E8783A", "#F4A020",
  "#FFD700", "#E8C8A0", "#C4A060",
  "#8B6B3A", "#4A3A2A", "#2A2A1A"
))

cities[["city_havana"]] <- qpal(c(
  "#FF1493", "#FFD700", "#00CED1",
  "#FF4500", "#F0E8C0", "#FFD700",
  "#FF1493", "#00CED1", "#FF4500"
))

cities[["city_london"]] <- qpal(c(
  "#2A2A2A", "#4A4A4A", "#8B8B8B",
  "#C4202A", "#004C99", "#8B8B8B",
  "#4A4A4A", "#2A2A2A", "#0A0A0A"
))

cities[["city_los_angeles"]] <- qpal(c(
  "#FF1493", "#FFD700", "#FF4500",
  "#1E90FF", "#FF69B4", "#00CED1",
  "#FFD700", "#FF4500", "#FF1493"
))

cities[["city_berlin"]] <- qpal(c(
  "#1A1A1A", "#3A3A3A", "#6B6B6B",
  "#FFD700", "#C4202A", "#FFD700",
  "#6B6B6B", "#3A3A3A", "#1A1A1A"
))

cities[["city_mumbai"]] <- qpal(c(
  "#FF4500", "#FFD700", "#FF1493",
  "#FF6347", "#F4A020", "#FFD700",
  "#FF4500", "#FF1493", "#FF6347"
))

# ══════════════════════════════════════════════════════════════════════════
#  MYTHOLOGY
# ══════════════════════════════════════════════════════════════════════════

myth <- list()

myth[["myth_norse"]] <- qpal(c(
  "#0A2A4A", "#1A4A6B", "#2A6B8B",
  "#4A8BA0", "#8B8B8B", "#C4A060",
  "#8B6B3A", "#4A3A2A", "#0A0A0A"
))

myth[["myth_greek"]] <- qpal(c(
  "#F0E8D8", "#E0D4C0", "#D0C0A8",
  "#C0B098", "#B0A088", "#A09078",
  "#908068", "#807058", "#706048"
))

myth[["myth_egyptian"]] <- qpal(c(
  "#C4A020", "#E8D440", "#F0E860",
  "#C49A4A", "#A08040", "#8B6B3A",
  "#C4202A", "#8B0000", "#0A0A0A"
))

myth[["myth_aztec"]] <- qpal(c(
  "#C4202A", "#E8783A", "#F4A020",
  "#FFD700", "#00A000", "#C4A020",
  "#E8783A", "#C4202A", "#0A0A0A"
))

myth[["myth_celtic"]] <- qpal(c(
  "#0A2A0A", "#1A4A1A", "#2A6B2A",
  "#4A8B4A", "#C4A060", "#E8C878",
  "#8B6B4A", "#4A3A2A", "#0A0A0A"
))

myth[["myth_japanese"]] <- qpal(c(
  "#C4202A", "#FFFFFF", "#0A0A0A",
  "#C4202A", "#FFFFFF", "#C4A060",
  "#8B6B4A", "#4A3A2A", "#0A0A0A"
))

myth[["myth_hindu"]] <- qpal(c(
  "#FF4500", "#FFD700", "#FF1493",
  "#9400D3", "#1E90FF", "#00A000",
  "#FF4500", "#FFD700", "#FF1493"
))

myth[["myth_native_american"]] <- qpal(c(
  "#8B4513", "#CD853F", "#DEB887",
  "#F5DEB3", "#D2691E", "#A0522D",
  "#8B4513", "#6B3410", "#4A2008"
))

# ══════════════════════════════════════════════════════════════════════════
#  SCIENTIFIC & MEDICAL
# ══════════════════════════════════════════════════════════════════════════

sci <- list()

sci[["sci_thermal"]] <- qpal(c(
  "#0A0A2A", "#0000FF", "#00FFFF",
  "#00FF00", "#FFFF00", "#FF0000",
  "#FF00FF", "#FFFFFF", "#FF0000"
))

sci[["sci_xray"]] <- qpal(c(
  "#0A0A2A", "#1A2A4A", "#3A5A6B",
  "#6B8B8B", "#8BA0A0", "#C0C0C0",
  "#E0E0E0", "#F0F0FF", "#FFFFFF"
))

sci[["sci_petri_dish"]] <- qpal(c(
  "#FF69B4", "#FF1493", "#FFB6C1",
  "#F0E0D0", "#E8C8B0", "#D4B098",
  "#C4A080", "#A08060", "#8B6B4A"
))

sci[["sci_spectrum"]] <- qpal(c(
  "#8B00FF", "#0000FF", "#00FF00",
  "#FFFF00", "#FF8C00", "#FF0000",
  "#8B00FF", "#0000FF", "#00FF00"
))

sci[["sci_electromagnetic"]] <- qpal(c(
  "#9400D3", "#0000FF", "#00FFFF",
  "#00FF00", "#FFFF00", "#FFA500",
  "#FF0000", "#C400FF", "#9400D3"
))

sci[["sci_dna"]] <- qpal(c(
  "#C4202A", "#1E90FF", "#C4202A",
  "#1E90FF", "#C4202A", "#1E90FF",
  "#C4202A", "#1E90FF", "#C4202A"
))

sci[["sci_mri_rainbow"]] <- qpal(c(
  "#0A0A2A", "#0000FF", "#00FFFF",
  "#00A000", "#FFD700", "#FF0000",
  "#00FFFF", "#0000FF", "#0A0A2A"
))

sci[["sci_microscope"]] <- qpal(c(
  "#1A002A", "#3A0060", "#6B00A0",
  "#C400FF", "#FF69B4", "#C400FF",
  "#6B00A0", "#3A0060", "#1A002A"
))

sci[["sci_periodic_table"]] <- qpal(c(
  "#FF0000", "#FF4500", "#FFD700",
  "#00A000", "#1E90FF", "#004C99",
  "#C4A020", "#808080", "#0A0A0A"
))

sci[["sci_cell_biology"]] <- qpal(c(
  "#FF69B4", "#FF1493", "#FFB6C1",
  "#00CED1", "#1E90FF", "#98FB98",
  "#FFD700", "#FF69B4", "#FF1493"
))

# ══════════════════════════════════════════════════════════════════════════
#  BRAZIL
# ══════════════════════════════════════════════════════════════════════════

brazil <- list()

brazil[["brazil_carnival"]] <- qpal(c(
  "#00A000", "#FFD700", "#1E90FF",
  "#FFFFFF", "#FF1493", "#FFD700",
  "#00A000", "#1E90FF", "#FF1493"
))

brazil[["brazil_amazon"]] <- qpal(c(
  "#0A2A0A", "#005000", "#00A000",
  "#00C420", "#8B6B20", "#6B4A10",
  "#00A000", "#005000", "#0A2A0A"
))

brazil[["brazil_flag"]] <- qpal(c(
  "#009C3B", "#FFDF00", "#009C3B",
  "#002776", "#FFFFFF", "#009C3B",
  "#FFDF00", "#002776", "#009C3B"
))

brazil[["brazil_bossa_nova"]] <- qpal(c(
  "#4A6B4A", "#8BA06A", "#C4D48B",
  "#F0E0C0", "#E8C8A0", "#C4A060",
  "#8B6B3A", "#4A3A2A", "#2A2A1A"
))

brazil[["brazil_tropicalia"]] <- qpal(c(
  "#FF1493", "#FFD700", "#00CED1",
  "#FF4500", "#32CD32", "#FF69B4",
  "#FFD700", "#FF4500", "#FF1493"
))

brazil[["brazil_oscar_niemeyer"]] <- qpal(c(
  "#F8F8F8", "#E8E8E0", "#D0D0C8",
  "#B8B8B0", "#A0A098", "#C0C0B8",
  "#E0E0D8", "#F0F0E8", "#FFFFFF"
))

brazil[["brazil_ipanema"]] <- qpal(c(
  "#FFD700", "#F4A020", "#E8783A",
  "#1E90FF", "#00CED1", "#FFD700",
  "#F4A020", "#E8783A", "#FFFFFF"
))

brazil[["brazil_pantanal"]] <- qpal(c(
  "#1A4A2A", "#2A6B3A", "#4A8B4A",
  "#8BC4A0", "#C4E0C0", "#F0E8D8",
  "#E8C8A0", "#8B6B3A", "#2A4A2A"
))

brazil[["brazil_caatinga"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C49A6A",
  "#D4B080", "#C4A060", "#8B6B4A",
  "#6B5A3A", "#4A3A2A", "#2A2A1A"
))

brazil[["brazil_cerrado"]] <- qpal(c(
  "#4A3A2A", "#8B5A2A", "#C4783A",
  "#E8A838", "#FFD700", "#E8A838",
  "#8B5A2A", "#4A3A2A", "#2A2A1A"
))

brazil[["brazil_sao_paulo"]] <- qpal(c(
  "#1A1A1A", "#3A3A3A", "#6B6B6B",
  "#A0A0A0", "#C4A020", "#E8D440",
  "#A0A0A0", "#6B6B6B", "#1A1A1A"
))

# ══════════════════════════════════════════════════════════════════════════
#  FILMS
# ══════════════════════════════════════════════════════════════════════════

films <- list()

films[["film_star_wars"]] <- qpal(c(
  "#0A0A0A", "#1A2A4A", "#FFD700",
  "#C4A020", "#C4202A", "#00A000",
  "#1E90FF", "#FFD700", "#0A0A0A"
))

films[["film_jurassic_park"]] <- qpal(c(
  "#0A2A0A", "#1A4A1A", "#2A6B2A",
  "#C4A020", "#E8783A", "#C4202A",
  "#2A6B2A", "#1A4A1A", "#0A0A0A"
))

films[["film_indiana_jones"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C49A6A",
  "#D4B080", "#C4202A", "#8B0000",
  "#C49A6A", "#8B6B4A", "#4A3A2A"
))

films[["film_alien"]] <- qpal(c(
  "#0A0A0A", "#1A2A1A", "#2A4A2A",
  "#4A6B4A", "#6B8B6B", "#4A6B4A",
  "#2A4A2A", "#1A2A1A", "#0A0A0A"
))

films[["film_the_shining"]] <- qpal(c(
  "#C4202A", "#E84545", "#F4A0A0",
  "#FFFFFF", "#C4202A", "#8B0000",
  "#4A2A1A", "#2A1A0A", "#0A0A0A"
))

films[["film_inception"]] <- qpal(c(
  "#0A0A2A", "#1A2A4A", "#3A5A6B",
  "#F4A020", "#FFD700", "#F4A020",
  "#3A5A6B", "#1A2A4A", "#0A0A2A"
))

films[["film_mad_max"]] <- qpal(c(
  "#F4A020", "#FFD700", "#E8783A",
  "#C4401A", "#8B0000", "#0A0A0A",
  "#1E90FF", "#00CED1", "#F4A020"
))

films[["film_interstellar"]] <- qpal(c(
  "#0A0A0A", "#1A2A3A", "#3A5A6B",
  "#6B8BA0", "#C4D4D4", "#F0E8D8",
  "#3A5A6B", "#1A2A3A", "#0A0A0A"
))

films[["film_pulp_fiction"]] <- qpal(c(
  "#C4202A", "#FFD700", "#0A0A0A",
  "#FFFFFF", "#C4202A", "#FFD700",
  "#0A0A0A", "#FFFFFF", "#C4202A"
))

films[["film_the_godfather"]] <- qpal(c(
  "#0A0A0A", "#2A1A0A", "#4A2A1A",
  "#8B0000", "#C4202A", "#8B0000",
  "#4A2A1A", "#2A1A0A", "#0A0A0A"
))

films[["film_spirited_away"]] <- qpal(c(
  "#C4202A", "#E8783A", "#F4A020",
  "#FFD700", "#E8C8A0", "#C4A060",
  "#8B6B3A", "#4A3A2A", "#2A2A1A"
))

# ══════════════════════════════════════════════════════════════════════════
#  GEMSTONES & MINERALS
# ══════════════════════════════════════════════════════════════════════════

gems <- list()

gems[["gem_amethyst"]] <- qpal(c(
  "#2A1A4A", "#4A2A6B", "#6B3A8B",
  "#A060C4", "#C480E0", "#A060C4",
  "#6B3A8B", "#4A2A6B", "#2A1A4A"
))

gems[["gem_emerald"]] <- qpal(c(
  "#0A2A2A", "#005A4A", "#008B6A",
  "#00C48B", "#00E8A0", "#00C48B",
  "#008B6A", "#005A4A", "#0A2A2A"
))

gems[["gem_ruby"]] <- qpal(c(
  "#2A0A0A", "#6B0000", "#8B0000",
  "#C4202A", "#E84545", "#C4202A",
  "#8B0000", "#6B0000", "#2A0A0A"
))

gems[["gem_sapphire"]] <- qpal(c(
  "#0A0A2A", "#00006B", "#00008B",
  "#1E40C4", "#1E6BE8", "#1E40C4",
  "#00008B", "#00006B", "#0A0A2A"
))

gems[["gem_obsidian"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#2A2A2A",
  "#4A004A", "#6B006B", "#4A004A",
  "#2A2A2A", "#1A1A1A", "#0A0A0A"
))

gems[["gem_opal"]] <- qpal(c(
  "#FF69B4", "#00CED1", "#FFD700",
  "#FFFFFF", "#FF69B4", "#00CED1",
  "#FFD700", "#FFFFFF", "#FF69B4"
))

gems[["gem_topaz"]] <- qpal(c(
  "#FFD700", "#F4A020", "#E8783A",
  "#FFD700", "#F4A020", "#E8783A",
  "#FFD700", "#F4A020", "#E8783A"
))

gems[["gem_turquoise"]] <- qpal(c(
  "#00CED1", "#20B2AA", "#3CB371",
  "#00CED1", "#48D1CC", "#00CED1",
  "#20B2AA", "#3CB371", "#00CED1"
))

gems[["gem_citrine"]] <- qpal(c(
  "#FFD700", "#FFC107", "#FFB300",
  "#FFA000", "#FF8F00", "#FFA000",
  "#FFB300", "#FFC107", "#FFD700"
))

gems[["gem_malachite"]] <- qpal(c(
  "#0A2A0A", "#005020", "#008030",
  "#00C450", "#00E860", "#00C450",
  "#008030", "#005020", "#0A2A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  WEATHER
# ══════════════════════════════════════════════════════════════════════════

weather <- list()

weather[["weather_hurricane"]] <- qpal(c(
  "#0A0A2A", "#1A2A6B", "#2A5A8B",
  "#E8783A", "#C4401A", "#F4A020",
  "#2A5A8B", "#1A2A5A", "#0A0A2A"
))

weather[["weather_rainbow"]] <- qpal(c(
  "#FF0000", "#FF7F00", "#FFFF00",
  "#00FF00", "#0000FF", "#4B0082",
  "#9400D3", "#FF0000", "#FF7F00"
))

weather[["weather_blizzard"]] <- qpal(c(
  "#FFFFFF", "#F0F0FF", "#E0E8FF",
  "#C0D0F0", "#A0C0E0", "#C0D0F0",
  "#E0E8FF", "#F0F0FF", "#FFFFFF"
))

weather[["weather_fog"]] <- qpal(c(
  "#C0C0C0", "#B0B0B0", "#A0A0A0",
  "#909090", "#808080", "#909090",
  "#A0A0A0", "#B0B0B0", "#C0C0C0"
))

weather[["weather_lightning_storm"]] <- qpal(c(
  "#0A0A1A", "#2A2A4A", "#6B6B8B",
  "#F8F8FF", "#FFFFFF", "#FFD700",
  "#6B6B8B", "#2A2A4A", "#0A0A1A"
))

weather[["weather_twilight"]] <- qpal(c(
  "#0A0A2A", "#1A0040", "#C4401A",
  "#E8783A", "#FF69B4", "#9400D3",
  "#4A00A0", "#1A0050", "#0A0A2A"
))

weather[["weather_desert_heat"]] <- qpal(c(
  "#FFD700", "#F4A020", "#E8783A",
  "#C4401A", "#FFD700", "#F4A020",
  "#E8783A", "#C4401A", "#8B0000"
))

weather[["weather_ocean_storm"]] <- qpal(c(
  "#0A2A4A", "#004080", "#0060A0",
  "#FFFFFF", "#C0D0E0", "#FFFFFF",
  "#0060A0", "#004080", "#0A2A4A"
))

weather[["weather_sunrise"]] <- qpal(c(
  "#0A0A2A", "#2A0050", "#C4401A",
  "#E8783A", "#F4A020", "#FFD700",
  "#FF69B4", "#FFB6C1", "#FFFFFF"
))

weather[["weather_fire_sky"]] <- qpal(c(
  "#0A0A0A", "#2A0A0A", "#C4401A",
  "#E8783A", "#F4A020", "#E8783A",
  "#C4401A", "#6B1A0A", "#0A0A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  COMICS & MANGA
# ══════════════════════════════════════════════════════════════════════════

comics <- list()

comics[["comics_marvel"]] <- qpal(c(
  "#C4202A", "#FFFFFF", "#004C99",
  "#C4202A", "#FFD700", "#C4202A",
  "#FFFFFF", "#004C99", "#C4202A"
))

comics[["comics_dc"]] <- qpal(c(
  "#004C99", "#1E90FF", "#C4202A",
  "#FFD700", "#004C99", "#1E90FF",
  "#C4202A", "#FFD700", "#004C99"
))

comics[["comics_watchmen"]] <- qpal(c(
  "#FFD700", "#000000", "#FFD700",
  "#C4A020", "#8B0000", "#000000",
  "#FFD700", "#000000", "#FFD700"
))

comics[["comics_sin_city"]] <- qpal(c(
  "#FFFFFF", "#C0C0C0", "#808080",
  "#C4202A", "#FFD700", "#C4202A",
  "#808080", "#C0C0C0", "#FFFFFF"
))

comics[["comics_manga_panel"]] <- qpal(c(
  "#FFFFFF", "#E0E0E0", "#C0C0C0",
  "#A0A0A0", "#808080", "#606060",
  "#404040", "#202020", "#000000"
))

comics[["comics_hellboy"]] <- qpal(c(
  "#C4202A", "#E84545", "#F4A020",
  "#0A0A0A", "#3A3A3A", "#C4202A",
  "#E84545", "#8B0000", "#0A0A0A"
))

comics[["comics_tintin"]] <- qpal(c(
  "#1E90FF", "#FFFFFF", "#C4202A",
  "#FFD700", "#1E90FF", "#FFFFFF",
  "#00A000", "#1E90FF", "#FFFFFF"
))

comics[["comics_calvin_hobbes"]] <- qpal(c(
  "#FF4500", "#FFD700", "#0A0A0A",
  "#FFFFFF", "#FF4500", "#FFD700",
  "#00A000", "#FFFFFF", "#FF4500"
))

comics[["comics_asterix"]] <- qpal(c(
  "#C4202A", "#004C99", "#FFFFFF",
  "#FFD700", "#00A000", "#C4202A",
  "#004C99", "#FFFFFF", "#FFD700"
))

# ══════════════════════════════════════════════════════════════════════════
#  FOOD & DRINK
# ══════════════════════════════════════════════════════════════════════════

food <- list()

food[["food_coffee"]] <- qpal(c(
  "#2A1A0A", "#4A2A1A", "#6B3A2A",
  "#8B5A3A", "#A06B4A", "#8B5A3A",
  "#6B3A2A", "#4A2A1A", "#2A1A0A"
))

food[["food_wine"]] <- qpal(c(
  "#2A0A0A", "#4A1A1A", "#6B2A2A",
  "#8B1A3A", "#6B0A2A", "#4A0A1A",
  "#8B1A3A", "#6B2A2A", "#2A0A0A"
))

food[["food_sushi"]] <- qpal(c(
  "#FF4500", "#FFFFFF", "#00A000",
  "#FFD700", "#FF4500", "#FFFFFF",
  "#FF69B4", "#FF4500", "#00A000"
))

food[["food_tropical"]] <- qpal(c(
  "#FFD700", "#FF4500", "#FF1493",
  "#00A000", "#FFD700", "#FF4500",
  "#FF1493", "#00CED1", "#FFD700"
))

food[["food_pizza"]] <- qpal(c(
  "#C4A060", "#D4B080", "#E8C8A0",
  "#C4202A", "#FFFFFF", "#C4202A",
  "#C4A060", "#8B6B4A", "#4A3A2A"
))

food[["food_matcha"]] <- qpal(c(
  "#4A8B4A", "#6BA86B", "#8BC48B",
  "#A0D8A0", "#C4E8C4", "#A0D8A0",
  "#6BA86B", "#4A8B4A", "#2A5A2A"
))

food[["food_chocolate"]] <- qpal(c(
  "#2A1A0A", "#4A2A1A", "#6B3A2A",
  "#8B5A3A", "#6B3A2A", "#4A2A1A",
  "#8B5A3A", "#C4A080", "#E8D4C0"
))

food[["food_berries"]] <- qpal(c(
  "#8B0000", "#C4202A", "#9400D3",
  "#FF1493", "#C4202A", "#8B0000",
  "#9400D3", "#FF69B4", "#FF1493"
))

food[["food_citrus"]] <- qpal(c(
  "#FFD700", "#FFA500", "#FF4500",
  "#00A000", "#FFD700", "#FFA500",
  "#FF4500", "#00CED1", "#FFD700"
))

food[["food_bbq"]] <- qpal(c(
  "#2A0A0A", "#6B1A0A", "#C4401A",
  "#E8783A", "#F4A020", "#C4401A",
  "#6B1A0A", "#2A0A0A", "#0A0A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  ICONIC ALBUMS
# ══════════════════════════════════════════════════════════════════════════

albums <- list()

albums[["album_dark_side"]] <- qpal(c(
  "#0A0A0A", "#FFFFFF", "#0A0A0A",
  "#C4202A", "#FFD700", "#00A000",
  "#004C99", "#FFFFFF", "#0A0A0A"
))

albums[["album_abbey_road"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#3A3A3A",
  "#6B6B6B", "#A0A0A0", "#C0C0C0",
  "#6B6B6B", "#3A3A3A", "#0A0A0A"
))

albums[["album_unknown_pleasures"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#2A2A2A",
  "#FFFFFF", "#E0E0E0", "#FFFFFF",
  "#2A2A2A", "#1A1A1A", "#0A0A0A"
))

albums[["album_purple_rain"]] <- qpal(c(
  "#9400D3", "#C400FF", "#6B00B0",
  "#FF1493", "#C400FF", "#9400D3",
  "#FFD700", "#C400FF", "#9400D3"
))

albums[["album_nevermind"]] <- qpal(c(
  "#1E90FF", "#00CED1", "#0A0A0A",
  "#FFD700", "#1E90FF", "#00CED1",
  "#0A0A0A", "#1E90FF", "#00CED1"
))

albums[["album_ok_computer"]] <- qpal(c(
  "#FFFFFF", "#C0C0C0", "#808080",
  "#1E90FF", "#C4202A", "#1E90FF",
  "#808080", "#C0C0C0", "#FFFFFF"
))

albums[["album_rumours"]] <- qpal(c(
  "#0A0A0A", "#FFFFFF", "#C4A060",
  "#F0E8D8", "#E8D4C0", "#C4A060",
  "#FFFFFF", "#0A0A0A", "#C4A060"
))

albums[["album_thriller"]] <- qpal(c(
  "#FFFFFF", "#C4202A", "#FFD700",
  "#C4202A", "#FFFFFF", "#0A0A0A",
  "#C4202A", "#FFD700", "#FFFFFF"
))

albums[["album_random_access"]] <- qpal(c(
  "#0A0A0A", "#C0C0C0", "#FFD700",
  "#FF4500", "#C0C0C0", "#0A0A0A",
  "#FFD700", "#C0C0C0", "#0A0A0A"
))

albums[["album_velvet_underground"]] <- qpal(c(
  "#FFD700", "#F4A020", "#C4A020",
  "#0A0A0A", "#FFD700", "#0A0A0A",
  "#F4A020", "#C4A020", "#0A0A0A"
))

# ══════════════════════════════════════════════════════════════════════════
#  PHOTOGRAPHY FILM STOCKS
# ══════════════════════════════════════════════════════════════════════════

photo <- list()

photo[["photo_kodachrome"]] <- qpal(c(
  "#C4202A", "#E8783A", "#F4A020",
  "#FFD700", "#E8C8A0", "#C4A060",
  "#8B6B3A", "#4A3A2A", "#2A2A1A"
))

photo[["photo_fuji_velvia"]] <- qpal(c(
  "#2A4A2A", "#4A8B4A", "#00A0A0",
  "#1E90FF", "#C4A020", "#F4A020",
  "#E8783A", "#6B4A2A", "#2A2A1A"
))

photo[["photo_tri_x"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#3A3A3A",
  "#6B6B6B", "#A0A0A0", "#C0C0C0",
  "#6B6B6B", "#3A3A3A", "#0A0A0A"
))

photo[["photo_ilford_hp5"]] <- qpal(c(
  "#1A1A1A", "#2A2A2A", "#4A4A4A",
  "#6B6B6B", "#8B8B8B", "#6B6B6B",
  "#4A4A4A", "#2A2A2A", "#1A1A1A"
))

photo[["photo_portra"]] <- qpal(c(
  "#F0D8C0", "#E8C8B0", "#D4B098",
  "#C4A080", "#D4B098", "#E8C8B0",
  "#F0D8C0", "#F8E8D8", "#FFF0E8"
))

photo[["photo_ektachrome"]] <- qpal(c(
  "#004C99", "#1E90FF", "#00CED1",
  "#C4A020", "#F4A020", "#E8783A",
  "#C4202A", "#8B0000", "#2A0A0A"
))

photo[["photo_daguerreotype"]] <- qpal(c(
  "#C4A080", "#B09070", "#A08060",
  "#908050", "#807040", "#908050",
  "#A08060", "#B09070", "#C4A080"
))

photo[["photo_cyanotype"]] <- qpal(c(
  "#FFFFFF", "#E0E8F0", "#C0D0E0",
  "#4A8BB8", "#1A5A9B", "#0A2A6B",
  "#4A8BB8", "#C0D0E0", "#FFFFFF"
))

photo[["photo_lomography"]] <- qpal(c(
  "#FF1493", "#FF4500", "#FFD700",
  "#00A000", "#1E90FF", "#FF1493",
  "#FF4500", "#FFD700", "#00A000"
))

photo[["photo_polaroid"]] <- qpal(c(
  "#FFFFFF", "#F8F0E0", "#F0E0C0",
  "#E8D4A0", "#F0E0C0", "#F8F0E0",
  "#FFFFFF", "#E0E0E0", "#C0C0C0"
))

# ══════════════════════════════════════════════════════════════════════════
#  🕷️ SPIDER-VERSE — Every dimension, every character
# ══════════════════════════════════════════════════════════════════════════

spider <- list()

# ── Heroes ────────────────────────────────────────────────────────────────

spider[["spider_man"]] <- qpal(c(
  "#C4202A", "#E84545", "#1E90FF",
  "#004C99", "#C4202A", "#1E90FF",
  "#FFFFFF", "#C4202A", "#1E90FF"
))

spider[["spider_miles_morales"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#C4202A",
  "#FF1493", "#C400FF", "#FF00FF",
  "#C4202A", "#1A1A1A", "#0A0A0A"
))

spider[["spider_gwen"]] <- qpal(c(
  "#FFFFFF", "#F0E8F0", "#E8D0E8",
  "#FF69B4", "#00CED1", "#FF69B4",
  "#E8D0E8", "#F0E8F0", "#FFFFFF"
))

spider[["spider_noir"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#3A3A3A",
  "#6B6B6B", "#A0A0A0", "#C0C0C0",
  "#6B6B6B", "#3A3A3A", "#0A0A0A"
))

spider[["spider_2099"]] <- qpal(c(
  "#0A0A1A", "#000080", "#004C99",
  "#1E90FF", "#00CED1", "#C4202A",
  "#FF4500", "#004C99", "#0A0A1A"
))

spider[["spider_ham"]] <- qpal(c(
  "#FFD700", "#FF4500", "#C4202A",
  "#1E90FF", "#FFFFFF", "#FFD700",
  "#FF69B4", "#FF4500", "#FFD700"
))

spider[["spider_peni"]] <- qpal(c(
  "#FF1493", "#FF69B4", "#C400FF",
  "#9400D3", "#00FFFF", "#FF00FF",
  "#C400FF", "#FF1493", "#FF69B4"
))

spider[["spider_punk"]] <- qpal(c(
  "#C4202A", "#FFFFFF", "#004C99",
  "#0A0A0A", "#C4202A", "#FFFFFF",
  "#004C99", "#FFD700", "#0A0A0A"
))

spider[["spider_pavitr"]] <- qpal(c(
  "#FF4500", "#FFD700", "#FF1493",
  "#00A000", "#1E90FF", "#FF4500",
  "#FFD700", "#FF1493", "#00A000"
))

spider[["spider_scarlet"]] <- qpal(c(
  "#C4202A", "#E84545", "#004C99",
  "#1E90FF", "#C4202A", "#FFFFFF",
  "#004C99", "#1E90FF", "#C4202A"
))

spider[["spider_superior"]] <- qpal(c(
  "#0A0A0A", "#C4202A", "#8B0000",
  "#C4202A", "#0A0A0A", "#C4202A",
  "#8B0000", "#C4202A", "#0A0A0A"
))

spider[["spider_symbiote"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#3A3A3A",
  "#FFFFFF", "#C0C0C0", "#FFFFFF",
  "#3A3A3A", "#1A1A1A", "#0A0A0A"
))

spider[["spider_byte"]] <- qpal(c(
  "#0A0020", "#00FF88", "#00CED1",
  "#FF00FF", "#C400FF", "#00FF88",
  "#00CED1", "#FF00FF", "#0A0020"
))

spider[["spider_1602"]] <- qpal(c(
  "#4A3A2A", "#8B6B4A", "#C4A060",
  "#C4202A", "#8B0000", "#C4A060",
  "#8B6B4A", "#4A3A2A", "#2A2A1A"
))

# ── Villains ──────────────────────────────────────────────────────────────

spider[["spider_spot"]] <- qpal(c(
  "#FFFFFF", "#F0F0F0", "#E0E0E0",
  "#0A0A0A", "#FFFFFF", "#0A0A0A",
  "#E0E0E0", "#F0F0F0", "#FFFFFF"
))

spider[["spider_green_goblin"]] <- qpal(c(
  "#9400D3", "#C400FF", "#00A000",
  "#00C420", "#9400D3", "#00A000",
  "#C400FF", "#9400D3", "#00C420"
))

spider[["spider_venom"]] <- qpal(c(
  "#0A0A0A", "#1A1A1A", "#3A3A3A",
  "#C0C0C0", "#FFFFFF", "#C0C0C0",
  "#FF69B4", "#C400FF", "#0A0A0A"
))

spider[["spider_doc_ock"]] <- qpal(c(
  "#0A2A0A", "#006B00", "#00A000",
  "#8B8B0A", "#C4A020", "#8B8B0A",
  "#00A000", "#006B00", "#0A2A0A"
))

spider[["spider_kingpin"]] <- qpal(c(
  "#F0F0F0", "#E0E0E0", "#C0C0C0",
  "#0A0A0A", "#2A2A2A", "#0A0A0A",
  "#C0C0C0", "#E0E0E0", "#F0F0F0"
))

spider[["spider_vulture"]] <- qpal(c(
  "#0A2A2A", "#006060", "#008B8B",
  "#00A0A0", "#00C4C4", "#00A0A0",
  "#008B8B", "#006060", "#0A2A2A"
))

spider[["spider_mysterio"]] <- qpal(c(
  "#9400D3", "#C400FF", "#00FF88",
  "#00CED1", "#FFD700", "#FF1493",
  "#9400D3", "#C400FF", "#00FF88"
))

spider[["spider_sandman"]] <- qpal(c(
  "#8B6B4A", "#A08060", "#C4A080",
  "#D4B898", "#E8D4C0", "#D4B898",
  "#C4A080", "#8B6B4A", "#6B4A2A"
))

spider[["spider_lizard"]] <- qpal(c(
  "#0A4A0A", "#006B00", "#008B00",
  "#00A000", "#8B6B20", "#00A000",
  "#008B00", "#006B00", "#0A4A0A"
))

spider[["spider_electro"]] <- qpal(c(
  "#0A0A2A", "#1A0050", "#1E90FF",
  "#00FFFF", "#F8F8FF", "#00FFFF",
  "#1E90FF", "#1A0050", "#0A0A2A"
))

spider[["spider_rhino"]] <- qpal(c(
  "#4A4A4A", "#6B6B6B", "#8B8B8B",
  "#A0A0A0", "#C0C0C0", "#A0A0A0",
  "#8B8B8B", "#6B6B6B", "#4A4A4A"
))

# ── Dimensions & Worlds ───────────────────────────────────────────────────

spider[["spider_earth_1610"]] <- qpal(c(
  "#C400FF", "#FF00FF", "#FF1493",
  "#1E90FF", "#00FFFF", "#FFD700",
  "#FF4500", "#C400FF", "#0A0A0A"
))

spider[["spider_earth_65"]] <- qpal(c(
  "#FF69B4", "#FFB6C1", "#FFFFFF",
  "#00CED1", "#87CEEB", "#FF69B4",
  "#FFFFFF", "#00CED1", "#FFB6C1"
))

spider[["spider_earth_90214"]] <- qpal(c(
  "#0A0A0A", "#2A2A2A", "#4A4A4A",
  "#C4A060", "#8B6B4A", "#4A3A2A",
  "#2A2A2A", "#1A1A1A", "#0A0A0A"
))

spider[["spider_earth_928"]] <- qpal(c(
  "#0A0A2A", "#000080", "#1E90FF",
  "#C4202A", "#FF4500", "#C4202A",
  "#1E90FF", "#000080", "#0A0A2A"
))

spider[["spider_earth_50101"]] <- qpal(c(
  "#FF4500", "#FFD700", "#FF1493",
  "#00A000", "#1E90FF", "#FFD700",
  "#FF4500", "#00A000", "#FF1493"
))

spider[["spider_mumbattan"]] <- qpal(c(
  "#FF4500", "#FF6347", "#FFD700",
  "#FF1493", "#1E90FF", "#00CED1",
  "#FFD700", "#FF4500", "#FF1493"
))

spider[["spider_nueva_york"]] <- qpal(c(
  "#0A0A2A", "#000080", "#1E90FF",
  "#00CED1", "#C0C0C0", "#00CED1",
  "#1E90FF", "#000080", "#0A0A2A"
))

# ── Special Effects & Glitch ──────────────────────────────────────────────

spider[["spider_glitch"]] <- qpal(c(
  "#FF00FF", "#00FFFF", "#FF0000",
  "#00FF00", "#FF00FF", "#00FFFF",
  "#C400FF", "#FF1493", "#0A0020"
))

spider[["spider_multiverse"]] <- qpal(c(
  "#FF1493", "#FF4500", "#FFD700",
  "#00FF88", "#1E90FF", "#C400FF",
  "#FF00FF", "#FF1493", "#FF4500"
))

spider[["spider_web"]] <- qpal(c(
  "#F0F0F0", "#E0E0E0", "#C0C0C0",
  "#FFFFFF", "#F0F0F0", "#E0E0E0",
  "#C0C0C0", "#A0A0A0", "#808080"
))

spider[["spider_venom_symbiote"]] <- qpal(c(
  "#0A0A0A", "#1A1A2A", "#2A2A4A",
  "#FFFFFF", "#C0C0C0", "#FFFFFF",
  "#2A2A4A", "#1A1A2A", "#0A0A0A"
))

spider[["spider_carnage"]] <- qpal(c(
  "#C4202A", "#E84545", "#0A0A0A",
  "#C4202A", "#FF4500", "#C4202A",
  "#0A0A0A", "#8B0000", "#0A0A0A"
))

spider[["spider_silk"]] <- qpal(c(
  "#FFFFFF", "#F0E8F8", "#E0D0F0",
  "#C4A0E0", "#A080D0", "#C4A0E0",
  "#E0D0F0", "#F0E8F8", "#FFFFFF"
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
  misc   = misc,
  music  = music,
  anime  = anime,
  cities = cities,
  myth   = myth,
  sci    = sci,
  brazil = brazil,
  films  = films,
  gems   = gems,
  weather = weather,
  comics = comics,
  food   = food,
  albums = albums,
  photo  = photo,
  spider = spider
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
