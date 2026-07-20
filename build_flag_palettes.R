#!/usr/bin/env Rscript
# build_flag_palettes.R — Add country flag color palettes to cptcity
# Official flag spec hex colors from Wikipedia / Vexilla Mundi
# Generated: 2026-07-20

library(grDevices)

REPO <- "/home/sibarra/.hermes/profiles/aire/home/hermes_vein/cptcity"
setwd(REPO)

hex_to_palette <- function(hex_vec, n_stops = 256) {
  ramp <- colorRampPalette(hex_vec)
  cols <- ramp(n_stops)
  rgb_mat <- col2rgb(cols) / 255
  data.frame(
    id  = seq(0, 1, length.out = n_stops),
    r   = rgb_mat[1, ],
    g   = rgb_mat[2, ],
    b   = rgb_mat[3, ],
    stringsAsFactors = FALSE
  )
}

qpal <- function(hex_vec, n_stops = 128) hex_to_palette(hex_vec, n_stops)

# ══════════════════════════════════════════════════════════════════════════
#  COUNTRY FLAGS
# ══════════════════════════════════════════════════════════════════════════

flags <- list()

flags[["flag_afghanistan"]] <- qpal(c("#000000", "#D32011", "#009A44", "#FFFFFF"))

flags[["flag_albania"]] <- qpal(c("#E41E20", "#000000"))

flags[["flag_algeria"]] <- qpal(c("#006233", "#FFFFFF", "#D21034"))

flags[["flag_andorra"]] <- qpal(c("#0018A8", "#FEDD00", "#D50032"))

flags[["flag_angola"]] <- qpal(c("#CC092F", "#000000", "#FFCB00"))

flags[["flag_antigua_and_barbuda"]] <- qpal(c("#000000", "#0072C6", "#FFFFFF", "#FFC726", "#CE1126"))

flags[["flag_argentina"]] <- qpal(c("#74ACDF", "#FFFFFF", "#F6B40E"))

flags[["flag_armenia"]] <- qpal(c("#D90012", "#0033A0", "#F2A800"))

flags[["flag_aruba"]] <- qpal(c("#418FDE", "#FFD100", "#D81E05", "#FFFFFF"))

flags[["flag_australia"]] <- qpal(c("#00008B", "#FFFFFF", "#FF0000"))

flags[["flag_austria"]] <- qpal(c("#EF3340", "#FFFFFF"))

flags[["flag_azerbaijan"]] <- qpal(c("#00B9E4", "#ED2939", "#3F9F3B"))

flags[["flag_bahamas"]] <- qpal(c("#00778B", "#FFC72C", "#000000"))

flags[["flag_bahrain"]] <- qpal(c("#CE1126", "#FFFFFF"))

flags[["flag_bangladesh"]] <- qpal(c("#006A4E", "#F42A41"))

flags[["flag_barbados"]] <- qpal(c("#00267F", "#FFC726", "#000000"))

flags[["flag_basque_country"]] <- qpal(c("#E60000", "#009543", "#FFFFFF"))

flags[["flag_belarus"]] <- qpal(c("#CE1720", "#007C30", "#FFFFFF"))

flags[["flag_belgium"]] <- qpal(c("#000000", "#FDDA24", "#EF3340"))

flags[["flag_belize"]] <- qpal(c("#003F87", "#D31314", "#FFFFFF"))

flags[["flag_benin"]] <- qpal(c("#008751", "#FCD116", "#E8112D"))

flags[["flag_bermuda"]] <- qpal(c("#CE1126", "#FFFFFF", "#00205B"))

flags[["flag_bhutan"]] <- qpal(c("#FF4E12", "#FFD520", "#FFFFFF"))

flags[["flag_bolivia"]] <- qpal(c("#D52B1E", "#F9E200", "#007934"))

flags[["flag_bosnia"]] <- qpal(c("#002395", "#FFFFFF", "#FECB00"))

flags[["flag_botswana"]] <- qpal(c("#75AADB", "#FFFFFF", "#000000"))

flags[["flag_brazil"]] <- qpal(c("#009B3A", "#FEDF00", "#002776", "#FFFFFF"))

flags[["flag_brunei"]] <- qpal(c("#F7E017", "#FFFFFF", "#000000", "#CF1126"))

flags[["flag_bulgaria"]] <- qpal(c("#FFFFFF", "#00966E", "#D62612"))

flags[["flag_burkina_faso"]] <- qpal(c("#EF3340", "#009E49", "#FFD100"))

