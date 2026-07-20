#' cpt-city: Colour Gradients for R
#'
#' @description
#' Incorporates 7140 colour gradients from the
#' \href{https://phillips.shef.ac.uk/pub/cpt-city/}{cpt-city web archive}
#' into R. Each palette is stored as a \code{data.frame} with columns
#' \code{id}, \code{r}, \code{g}, \code{b}.
#'
#' @section Functions:
#' \describe{
#'   \item{\code{\link{cpt}}}{Return an interpolated colour palette or
#'     \code{colorRampPalette} function.}
#'   \item{\code{\link{find_cpt}}}{Search palette names by keyword.}
#'   \item{\code{\link{lucky}}}{Pick a random palette —
#'     "I'm Feeling Lucky" for colours.}
#'   \item{\code{\link{show_cpt}}}{Display multiple palettes side-by-side.}
#' }
#'
#' @docType package
#' @name cptcity
#' @aliases cptcity-package
"_PACKAGE"
