#' Function to return colour palletes functions from cpt-city
#'
#' This function return a collor pallete based on the name or position of the
#' pallete. Currently there are three available palletes:
#'
#' \enumerate{
#'   \item "inferno"
#'   \item "temperature"
#'   \item "sst"
#'   \item "temp"
#'   \item "arendarl_arctic"
#'   \item "arendarl_temperature"
#'   \item "arendarl_zambezi_focus"
#'   \item "arendarl_zambezi_proximity"
#' }
#'
#' The palletes are ones of the most popular.
#'
#' The palletes are available here:
#' http://soliton.vm.bytemark.co.uk/pub/cpt-city/index.html
#'
#' @param n integer; number of colors
#' @param pal Pallete of colors available or the number of the position
#' of the same
#' @param ... ignored
#'
#' @return A colour pallete function.
#' @importFrom grDevices rgb colorRampPalette
#' @export
#' @examples \dontrun{
#' # Do not run
#' library(cptcity)
#' image(matrix(1:100), col = cpt(pal = "inferno"))
#' library(ggplot2)
#' ggplot(faithfuld, aes(waiting, eruptions)) +
#' geom_raster(aes(fill = density))
#'
#'  ggplot(faithfuld, aes(waiting, eruptions)) +
#'  geom_raster(aes(fill = density)) +
#'  scale_fill_gradientn(colours = cpt(n = 100))
#' }
cpt <- function(n = 10, pal = "inferno", ...){
  m <- sysdata[[pal]]
  col <-  rgb(red = m$r, green = m$g, blue = m$b,
              maxColorValue = max(c(max(m$r, na.rm = T),
                                    max(m$g, na.rm = T),
                                    max(m$b, na.rm = T)))
              )
  grDevices::colorRampPalette(col)(n)
}