flags[["flag_burundi"]] <- qpal(c("#C8102E", "#FFFFFF", "#43B02A"))

flags[["flag_cabo_verde"]] <- qpal(c("#003893", "#FFFFFF", "#CF2027", "#F7D116"))

flags[["flag_cambodia"]] <- qpal(c("#032EA1", "#E00025", "#FFFFFF"))

flags[["flag_cameroon"]] <- qpal(c("#007A5E", "#CE1126", "#FCD116"))

flags[["flag_canada"]] <- qpal(c("#FF0000", "#FFFFFF"))

flags[["flag_catalonia"]] <- qpal(c("#FCDD09", "#DA121A"))

flags[["flag_cayman_islands"]] <- qpal(c("#00247D", "#FFFFFF", "#CE1126"))

flags[["flag_central_african_republic"]] <- qpal(c("#003082", "#FFFFFF", "#289728", "#FFCE00", "#D21034"))

flags[["flag_chad"]] <- qpal(c("#002664", "#FECB00", "#C60C30"))

flags[["flag_chile"]] <- qpal(c("#0039A6", "#FFFFFF", "#D52B1E"))

flags[["flag_china"]] <- qpal(c("#DE2910", "#FFDE00"))

flags[["flag_colombia"]] <- qpal(c("#FCD116", "#003893", "#CE1126"))

flags[["flag_comoros"]] <- qpal(c("#3A75C4", "#FFFFFF", "#CE1126", "#FFD100", "#009E60"))

flags[["flag_congo_brazzaville"]] <- qpal(c("#009543", "#FBDE4A", "#DC241F"))

flags[["flag_congo_drc"]] <- qpal(c("#007FFF", "#F7D618", "#CE1021"))

flags[["flag_costa_rica"]] <- qpal(c("#002B7F", "#FFFFFF", "#CE1126"))

flags[["flag_cote_divoire"]] <- qpal(c("#F77F00", "#FFFFFF", "#009E60"))

flags[["flag_croatia"]] <- qpal(c("#FF0000", "#FFFFFF", "#0093DD"))

flags[["flag_cuba"]] <- qpal(c("#002A8F", "#FFFFFF", "#CF142B"))

flags[["flag_curacao"]] <- qpal(c("#002B7F", "#FFD100", "#FFFFFF"))

flags[["flag_cyprus"]] <- qpal(c("#FFFFFF", "#D57800"))

flags[["flag_czech_republic"]] <- qpal(c("#FFFFFF", "#D7141A", "#11457E"))

flags[["flag_denmark"]] <- qpal(c("#C8102E", "#FFFFFF"))

flags[["flag_djibouti"]] <- qpal(c("#6AB2E7", "#12AD2B", "#FFFFFF", "#D7141A"))

flags[["flag_dominica"]] <- qpal(c("#006B3F", "#FFC726", "#FFFFFF", "#000000", "#D41C30", "#9461C9"))

flags[["flag_dominican_republic"]] <- qpal(c("#002D62", "#FFFFFF", "#CE1126"))

flags[["flag_ecuador"]] <- qpal(c("#FFD100", "#0033A0", "#ED1C24"))

flags[["flag_egypt"]] <- qpal(c("#CE1126", "#FFFFFF", "#000000"))

flags[["flag_el_salvador"]] <- qpal(c("#0047AB", "#FFFFFF"))

flags[["flag_england"]] <- qpal(c("#FFFFFF", "#CE1124"))

flags[["flag_equatorial_guinea"]] <- qpal(c("#3E9B3F", "#FFFFFF", "#E32118", "#0073CF"))

flags[["flag_eritrea"]] <- qpal(c("#EA0437", "#12A73C", "#4189DD", "#FFC726"))

flags[["flag_estonia"]] <- qpal(c("#0072CE", "#000000", "#FFFFFF"))

flags[["flag_eswatini"]] <- qpal(c("#3E5EB9", "#FFD900", "#B81C2D", "#FFFFFF", "#000000"))

flags[["flag_ethiopia"]] <- qpal(c("#078930", "#FCDD09", "#DA121A"))

flags[["flag_european_union"]] <- qpal(c("#003399", "#FFCC00"))

flags[["flag_fiji"]] <- qpal(c("#69B6D5", "#00205B", "#CE1126", "#FFD100"))

flags[["flag_finland"]] <- qpal(c("#FFFFFF", "#002F6C"))

