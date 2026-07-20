#' Visualise one or more colour palettes side-by-side
#'
#' Draws each palette as a horizontal colour bar using
#' \code{\link[graphics]{image}}, arranged in a grid that
#' automatically adapts to the number of palettes.
#'
#' @param x Character vector. Palette names (e.g. output from
#'   \code{\link{find_cpt}}).
#' @param label Logical. If \code{TRUE} (default), overlay a
#'   numbered label on each colour bar.
#'
#' @return Called for its side effect (a plot). Invisibly returns
#'   the palette names.
#'
#' @importFrom graphics image par text
#' @export
#'
#' @examples
#' library(cptcity)
#'
#' # Search then visualise
#' pals <- find_cpt("radar")
#' show_cpt(pals)
#'
#' # Without labels
#' show_cpt(pals, label = FALSE)
#'
#' # Single palette
#' show_cpt("mpl_inferno")
show_cpt <- function(x, label = TRUE) {

  oldpar <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(oldpar))

  nx <- length(x)

  # --- compute square-ish grid dimensions ---
  if (nx <= 2) {
    nrow <- 1; ncol <- nx
  } else if (nx <= 4) {
    nrow <- 2; ncol <- 2
  } else if (nx <= 6) {
    nrow <- 2; ncol <- 3
  } else if (nx <= 9) {
    nrow <- 3; ncol <- 3
  } else if (nx <= 12) {
    nrow <- 3; ncol <- 4
  } else if (nx <= 16) {
    nrow <- 4; ncol <- 4
  } else if (nx <= 20) {
    nrow <- 4; ncol <- 5
  } else if (nx <= 25) {
    nrow <- 5; ncol <- 5
  } else if (nx <= 30) {
    nrow <- 5; ncol <- 6
  } else if (nx <= 36) {
    nrow <- 6; ncol <- 6
  } else if (nx <= 49) {
    nrow <- 7; ncol <- 7
  } else if (nx <= 64) {
    nrow <- 8; ncol <- 8
  } else if (nx <= 100) {
    nrow <- 10; ncol <- 10
  } else if (nx <= 150) {
    nrow <- 10; ncol <- 15
  } else if (nx <= 216) {
    nrow <- 12; ncol <- 18
  } else if (nx <= 304) {
    nrow <- 16; ncol <- 19
  } else if (nx <= 572) {
    nrow <- 22; ncol <- 26
  } else {
    stop("Please select fewer than 573 palettes at once.")
  }

  cat("Creating", nrow, "x", ncol, "matrix\n")

  graphics::par(
    mfrow = c(nrow, ncol),
    mar   = c(0, 0, 0, 0)
  )

  for (i in seq_along(x)) {
    graphics::image(
      matrix(1:50),
      col   = cpt(x[i]),
      frame = TRUE,
      xaxt  = "n",
      yaxt  = "n"
    )

    if (isTRUE(label)) {
      # white shadow for contrast on any background
      graphics::text(
        x      = 0.52,
        y      = -0.05,
        labels = i,
        cex    = 1.5,
        col    = "white"
      )
      graphics::text(
        x      = 0.5,
        y      = 0,
        labels = i,
        cex    = 1.5
      )
    }
  }

  invisible(x)
}
