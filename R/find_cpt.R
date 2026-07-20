#' Find colour palette names by keyword search
#'
#' Searches the 7140 cpt-city palette names and returns those that match
#' your search term. Case-insensitive by default.
#'
#' @param name Character. Keyword to search for within palette names.
#' @param ignore.case Logical. If \code{TRUE} (default), search is
#'   case-insensitive. Ignored when \code{fixed = TRUE}.
#' @param fixed Logical. If \code{FALSE} (default), \code{name} is
#'   treated as a regular expression. Set to \code{TRUE} for literal
#'   string matching (faster, but case-sensitive).
#'
#' @return A character vector of palette names that contain the keyword.
#'   Returns a zero-length vector if nothing matches.
#'
#' @note This is a thin wrapper around \code{\link{grep}}. You can pass
#'   regex patterns like \code{"^oc_"} to find all palettes starting with
#'   "oc_" or \code{"temperature|thermal"} to match either term.
#'
#' @export
#'
#' @examples
#' library(cptcity)
#'
#' # Case-insensitive search (default)
#' find_cpt("temperature")
#'
#' # Case-sensitive
#' find_cpt("Temperature", ignore.case = FALSE)
#'
#' # Regex: all palettes starting with "oc_"
#' find_cpt("^oc_")
#'
#' # Literal match (faster, exact substring — case-sensitive)
#' find_cpt("rain", fixed = TRUE)
#'
#' # Use the result directly
#' image(matrix(1:100), col = cpt("idv_temperature"))
#'
#' \dontrun{
#' library(ggplot2)
#' ggplot(faithfuld, aes(waiting, eruptions)) +
#'   geom_raster(aes(fill = density)) +
#'   scale_fill_gradientn(colours = cpt(pal = "ncl_radar", n = 100))
#' }
find_cpt <- function(name, ignore.case = TRUE, fixed = FALSE) {
  cpt_names <- sysdata[["cpt_names"]]

  if (isTRUE(fixed)) {
    y <- cpt_names[grep(pattern = name, x = cpt_names, fixed = TRUE)]
  } else {
    y <- cpt_names[grep(pattern = name, x = cpt_names,
                        ignore.case = ignore.case, fixed = FALSE)]
  }
  return(y)
}
