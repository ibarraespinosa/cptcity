#!/usr/bin/env Rscript
# Generate Spider-Verse showcase for README
library(cptcity)
library(grDevices)

REPO <- "/home/sibarra/.hermes/profiles/aire/home/.hermes/profiles/aire/home/hermes_vein/cptcity"
setwd(REPO)
dir.create("README_files/figure-gfm", showWarnings=FALSE, recursive=TRUE)

# ── HEROES + VILLAINS grid ────────────────────────────────────────────────

spider_pals <- c(
  "spider_man", "spider_miles_morales", "spider_gwen", "spider_noir",
  "spider_2099", "spider_ham", "spider_peni", "spider_punk",
  "spider_pavitr", "spider_prowler", "spider_spot", "spider_green_goblin",
  "spider_venom", "spider_doc_ock", "spider_mysterio", "spider_carnage",
  "spider_web_of_destiny", "spider_collider",
  "spider_miles_leap_of_faith", "spider_spot_ascended"
)

png("README_files/figure-gfm/spider_showcase.png", width=1600, height=900, res=150)
par(mfrow=c(4,5), mar=c(1,7,1,1), bg="#0A0A0A")

for(pal in spider_pals) {
  cols <- cpt(pal, n=200)
  image(matrix(1:200, nrow=1), col=cols, xaxt="n", yaxt="n", bty="n")
  label <- gsub("spider_", "", pal)
  label <- gsub("_", " ", label)
  mtext(tools::toTitleCase(label), side=2, line=-1, col="#FFFFFF", cex=1.1, font=2)
}
dev.off()
cat("✓ spider_showcase.png\n")

# ── DIMENSIONS + EFFECTS grid ─────────────────────────────────────────────

spider2 <- c(
  "spider_earth_1610", "spider_earth_65", "spider_earth_90214",
  "spider_earth_928", "spider_earth_50101", "spider_mumbattan",
  "spider_nueva_york", "spider_gwen_world", "spider_brooklyn",
  "spider_glitch", "spider_multiverse", "spider_interdimensional",
  "spider_miles_graffiti", "spider_portal", "spider_web_of_destiny",
  "spider_great_web"
)

png("README_files/figure-gfm/spider_dimensions.png", width=1600, height=800, res=150)
par(mfrow=c(4,4), mar=c(1,8,1,1), bg="#0A0A0A")

for(pal in spider2) {
  cols <- cpt(pal, n=200)
  image(matrix(1:200, nrow=1), col=cols, xaxt="n", yaxt="n", bty="n")
  label <- gsub("spider_", "", pal)
  label <- gsub("_", " ", label)
  mtext(tools::toTitleCase(label), side=2, line=-1, col="#FFFFFF", cex=1.0, font=2)
}
dev.off()
cat("✓ spider_dimensions.png\n")
