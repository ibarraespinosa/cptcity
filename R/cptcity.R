#' Function to return colour palletes from cpt-city=
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
#' @param pal Pallete of colors available or the number of the position
#' of the same
#'
#' @return A colour pallete.
#' @importFrom grDevices rgb
#' @export
#' @examples \dontrun{
#' # Do not run
#' library(cptcity)
#' inferno <- cptcity("inferno")
#' image(matrix(1:255), col = inferno)
#' }
cptcity <- function (pal = "inferno") {
  m <- sysdata[[pal]]
  col <-  rgb(red = m$r, green = m$g, blue = m$b, maxColorValue = max(m))
  return(col)
}
