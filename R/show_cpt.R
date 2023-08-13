#' Show me some colors!
#'
#' \code{\link{show_cpt}} returns a color matrix which prints
#' and show the colors
#'
#' @param x character;  names of the cpt gradients.
#' @param label Logical, to show labels or not.
#' @return names color matrix
#' @importFrom graphics image par text
#' @export
#' @examples {
#' library(cptcity)
#' show_cpt(find_cpt("radar"))
#' }
show_cpt <- function(x, label = TRUE) {
  oldpar <- graphics::par(no.readonly = TRUE)
  if(length(x)<= 4) {
    vec <- c(2,2)
  } else if(length(x) > 4 & length(x) <= 6){
    vec <- c(2,3)
  } else if(length(x) > 6 & length(x) <= 9){
    vec <- c(3,3)
  } else if(length(x) > 9 & length(x) <= 12){
    vec <- c(3,4)
  } else if(length(x) > 12 & length(x) <= 16){
    vec <- c(4,4)
  } else if(length(x) > 16 & length(x) <= 20){
    vec <- c(4,5)
  } else if(length(x) > 20 & length(x) <= 24){
    vec <- c(4,6)
  } else if(length(x) > 24 & length(x) <= 30){
    vec <- c(5,6)
  } else if(length(x) > 30 & length(x) <= 35){
    vec <- c(5,7)
  } else  if(length(x) > 35 & length(x) <= 49){
    vec <- c(7, 7)
  } else  if(length(x) > 49 & length(x) <= 64){
    vec <- c(8, 8)
  } else  if(length(x) > 64 & length(x) <= 80){
    vec <- c(8, 10)
  } else  if(length(x) > 80 & length(x) <= 100){
    vec <- c(10, 10)
  } else  if(length(x) > 100 & length(x) <= 150){
    vec <- c(10, 15)
  } else  if(length(x) > 150 & length(x) <= 216){
    vec <- c(12, 18)
  } else  if(length(x) > 216 & length(x) <= 304){
    vec <- c(16, 19)
  } else  if(length(x) > 304 & length(x) <= 572){
    vec <- c(22, 26)
  } else {
    stop("Please, select less than 527 colors")

  }

  cat("Creating ", vec, "matrix\n")
  graphics::par(mfrow = vec,
                mar =c(0,0,0,0))

  if(label) {
    for(i in seq_along(x)){
      graphics::image(matrix(1:50),
                      col = cpt(x[i]),
                      frame = T,
                      xaxt = "n",
                      yaxt = "n")
      graphics::text(x = 0.52,
                     y = -0.05,
                     labels = i,
                     cex = 1.5,
                     col = "white")
      graphics::text(x = 0.5,
                     y = 0,
                     labels = i,
                     cex = 1.5)
    }
    on.exit(par(oldpar))

  } else {
    for(i in seq_along(x)){
      graphics::image(matrix(1:50),
                      col = cpt(x[i]),
                      frame = T,
                      xaxt = "n",
                      yaxt = "n")
    }
    on.exit(par(oldpar))

  }
}
