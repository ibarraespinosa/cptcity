#' Random colour gradient!
#'
#' Based on "I'm Feeling Lucky" from Google. As this package includes 7140
#' colour gradients, it might be hard to find the 'right'
#'
#' The cpt-city web archive comes from:
#' http://soliton.vm.bytemark.co.uk/pub/cpt-city/index.html
#'
#' @param n integer; number of colors
#' @param colorRampPalette Logical; to be used in sf and mapview.
#' @param rev Logical; to internally revert order of rgb color vectors.
#' @param message Logical; for printing or not the name of the colour gradient
#' @param nseed integer; for reproducing the same colour gradient.
#' See \code{\link{set.seed}}
#'
#' @return A RANDOM colour palette function including name of the colour gradient
#' and number.
#' @importFrom grDevices rgb colorRampPalette
#' @importFrom stats runif
#' @export
#' @examples {
#' library(cptcity)
#' image(matrix(1:100), col = lucky())
#' image(matrix(1:100), col = lucky())
#' image(matrix(1:100), col = lucky())
#' image(matrix(1:100), col = lucky())
#' image(matrix(1:100), col = lucky())
#' image(matrix(1:100), col = lucky(rev = TRUE))
#' image(matrix(1:100), col = lucky(nseed = 1))
#' }
lucky <- function(n = 100, colorRampPalette = FALSE, rev = FALSE, message = TRUE, nseed){
  if(!missing(nseed)){
    set.seed(nseed)
    numero <- round(runif(n = 1L, min = 0, max = 7140))
  } else {
    numero <- round(runif(n = 1L, min = 0, max = 7140))
  }
  m <- sysdata[[numero]]
  cpt_names <- sysdata[["cpt_names"]]

  if(rev) m <- m[nrow(m):1, ]

    col <-  rgb(red = m$r, green = m$g, blue = m$b,
                maxColorValue = max(c(max(m$r, na.rm = T),
                                      max(m$g, na.rm = T),
                                      max(m$b, na.rm = T)))
    )
  if(message){
    cat(paste0("Colour gradient: " ,cpt_names[numero], ", number: ", numero), "\n")
  }
  if(colorRampPalette == FALSE){
    return(grDevices::colorRampPalette(col)(n))
  } else{
    return(grDevices::colorRampPalette(col))
  }
}