flags[["flag_france"]] <- qpal(c("#002395", "#FFFFFF", "#ED2939"))

flags[["flag_gabon"]] <- qpal(c("#009E60", "#FCD116", "#3A75C4"))

flags[["flag_gambia"]] <- qpal(c("#CE1126", "#FFFFFF", "#0C1C8C"))

flags[["flag_georgia"]] <- qpal(c("#FFFFFF", "#FF0000"))

flags[["flag_germany"]] <- qpal(c("#000000", "#DD0000", "#FFCE00"))

flags[["flag_ghana"]] <- qpal(c("#CE1126", "#FCD116", "#006B3F"))

flags[["flag_greece"]] <- qpal(c("#0D5EAF", "#FFFFFF"))

flags[["flag_greenland"]] <- qpal(c("#C8102E", "#FFFFFF"))

flags[["flag_grenada"]] <- qpal(c("#CE1126", "#FCD116", "#007B5F"))

flags[["flag_guam"]] <- qpal(c("#003893", "#CE1126", "#FFFFFF"))

flags[["flag_guatemala"]] <- qpal(c("#4997D0", "#FFFFFF"))

flags[["flag_guinea"]] <- qpal(c("#CE1126", "#FCD116", "#009460"))

flags[["flag_guinea_bissau"]] <- qpal(c("#CE1126", "#FCD116", "#009E49"))

flags[["flag_guyana"]] <- qpal(c("#009E49", "#FFFFFF", "#FFD100", "#000000", "#CE1126"))

flags[["flag_haiti"]] <- qpal(c("#00209F", "#D21034"))

flags[["flag_honduras"]] <- qpal(c("#0073CF", "#FFFFFF"))

flags[["flag_hong_kong"]] <- qpal(c("#DE2910", "#FFFFFF"))

flags[["flag_hungary"]] <- qpal(c("#CD2A3E", "#FFFFFF", "#436F4D"))

flags[["flag_iceland"]] <- qpal(c("#02529C", "#FFFFFF", "#DC1E35"))

flags[["flag_india"]] <- qpal(c("#FF9933", "#FFFFFF", "#138808", "#000080"))

flags[["flag_indonesia"]] <- qpal(c("#FF0000", "#FFFFFF"))

flags[["flag_iran"]] <- qpal(c("#239F40", "#FFFFFF", "#DA0000"))

flags[["flag_iraq"]] <- qpal(c("#CE1126", "#FFFFFF", "#000000"))

flags[["flag_ireland"]] <- qpal(c("#169B62", "#FFFFFF", "#FF883E"))

flags[["flag_israel"]] <- qpal(c("#FFFFFF", "#0038B8"))

flags[["flag_italy"]] <- qpal(c("#009246", "#FFFFFF", "#CE2B37"))

flags[["flag_jamaica"]] <- qpal(c("#000000", "#FFB81C", "#009E49"))

flags[["flag_japan"]] <- qpal(c("#FFFFFF", "#BC002D"))

flags[["flag_jordan"]] <- qpal(c("#000000", "#FFFFFF", "#007A3D", "#CE1126"))

flags[["flag_kazakhstan"]] <- qpal(c("#00AFCA", "#FEC50C"))

flags[["flag_kenya"]] <- qpal(c("#000000", "#BB0000", "#006600", "#FFFFFF"))

flags[["flag_kiribati"]] <- qpal(c("#CE1126", "#FFFFFF", "#FFD100", "#00247D"))

flags[["flag_kosovo"]] <- qpal(c("#244AA5", "#D0A650", "#FFFFFF"))

flags[["flag_kurdistan"]] <- qpal(c("#ED2024", "#FFFFFF", "#27893E", "#FECB00"))

flags[["flag_kuwait"]] <- qpal(c("#007A3D", "#FFFFFF", "#CE1126", "#000000"))

flags[["flag_kyrgyzstan"]] <- qpal(c("#E8112D", "#FFD100"))

flags[["flag_laos"]] <- qpal(c("#CE1126", "#002868", "#FFFFFF"))

flags[["flag_latvia"]] <- qpal(c("#9E3039", "#FFFFFF"))

flags[["flag_lebanon"]] <- qpal(c("#EE161F", "#FFFFFF", "#00A850"))

flags[["flag_lesotho"]] <- qpal(c("#00209F", "#FFFFFF", "#009543"))

flags[["flag_liberia"]] <- qpal(c("#BF0A30", "#FFFFFF", "#002868"))

