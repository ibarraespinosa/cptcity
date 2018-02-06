# by @mdsummer:
f <- "http://soliton.vm.bytemark.co.uk/pub/cpt-city/pkg/cpt-city-cpt-2.19.zip"

download.file(f, file.path("data-raw", basename(f)), mode = "wb")

unzip(file.path("data-raw", basename(f)), exdir = "data-raw")

readcpt <- function(filename) {
  l <- readLines(filename)
  l <- l[grepl("^[[:digit:]]",l)]
  l <- strsplit(l,"[[:space:]]+")
  l <- lapply(l,function(z)as.numeric(z[2:4]))
  sapply(l,function(z)paste0("#",paste0(sprintf('%02x',z),collapse="")))
}

fs <- list.files(file.path("data-raw", "cpt-city"), pattern = "cpt$", full.names = TRUE, recursive = TRUE)

cc <- readcpt(fs[1])
