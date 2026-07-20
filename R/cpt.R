#' Return a colour palette function or vector from the cpt-city archive
#'
#' \code{cpt} extracts a named colour palette from the internal cpt-city
#' database and returns either a character vector of \code{n} interpolated
#' hex colours or the underlying \code{\link[grDevices]{colorRampPalette}}
#' function itself. The package ships 7140 colour gradients from
#' \url{https://phillips.shef.ac.uk/pub/cpt-city/}.
#'
#' **`sf` / `ggplot2` users:** use \code{colorRampPalette = TRUE}.
#' The \code{sf} plot method and \pkg{ggplot2}'s
#' \code{scale_*_gradientn} need a *function*, not a character vector.
#' See the examples below.
#'
#' @param pal Character. Name or position of the colour gradient in the
#'   cpt-city archive. Default \code{"mpl_inferno"}.
#' @param n Integer. Number of colours to return when
#'   \code{colorRampPalette = FALSE}. Ignored when
#'   \code{colorRampPalette = TRUE}.
#' @param colorRampPalette Logical. If \code{FALSE} (default), returns a
#'   character vector of \code{n} hex colours. If \code{TRUE}, returns a
#'   \code{colorRampPalette} *function* — this is what you need for
#'   \code{\link[sf]{plot}} (\code{pal =}) and
#'   \code{\link[ggplot2]{scale_fill_gradientn}} (\code{colours =}).
#' @param rev Logical. If \code{TRUE}, reverses the order of colours before
#'   interpolation.
#' @param frgb Numeric vector of length 3. Per-channel scaling factors for
#'   \code{c(red, green, blue)}. Values > 1 boost the channel, < 1 reduce it.
#'   Default \code{c(1, 1, 1)} (no scaling).
#'
#' @return A character vector of hex colours (length \code{n}) when
#'   \code{colorRampPalette = FALSE}, or a \code{colorRampPalette} function
#'   when \code{colorRampPalette = TRUE}.
#'
#' @importFrom grDevices rgb colorRampPalette
#' @export
#'
#' @examples
#' library(cptcity)
#'
#' # Character vector — use with base graphics
#' image(matrix(1:100), col = cpt(pal = "mpl_inferno"))
#' image(matrix(1:100), col = cpt("idv_temperature", rev = TRUE))
#'
#' # colorRampPalette function — use with sf and ggplot2
#' \dontrun{
#' library(sf)
#' nc <- st_read(system.file("shape/nc.shp", package = "sf"))
#' plot(nc["AREA"], pal = cpt("mpl_inferno", colorRampPalette = TRUE))
#'
#' library(ggplot2)
#' ggplot(faithfuld, aes(waiting, eruptions)) +
#'   geom_raster(aes(fill = density)) +
#'   scale_fill_gradientn(colours = cpt(n = 100, pal = "mpl_inferno"))
#' }
#'
#' # Search for palettes by keyword
#' find_cpt("temperature")
#' image(matrix(1:100), col = cpt("idv_temperature"))
#'
#' # Tint the palette by scaling the red channel down
#' image(matrix(1:100), col = cpt("mpl_inferno", frgb = c(0.3, 1, 1)))
cpt <- function(pal = "mpl_inferno",
                n = 100,
                colorRampPalette = FALSE,
                rev = FALSE,
                frgb = rep(1, 3)) {

  m <- sysdata[[pal]]

  if (is.null(m)) {
    stop(
      "Palette '", pal, "' not found in cptcity.\n",
      "Use find_cpt('keyword') to search for available palettes."
    )
  }

  if (rev) {
    m <- m[nrow(m):1, ]
  }

  max_val <- max(m$r, m$g, m$b, na.rm = TRUE)

  col <- grDevices::rgb(
    red   = m$r * frgb[1],
    green = m$g * frgb[2],
    blue  = m$b * frgb[3],
    maxColorValue = max_val
  )

  if (isTRUE(colorRampPalette)) {
    return(grDevices::colorRampPalette(col))
  }

  grDevices::colorRampPalette(col)(n)
}
