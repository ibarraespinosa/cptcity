## Adding new gradients

I've been adding manually some colour gradients

f1 <- read.table("http://soliton.vm.bytemark.co.uk/pub/cpt-city/ncl/radar.pg", sep = "",  h = F)
color2 <- rgb(red = f1$V2, green = f1$V3, blue = f1$V4, alpha = f1$V5)
image(matrix(1:100), col = color2)