flags[["flag_libya"]] <- qpal(c("#E70013", "#000000", "#239E46"))

flags[["flag_liechtenstein"]] <- qpal(c("#002B7F", "#CE1126", "#FFD100", "#000000"))

flags[["flag_lithuania"]] <- qpal(c("#FDB913", "#006A44", "#C1272D"))

flags[["flag_luxembourg"]] <- qpal(c("#ED2939", "#FFFFFF", "#00A1DE"))

flags[["flag_macau"]] <- qpal(c("#00785A", "#FFFFFF"))

flags[["flag_madagascar"]] <- qpal(c("#FFFFFF", "#FC3D32", "#007E3A"))

flags[["flag_malawi"]] <- qpal(c("#000000", "#CE1126", "#339E35"))

flags[["flag_malaysia"]] <- qpal(c("#CC0001", "#FFFFFF", "#010066", "#FFCC00"))

flags[["flag_maldives"]] <- qpal(c("#D21034", "#007E3A", "#FFFFFF"))

flags[["flag_mali"]] <- qpal(c("#14B53A", "#FCD116", "#CE1126"))

flags[["flag_malta"]] <- qpal(c("#FFFFFF", "#CF142B"))

flags[["flag_marshall_islands"]] <- qpal(c("#003893", "#FFFFFF", "#DD7500"))

flags[["flag_mauritania"]] <- qpal(c("#006233", "#FFC400", "#D01C1F"))

flags[["flag_mauritius"]] <- qpal(c("#EA2839", "#1A206D", "#FFD500", "#00A551"))

flags[["flag_mexico"]] <- qpal(c("#006847", "#FFFFFF", "#CE1126"))

flags[["flag_micronesia"]] <- qpal(c("#75B2DD", "#FFFFFF"))

flags[["flag_moldova"]] <- qpal(c("#0046AE", "#FFD200", "#CC092F"))

flags[["flag_monaco"]] <- qpal(c("#CE1126", "#FFFFFF"))

flags[["flag_mongolia"]] <- qpal(c("#0066B3", "#DA2032", "#FFD400"))

flags[["flag_montenegro"]] <- qpal(c("#C40308", "#D4AF37", "#1D3461"))

flags[["flag_morocco"]] <- qpal(c("#C1272D", "#006233"))

flags[["flag_mozambique"]] <- qpal(c("#000000", "#FCD116", "#D21034", "#007168"))

flags[["flag_myanmar"]] <- qpal(c("#FECB00", "#34B233", "#EA2839", "#FFFFFF"))

flags[["flag_namibia"]] <- qpal(c("#003580", "#FFC726", "#009543", "#D21034"))

flags[["flag_nauru"]] <- qpal(c("#002B7F", "#FFC726", "#FFFFFF"))

flags[["flag_nepal"]] <- qpal(c("#003893", "#DC143C", "#FFFFFF"))

flags[["flag_netherlands"]] <- qpal(c("#AE1C28", "#FFFFFF", "#21468B"))

flags[["flag_new_zealand"]] <- qpal(c("#00247D", "#FFFFFF", "#CC142B"))

flags[["flag_nicaragua"]] <- qpal(c("#0067C6", "#FFFFFF"))

flags[["flag_niger"]] <- qpal(c("#E05206", "#FFFFFF", "#0DB02B"))

flags[["flag_nigeria"]] <- qpal(c("#008751", "#FFFFFF"))

flags[["flag_north_korea"]] <- qpal(c("#024FA2", "#FFFFFF", "#ED1C27"))

flags[["flag_north_macedonia"]] <- qpal(c("#D82126", "#FFE600"))

flags[["flag_norway"]] <- qpal(c("#BA0C2F", "#FFFFFF", "#00205B"))

flags[["flag_oman"]] <- qpal(c("#DB161B", "#FFFFFF", "#008000"))

flags[["flag_pakistan"]] <- qpal(c("#01411C", "#FFFFFF"))

flags[["flag_palau"]] <- qpal(c("#0099FF", "#FFCC00"))

flags[["flag_palestine"]] <- qpal(c("#000000", "#FFFFFF", "#007A3D", "#CE1126"))

flags[["flag_panama"]] <- qpal(c("#005293", "#FFFFFF", "#D21034"))

flags[["flag_papua_new_guinea"]] <- qpal(c("#000000", "#CE1126", "#FFD100"))

