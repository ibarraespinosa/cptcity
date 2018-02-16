f <- "http://soliton.vm.bytemark.co.uk/pub/cpt-city/mpl/inferno.cpt"
inferno <- read.table(file = f, header = F, sep = "", nrows = 255)
names(inferno) <- c("id", "r", "g", "b", "V6", "V7", "V8")
m <- inferno
palinferno <- rgb(red = m$r, green = m$g, blue = m$b, maxColorValue = max(m))
image(matrix(1:255), col = palinferno)

f <- "http://soliton.vm.bytemark.co.uk/pub/cpt-city/arendal/temperature.cpt"
temperature <- read.table(file = f, header = F, sep = "", nrows = 18)
names(temperature) <- c("id", "r", "g", "b", "V6", "V7", "V8")
m <- temperature
paltemperature <- rgb(red = m$r, green = m$g, blue = m$b, maxColorValue = max(m))
image(matrix(1:17), col = paltemperature)

f <- "http://soliton.vm.bytemark.co.uk/pub/cpt-city/oc/sst.cpt"
sst <- read.table(file = f, header = F, sep = "", nrows = 253)
names(sst) <- c("id", "r", "g", "b", "V6", "V7", "V8")
m <- sst
palsst <- rgb(red = m$r, green = m$g, blue = m$b, maxColorValue = max(m))
image(matrix(1:255), col = palsst)

f <- "http://soliton.vm.bytemark.co.uk/pub/cpt-city/ncl/temp_19lev.cpt"
temp <- read.table(f, header = F, sep = "", nrows = 20)
names(temp) <- c("id", "r", "g", "b", "V6", "V7", "V8")
m <- temp
paltemp <- rgb(red = m$r, green = m$g, blue = m$b, maxColorValue = max(m))
image(matrix(1:255), col = paltemp)


# https://stat.ethz.ch/R-manual/R-devel/library/grDevices/html/rgb.html
# http://soliton.vm.bytemark.co.uk/pub/cpt-city/

#arendal #110
grad <- list.files(path = "~/Dropbox/cpt-city-2.19/src/cpt-city/arendal",
                   pattern = ".cpt", full.names = T, recursive = T)
nombres <- list.files(path = "~/Dropbox/cpt-city-2.19/src/cpt-city/arendal",
                   pattern = ".cpt", full.names = F, recursive = T)
nombres <- gsub(pattern = ".cpt", replacement = "", x = nombres)
nombres <- paste0("arendarl", "_", nombres)
nombres
arendarl_arctic <- read.table(file = grad[1], header = F, sep = "", nrows = 110)
names(arendarl_arctic) <- c("id", "r", "g", "b", "V6", "V7", "V8")
arendarl_temperature <- read.table(file = grad[2], header = F, sep = "", nrows = 18)
names(arendarl_temperature) <- c("id", "r", "g", "b", "V6", "V7", "V8")
arendarl_zambezi_focus <- read.table(file = grad[3], header = F, sep = "")
names(arendarl_zambezi_focus) <- c("id", "r", "g", "b", "V6", "V7", "V8")
arendarl_zambezi_proximity <- read.table(file = grad[4], header = F, sep = "")
names(arendarl_zambezi_proximity) <- c("id", "r", "g", "b", "V6", "V7", "V8")
m <- arendarl_arctic
max(c(max(m$r, na.rm = T),
      max(m$g, na.rm = T),
      max(m$b, na.rm = T)))
sysdata <- list(inferno = inferno,
                temperature = temperature,
                sst = sst,
                temp = temp,
                arendarl_arctic = arendarl_arctic,
                arendarl_temperature = arendarl_temperature,
                arendarl_zambezi_focus = arendarl_zambezi_focus,
                arendarl_zambezi_proximity = arendarl_zambezi_proximity)
save(sysdata, file = "R/sysdata.rda", compress = "xz")
