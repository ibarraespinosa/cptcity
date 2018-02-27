#' Function to return colour palletes functions from 'cpt-city'
#'
#' This function return a collor pallete based on the name or position of the
#' pallete.
#'
#' The cpt-city web archive comes from:
#' http://soliton.vm.bytemark.co.uk/pub/cpt-city/index.html
#'
#' @param pal Pallete of colors available or the number of the position
#' @param n integer; number of colors
#' of the same
#'
#' @return A colour pallete function.
#' @importFrom grDevices rgb colorRampPalette
#' @export
#' @examples {
#' library(cptcity)
#' image(matrix(1:100), col = cpt(pal = "mpl_inferno"))
#' find_cpt("temperature")
#' image(matrix(1:100), col = cpt("idv_temperature"))
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
cpt <- function(pal = "mpl_inferno", n = 100){
  m <- sysdata[[pal]]
  col <-  rgb(red = m$r, green = m$g, blue = m$b,
              maxColorValue = max(c(max(m$r, na.rm = T),
                                    max(m$g, na.rm = T),
                                    max(m$b, na.rm = T)))
              )
  grDevices::colorRampPalette(col)(n)
}