flags[["flag_paraguay"]] <- qpal(c("#D52B1E", "#FFFFFF", "#0038A8"))

flags[["flag_peru"]] <- qpal(c("#D91023", "#FFFFFF"))

flags[["flag_philippines"]] <- qpal(c("#0038A8", "#CE1126", "#FFFFFF", "#FCD116"))

flags[["flag_poland"]] <- qpal(c("#FFFFFF", "#DC143C"))

flags[["flag_portugal"]] <- qpal(c("#006600", "#FF0000", "#FFCC29", "#FFFFFF", "#003399"))

flags[["flag_puerto_rico"]] <- qpal(c("#ED0000", "#FFFFFF", "#0050F0"))

flags[["flag_qatar"]] <- qpal(c("#8D1B3D", "#FFFFFF"))

flags[["flag_romania"]] <- qpal(c("#002B7F", "#FCD116", "#CE1126"))

flags[["flag_russia"]] <- qpal(c("#FFFFFF", "#0039A6", "#D52B1E"))

flags[["flag_rwanda"]] <- qpal(c("#20603D", "#FAD201", "#00A1DE"))

flags[["flag_saint_kitts_and_nevis"]] <- qpal(c("#009E49", "#FFD100", "#000000", "#FFFFFF", "#CE1126"))

flags[["flag_saint_lucia"]] <- qpal(c("#66CCFF", "#FFFFFF", "#000000", "#FFD100"))

flags[["flag_saint_vincent"]] <- qpal(c("#002A7F", "#FFC726", "#009E49"))

flags[["flag_samoa"]] <- qpal(c("#CE1126", "#002B7F", "#FFFFFF"))

flags[["flag_san_marino"]] <- qpal(c("#FFFFFF", "#5EB6E4"))

flags[["flag_sao_tome_and_principe"]] <- qpal(c("#12AD2B", "#FFD100", "#D21034"))

flags[["flag_saudi_arabia"]] <- qpal(c("#006C35", "#FFFFFF"))

flags[["flag_scotland"]] <- qpal(c("#005EB8", "#FFFFFF"))

flags[["flag_senegal"]] <- qpal(c("#00853F", "#FDEF42", "#E31B23"))

flags[["flag_serbia"]] <- qpal(c("#C6363C", "#0C4076", "#FFFFFF"))

flags[["flag_seychelles"]] <- qpal(c("#003F87", "#FCD856", "#D62828", "#FFFFFF", "#007A33"))

flags[["flag_sierra_leone"]] <- qpal(c("#1EB53A", "#FFFFFF", "#0072C6"))

flags[["flag_singapore"]] <- qpal(c("#ED2939", "#FFFFFF"))

flags[["flag_slovakia"]] <- qpal(c("#FFFFFF", "#0B4EA2", "#EE1C25"))

flags[["flag_slovenia"]] <- qpal(c("#FFFFFF", "#005CE5", "#FF0000"))

flags[["flag_solomon_islands"]] <- qpal(c("#0051BA", "#FCD116", "#215B33", "#FFFFFF"))

flags[["flag_somalia"]] <- qpal(c("#4189DD", "#FFFFFF"))

flags[["flag_south_africa"]] <- qpal(c("#000000", "#007A4D", "#FFB81C", "#E03C31", "#001489", "#FFFFFF"))

flags[["flag_south_korea"]] <- qpal(c("#FFFFFF", "#000000", "#C60C30", "#003478"))

flags[["flag_south_sudan"]] <- qpal(c("#000000", "#DA121A", "#078930", "#FFFFFF", "#0F47AF"))

flags[["flag_spain"]] <- qpal(c("#AA151B", "#F1BF00"))

flags[["flag_sri_lanka"]] <- qpal(c("#FFBE29", "#EB7400", "#00534E", "#8D153A"))

flags[["flag_sudan"]] <- qpal(c("#D21034", "#FFFFFF", "#000000", "#007229"))

flags[["flag_suriname"]] <- qpal(c("#377E22", "#FFFFFF", "#B40A2D", "#ECB21C"))

flags[["flag_sweden"]] <- qpal(c("#006AA7", "#FECC02"))

flags[["flag_switzerland"]] <- qpal(c("#FF0000", "#FFFFFF"))

flags[["flag_syria"]] <- qpal(c("#CE1126", "#FFFFFF", "#000000", "#007A3D"))

flags[["flag_taiwan"]] <- qpal(c("#FE0000", "#000095", "#FFFFFF"))

