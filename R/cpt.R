#' Function to return colour palettes functions from 'cpt-city'
#'
#' This function return a collor palette based on the name or position of the
#' palette.
#'
#' The cpt-city web archive comes from:
#' http://soliton.vm.bytemark.co.uk/pub/cpt-city/index.html
#'
#' @param pal Palette of colors available or the number of the position
#' @param n integer; number of colors
#' @param colorRampPalette Logical; to be used in sf and mapview.
#' @param rev Logical; to internally revert order of rgb color vectors.
#' @param frgb Numeric; vector of 3 to change internal rgb composition.
#' The order is red, green, blue
#' @return A colour palette function.
#' @importFrom grDevices rgb colorRampPalette
#' @export
#' @examples {
#' library(cptcity)
#' image(matrix(1:100), col = cpt(pal = "mpl_inferno"))
#' find_cpt("temperature")
#' image(matrix(1:100), col = cpt("idv_temperature"))
#' image(matrix(1:100), col = cpt("idv_temperature", rev = TRUE))
#' # now you can select more than one palette!!!
#' image(matrix(1:100),
#'      col = cpt(pal = c("idv_temperature",
#'                        "arendal_temperature"),
#'                rev = TRUE))
#' \dontrun{
#' # Do not run
#' library(ggplot2)
#' ggplot(faithfuld, aes(waiting, eruptions)) +
#' geom_raster(aes(fill = density))
#'
#'  ggplot(faithfuld, aes(waiting, eruptions)) +
#'  geom_raster(aes(fill = density)) +
#'  scale_fill_gradientn(colours = cpt(n = 100))
#' }
#' }
cpt <- function(pal = "mpl_inferno",
                n = 100,
                colorRampPalette = FALSE,
                rev = FALSE,
                frgb = rep(1, 3)){
  if(length(pal) > 1) {
    m <- as.data.frame(do.call("rbind",lapply(seq_along(pal), function(i){
      sysdata[[pal[i]]]
    })))
  } else {
    m <- sysdata[[pal]]
  }
  if(rev) m <- m[nrow(m):1, ]
  col <-  rgb(red = m$r*frgb[1], green = m$g*frgb[2], blue = m$b*frgb[3],
              maxColorValue = max(c(max(m$r, na.rm = T),
                                    max(m$g, na.rm = T),
                                    max(m$b, na.rm = T)))
  )
  if(colorRampPalette == FALSE){
    return(grDevices::colorRampPalette(col)(n))
  } else{
    return(grDevices::colorRampPalette(col))
  }
}
