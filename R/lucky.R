#' Return a random colour gradient — "I'm Feeling Lucky" for palettes
#'
#' Picks one of the 7140 colour gradients at random and returns it,
#' optionally printing its name so you can re-use it later. Based on
#' Google's "I'm Feeling Lucky" button.
#'
#' @param n Integer. Number of colours to return when
#'   \code{colorRampPalette = FALSE}. Ignored when
#'   \code{colorRampPalette = TRUE}.
#' @param colorRampPalette Logical. If \code{FALSE} (default), returns a
#'   character vector of \code{n} colours. If \code{TRUE}, returns a
#'   \code{colorRampPalette} function — the right choice for
#'   \code{\link[sf]{plot}} and \pkg{ggplot2}.
#' @param rev Logical. If \code{TRUE}, reverse the gradient order.
#' @param message Logical. If \code{TRUE} (default), prints the name and
#'   index of the chosen palette to the console.
#' @param nseed Integer. A seed value passed to \code{\link{set.seed}} for
#'   reproducible random selection.
#' @param frgb Numeric vector of length 3. Per-channel scaling factors for
#'   \code{c(red, green, blue)}. Default \code{c(1, 1, 1)}.
#'
#' @return A character vector of hex colours when
#'   \code{colorRampPalette = FALSE}, or a \code{colorRampPalette} function
#'   when \code{colorRampPalette = TRUE}.
#'
#' @importFrom grDevices rgb colorRampPalette
#' @importFrom stats runif
#' @export
#'
#' @examples
#' library(cptcity)
#'
#' # Random palette each time you call it
#' image(matrix(1:100), col = lucky())
#' image(matrix(1:100), col = lucky())
#' image(matrix(1:100), col = lucky(rev = TRUE))
#'
#' # Reproducible random pick
#' image(matrix(1:100), col = lucky(nseed = 42))
#' image(matrix(1:100), col = lucky(nseed = 42))  # same palette
#'
#' # Silent mode + sf-compatible output
#' \dontrun{
#' library(sf)
#' nc <- st_read(system.file("shape/nc.shp", package = "sf"))
#' plot(nc["AREA"], pal = lucky(colorRampPalette = TRUE, message = FALSE))
#' }
lucky <- function(n = 100,
                  colorRampPalette = FALSE,
                  rev = FALSE,
                  message = TRUE,
                  nseed,
                  frgb = rep(1, 3)) {

  if (!missing(nseed)) {
    set.seed(nseed)
  }

  n_palettes <- 7140L
  numero <- round(stats::runif(n = 1L, min = 0, max = n_palettes))
  numero <- max(numero, 1L)       # guard against runif returning exactly 0
  numero <- min(numero, n_palettes) # guard against hitting 7141

  m <- sysdata[[numero]]
  pal_name <- sysdata[["cpt_names"]][numero]

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

  if (isTRUE(message)) {
    cat(sprintf("Colour gradient: %s, number: %d\n", pal_name, numero))
  }

  if (isTRUE(colorRampPalette)) {
    return(grDevices::colorRampPalette(col))
  }

  grDevices::colorRampPalette(col)(n)
}