flags[["flag_tajikistan"]] <- qpal(c("#006B3D", "#FFFFFF", "#CC0000", "#F8C300"))

flags[["flag_tanzania"]] <- qpal(c("#1EB53A", "#FFD100", "#000000", "#00A3DD"))

flags[["flag_thailand"]] <- qpal(c("#A51931", "#FFFFFF", "#241D4F", "#FFFFFF", "#A51931"))

flags[["flag_tibet"]] <- qpal(c("#FFFFFF", "#FFCC00", "#DA291C", "#00529B"))

flags[["flag_timor_leste"]] <- qpal(c("#DC241F", "#FFC726", "#000000", "#FFFFFF"))

flags[["flag_togo"]] <- qpal(c("#006A4E", "#FFCE00", "#D21034"))

flags[["flag_tonga"]] <- qpal(c("#C10016", "#FFFFFF"))

flags[["flag_trinidad_and_tobago"]] <- qpal(c("#CE1126", "#FFFFFF", "#000000"))

flags[["flag_tunisia"]] <- qpal(c("#E70013", "#FFFFFF"))

flags[["flag_turkey"]] <- qpal(c("#E30A17", "#FFFFFF"))

flags[["flag_turkmenistan"]] <- qpal(c("#009E49", "#FFFFFF", "#D22630", "#FFC72C"))

flags[["flag_tuvalu"]] <- qpal(c("#00A3DD", "#FFC72C", "#FFFFFF"))

flags[["flag_uae"]] <- qpal(c("#00732F", "#FFFFFF", "#000000", "#FF0000"))

flags[["flag_uganda"]] <- qpal(c("#000000", "#FFD100", "#D90000"))

flags[["flag_uk"]] <- qpal(c("#00247D", "#FFFFFF", "#CF142B"))

flags[["flag_ukraine"]] <- qpal(c("#0057B7", "#FFDD00"))

flags[["flag_united_nations"]] <- qpal(c("#4B92DB", "#FFFFFF"))

flags[["flag_uruguay"]] <- qpal(c("#FFFFFF", "#0038A8", "#FCD116"))

flags[["flag_usa"]] <- qpal(c("#B31942", "#FFFFFF", "#0A3161"))

flags[["flag_uzbekistan"]] <- qpal(c("#0099B5", "#FFFFFF", "#1EB53A", "#CE1126"))

flags[["flag_vanuatu"]] <- qpal(c("#002B7F", "#CE1126", "#FFD100", "#009543", "#000000"))

flags[["flag_vatican"]] <- qpal(c("#FFE000", "#FFFFFF"))

flags[["flag_venezuela"]] <- qpal(c("#FFD100", "#00247D", "#CF142B"))

flags[["flag_vietnam"]] <- qpal(c("#DA251D", "#FFCD02"))

flags[["flag_wales"]] <- qpal(c("#00AD36", "#FFFFFF", "#D30731"))

flags[["flag_yemen"]] <- qpal(c("#CE1126", "#FFFFFF", "#000000"))

flags[["flag_zambia"]] <- qpal(c("#198A00", "#EF7D00", "#000000", "#DE2010"))

flags[["flag_zimbabwe"]] <- qpal(c("#006A2E", "#FFD100", "#CE1126", "#000000", "#FFFFFF"))


# ══════════════════════════════════════════════════════════════════════════
#  MERGE WITH EXISTING SYSDATA
# ══════════════════════════════════════════════════════════════════════════

# Load existing sysdata
load("R/sysdata.rda")
old_count <- length(sysdata) - 1

# Merge new flag palettes
for (pal_name in names(flags)) {
  sysdata[[pal_name]] <- flags[[pal_name]]
}

# Update cpt_names
flag_names <- names(flags)
all_names <- c(sysdata[["cpt_names"]], flag_names)
sysdata[["cpt_names"]] <- all_names

new_count <- length(sysdata) - 1
cat(sprintf("Before: %d palettes. After: %d palettes. Added: %d.\n",
    old_count, new_count, new_count - old_count))

# Save
save(sysdata, file = "R/sysdata.rda", compress = "xz")
cpt_names <- sysdata[["cpt_names"]]
save(cpt_names, file = "data/cpt_names.rda", compress = "xz")

cat(sprintf("\n=== Done! Total palettes: %d ===\n", new_count))
cat("\nSample flag palettes:\n")
print(sort(sample(flag_names, min(15, length(flag_names)))))