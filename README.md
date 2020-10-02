cptcity package
================
Sergio Ibarra-Espinosa
17 de Noviembre de 2018

![](https://i.imgur.com/4v9WMQv.gif)

[![Travis-CI Build
Status](https://travis-ci.org/ibarraespinosa/cptcity.svg?branch=master)](https://travis-ci.org/ibarraespinosa/cptcity)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/ibarraespinosa/cptcity?branch=master&svg=true)](https://ci.apalettepveyor.com/project/ibarraespinosa/cptcity)
[![DOI](https://zenodo.org/badge/120517547.svg)](https://zenodo.org/badge/latestdoi/120517547)
[![Coverage
status](https://codecov.io/gh/ibarraespinosa/cptcity/branch/master/graph/badge.svg)](https://codecov.io/github/ibarraespinosa/cptcity?branch=master)
[![](http://cranlogs.r-pkg.org/badges/cptcity)](http://cran.rstudio.com/web/packages/cptcity/index.html)
[![Rdoc](http://www.rdocumentation.org/badges/version/cptcity)](http://www.rdocumentation.org/packages/cptcity)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/cptcity)](http://cran.r-project.org/web/packages/cptcity)
[![CRAN
Downloads](http://cranlogs.r-pkg.org/badges/grand-total/cptcity?color=orange)](http://cran.r-project.org/package=cptcity)

## A package to return colour gradients from CPTCITY

Colour palettes comes from
<http://soliton.vm.bytemark.co.uk/pub/cpt-city/index.html>

Currently there are 7140 colour gradients. To se the names type
`cpt_names`.

There are three functions:

1)  `find_cpt`: To search the name of the colour gradient.

Example:

``` r
library(cptcity)
find_cpt("radar")
```

    ## [1] "idv_radar_dbz_nws"    "idv_radar_dbz"        "idv_radar_reflect_24"
    ## [4] "idv_radar_topo_mdr"   "ncl_radar_1"          "ncl_radar"

``` r
find_cpt("rain")
```

    ##  [1] "colo_alpen_sky_rain_brolly"                 
    ##  [2] "colo_lightningmccarl_taste_the_rainbow"     
    ##  [3] "ds9_rainbow"                                
    ##  [4] "gist_rainbow"                               
    ##  [5] "gmt_GMT_rainbow"                            
    ##  [6] "grass_rainbow"                              
    ##  [7] "grass_terrain"                              
    ##  [8] "imagej_brain"                               
    ##  [9] "jjg_ccolo_alpen_sky_rain_brolly"            
    ## [10] "jjg_ccolo_lightningmccarl_taste_the_rainbow"
    ## [11] "jjg_misc_rainfall"                          
    ## [12] "jjg_neo10_elem_rain"                        
    ## [13] "jjg_neo10_othr_faint_rainbow"               
    ## [14] "jjg_neo10_othr_pastel_rainbow"              
    ## [15] "jjg_neo10_othr_rainbow_sunset"              
    ## [16] "kst_13_rainbow"                             
    ## [17] "kst_34_rainbow"                             
    ## [18] "kst_38_rainbow18"                           
    ## [19] "kst_39_rainbow_white"                       
    ## [20] "kst_40_rainbow_black"                       
    ## [21] "ma_icecream_rainbowsherbet"                 
    ## [22] "neota_elem_rain"                            
    ## [23] "neota_othr_faint_rainbow"                   
    ## [24] "neota_othr_pastel_rainbow"                  
    ## [25] "neota_othr_rainbow_sunset"                  
    ## [26] "oc_rainbow"                                 
    ## [27] "ocal_spectrum_rainbow_medium"               
    ## [28] "ocal_spectrums_rainbow_002"                 
    ## [29] "ocal_spectrums_rainbow"                     
    ## [30] "pd_skies_rainbow"                           
    ## [31] "pj_1_a_rainbow"                             
    ## [32] "pj_1_black_rainbow"                         
    ## [33] "pj_2_palest_rainbow"                        
    ## [34] "pj_2_white_rainbow"                         
    ## [35] "pj_2_wisteria_rain"                         
    ## [36] "pj_4_deeprainbow"                           
    ## [37] "pj_5_anotherrainbow"                        
    ## [38] "pj_5_harryrainbow"                          
    ## [39] "pj_5_mysticrainbow"                         
    ## [40] "pj_5_rainbowrich"                           
    ## [41] "pj_classic_paler_rainbow"                   
    ## [42] "rc_rainbow"                                 
    ## [43] "ukmo_main_rain_mmh"                         
    ## [44] "ukmo_wow_rain_mmh"

2)  `cpt`: To return the colour gradient.

<!-- end list -->

``` r
cptcity::cpt(pal = "ncl_radar_1", n = 100)
```

    ##   [1] "#B2F8FF" "#B2F8FF" "#B2F8FF" "#B2DCFF" "#B2BEFF" "#B2B8FF" "#B2B8FF"
    ##   [8] "#A088EE" "#8742D7" "#7D25CD" "#7D25CD" "#7322BE" "#601D9E" "#541A8B"
    ##  [15] "#541A8B" "#66328A" "#AF9387" "#EDE685" "#EDE685" "#ECE584" "#DDD67C"
    ##  [22] "#CDC673" "#CDC673" "#CDC673" "#B7B380" "#9D9C91" "#969696" "#969696"
    ##  [29] "#B4B4B4" "#E6E6E6" "#FFFFFF" "#FFFFFF" "#EEFFFF" "#C6FFFF" "#AAFFFF"
    ##  [36] "#AAFFFF" "#A2F6FF" "#79C9FF" "#55A0FF" "#55A0FF" "#55A0FF" "#3A55FF"
    ##  [43] "#2009FF" "#1D00FF" "#1D00FF" "#4053C3" "#6EBF75" "#7EE55B" "#7EE55B"
    ##  [50] "#71DE54" "#5AD249" "#4ECC43" "#4ECC43" "#48C741" "#39BB3C" "#2EB239"
    ##  [57] "#2EB239" "#2DB039" "#25A43B" "#1E993D" "#1E993D" "#1E993D" "#7FC54E"
    ##  [64] "#EAF562" "#FFFF66" "#FFFF66" "#FFED66" "#FFD566" "#FFCC66" "#FFCC66"
    ##  [71] "#FFBC5F" "#FF9B53" "#FF884C" "#FF884C" "#FF7945" "#FF442D" "#FF1919"
    ##  [78] "#FF1919" "#FD1A1A" "#E52B2B" "#CD3C3C" "#CC3D3D" "#CC3D3D" "#BC3838"
    ##  [85] "#A93232" "#A53131" "#A53131" "#BA2269" "#DD0AC3" "#ED00ED" "#ED00ED"
    ##  [92] "#D814E6" "#A945D7" "#8967CD" "#8967CD" "#9474CF" "#CAB5DB" "#FAF0E6"
    ##  [99] "#FAF0E6" "#FAF0E6"

``` r
cptcity::cpt(pal = c("mpl_viridis",
                     "mpl_inferno"), n = 100)
```

    ##   [1] "#440154" "#46085C" "#471063" "#481769" "#481E6F" "#482475" "#472B7A"
    ##   [8] "#46327E" "#443882" "#423E85" "#404487" "#3E4989" "#3C4F8A" "#39558C"
    ##  [15] "#365B8D" "#34608D" "#31658E" "#2F6A8E" "#2D6F8E" "#2B748E" "#29798E"
    ##  [22] "#277E8E" "#25828E" "#23878E" "#228C8D" "#20928C" "#1F968B" "#1E9B89"
    ##  [29] "#1FA088" "#20A485" "#23A983" "#28AE7F" "#2EB37C" "#35B778" "#3DBC73"
    ##  [36] "#47C06E" "#51C469" "#5BC863" "#67CC5B" "#73D055" "#7FD34D" "#8CD645"
    ##  [43] "#9AD83C" "#A7DB34" "#B5DE2A" "#C2DF22" "#D0E11B" "#DEE318" "#EBE51A"
    ##  [50] "#F7E620" "#010106" "#030210" "#07051B" "#0C0827" "#130A33" "#1A0C40"
    ##  [57] "#230C4C" "#2B0B57" "#34095F" "#3D0965" "#460A69" "#4E0D6C" "#57106E"
    ##  [64] "#5F136E" "#67166E" "#70196E" "#771C6D" "#7F1E6C" "#87216A" "#902568"
    ##  [71] "#982765" "#A02A62" "#A82E5E" "#B0315A" "#B83556" "#C03A50" "#C73E4B"
    ##  [78] "#CE4346" "#D44941" "#DA4F3B" "#E05535" "#E65D2E" "#EB6428" "#EF6C22"
    ##  [85] "#F2751B" "#F57D14" "#F8860E" "#FA9007" "#FB9906" "#FCA309" "#FCAD11"
    ##  [92] "#FBB71C" "#FAC127" "#F8CB35" "#F6D543" "#F4DF54" "#F2E967" "#F1F17B"
    ##  [99] "#F4F891" "#FCFFA4"

3)  `lucky`: To choose a random colour gradient

<!-- end list -->

``` r
cptcity::lucky(n = 100)
```

    ## Colour gradient: wkp_country_wiki_washington, number: 7106

    ##   [1] "#71ABD8" "#71ABD8" "#71ABD8" "#71ABD8" "#73ADDA" "#76AFDC" "#79B2DE"
    ##   [8] "#79B2DE" "#79B2DE" "#79B2DE" "#7FB7E2" "#86BBE6" "#8DC1EA" "#8DC1EA"
    ##  [15] "#8DC1EA" "#8DC1EA" "#93C6EE" "#9ACCF2" "#A1D2F7" "#A1D2F7" "#A1D2F7"
    ##  [22] "#A1D2F7" "#A9D7F9" "#B1DDFC" "#B9E3FF" "#B9E3FF" "#B9E3FF" "#B9E3FF"
    ##  [29] "#C3E8FE" "#CDECFE" "#D8F2FE" "#D8F2FE" "#D8F2FE" "#D8F2FE" "#C9E6E0"
    ##  [36] "#BADBC2" "#ACD0A5" "#ACD0A5" "#ACD0A5" "#ABCFA4" "#A3CA9C" "#9BC493"
    ##  [43] "#94BF8B" "#94BF8B" "#94BF8B" "#94BF8B" "#A1C38E" "#AFC792" "#BDCC96"
    ##  [50] "#BDCC96" "#BDCC96" "#BDCC96" "#C3CF9D" "#CAD3A4" "#D1D7AB" "#D1D7AB"
    ##  [57] "#D1D7AB" "#D1D7AB" "#D6DBAE" "#DBDFB1" "#E1E4B5" "#E1E4B5" "#E1E4B5"
    ##  [64] "#E1E3B4" "#E0DFAE" "#DFDAA9" "#DED6A3" "#DED6A3" "#DED6A3" "#DED6A3"
    ##  [71] "#D7CC97" "#D0C28C" "#CAB982" "#CAB982" "#CAB982" "#C9B881" "#C7B27A"
    ##  [78] "#C5AC72" "#C3A76B" "#C3A76B" "#C3A76B" "#C3A76B" "#BA9C62" "#B2915A"
    ##  [85] "#AA8753" "#AA8753" "#AA8753" "#AA8753" "#AF946A" "#B4A182" "#BAAE9A"
    ##  [92] "#BAAE9A" "#BAAE9A" "#BAAE9A" "#CDC5B7" "#E1DCD4" "#F5F4F2" "#F5F4F2"
    ##  [99] "#F5F4F2" "#F5F4F2"

## Install and use it\!

``` r
# install.packages("cptcity") 1.0.0
# devtools::install_github("ibarraespinosa/cptcity") 1.0.2
library(cptcity)
image(matrix(1:100), col = cpt(pal = "mpl_inferno"))
```

![](https://camo.githubusercontent.com/59d35f37ea4f3fcacf78273a78ad503419d3c7a1/68747470733a2f2f692e696d6775722e636f6d2f435763775856612e706e67)

## ggplot2

And you can use it ggplot2

``` r
library(cptcity)
library(ggplot2)
ggplot(faithfuld, aes(waiting, eruptions)) +
  geom_raster(aes(fill = density))
```

![](https://camo.githubusercontent.com/4417a85826aab5f7f7153c383d04066dde56bdf2/68747470733a2f2f692e696d6775722e636f6d2f55736f30477a6d2e706e67)

``` r
ggplot(faithfuld, aes(waiting, eruptions)) +
  geom_raster(aes(fill = density)) +
  scale_fill_gradientn(colours = cpt())
```

![](https://camo.githubusercontent.com/c0c0377793982e77db2a30efd7383a25c9e10070/68747470733a2f2f692e696d6775722e636f6d2f566766554f304f2e706e67)

## raster

or raster

``` r
library(cptcity)
library(raster)
f <- system.file("external/test.grd", package="raster")
r <- raster(f)
spplot(r, scales = list(draw = T))
```

![](https://camo.githubusercontent.com/ab1bb9975e45ee172d1163b87d914127d718c74d/68747470733a2f2f692e696d6775722e636f6d2f4f6c78376950442e706e67)

``` r
spplot(r, scales = list(draw = T),
       col.regions = rev(cpt(n = 100, pal = "colo_Skyblue2u_Gentle_Waves")))
```

![](https://camo.githubusercontent.com/d4364a2df8a6df47ce196de9f7c49d3e6fff91b3/68747470733a2f2f692e696d6775722e636f6d2f566a494a6e62792e706e67)

## sf

or sf

``` r
library(cptcity)
library(sf)
f = st_read(system.file("shapes/", package="maptools"), "sids")
st_crs(f) <- 4326
plot(f["AREA"], pal = cpt(colorRampPalette = T))
```

![](https://camo.githubusercontent.com/6440b0882e7c6f000f50b976e4861ce918da65a4/68747470733a2f2f692e696d6775722e636f6d2f654872627652582e706e67)

## mapview

or mapview

``` r
library(cptcity)
library(mapview)
library(sf)
f = st_read(system.file("shapes/", package="maptools"), "sids", crs = 4326)
mapview(f, zcol = "AREA", col.regions = cpt(colorRampPalette = T), legend = T)
```

![](https://camo.githubusercontent.com/a56248d08ddf653a62ee23ea8855cc24e77a2c69/68747470733a2f2f692e696d6775722e636f6d2f78664f6265626e2e706e67)

## stars

``` r
library(cptcity)
library(stars)
tif = system.file("tif/L7_ETMs.tif", package = "stars")
(x1 = read_stars(tif))

plot(x1, col = cptcity::cpt(819))
```

![](https://user-images.githubusercontent.com/27447280/53952592-1ccb2880-410c-11e9-8d2e-a0b85a4ae3d3.png)

## terra

``` r
library(cptcity)
library(terra)
f <- system.file("exdata/test.tif", package="terra")
r <- rast(f)
image(r, col = cptcity::lucky())
# Colour gradient: dca_alarm.p4.0.1, number: 1115 
```

![](https://user-images.githubusercontent.com/27447280/53952837-e2ae5680-410c-11e9-8783-60d7600aa771.png)

# **I included a random colour gradient function\!**

``` r
# install.packages("cptcity")
# devtools::install_github("ibarraespinosa/cptcity")
library(cptcity)
image(matrix(1:100), col = lucky())
```

## COPYING

Each palette has a COPYING.XML files available at ins/extdata. To see
each file do:

``` r
library(cptcity)
files <- list.files(system.file("extdata",
                                package = "cptcity"),
                    pattern = ".xml",
                    recursive = T,
                    full.names = T)
# For instance, the COPYING files of "arendal" is
files[1]
# and the file
readLines(files[1])
1] "/usr/local/lib/R/site-library/cptcity/extdata/arendal/COPYING.xml"
 [1] "<?xml version=\"1.0\"?>"                                                                        
 [2] "<copying>"                                                                                      
 [3] "  <authors>"                                                                                    
 [4] "    <author href=\"http://www.grida.no/graphicslib/\">"                                         
 [5] "      <name>GRID-Arendal</name>"                                                                
 [6] "    </author>"                                                                                  
 [7] "  </authors>"                                                                                   
 [8] "  <license>"                                                                                    
 [9] "    <informal>"                                                                                 
[10] "      Attribution and linkback requested."                                                      
[11] "    </informal>"                                                                                
[12] "    <year>2014</year>"                                                                          
[13] "    <text>"                                                                                     
[14] "      Using this graphic and referring to it is encouraged, "                                   
[15] "      and please use it in presentations, web pages, newspapers, "                              
[16] "      blogs and reports."                                                                       
[17] ""                                                                                               
[18] "      For any form of publication, please include the link to "                                 
[19] "      this page and give the cartographer/designer credit."                                     
[20] "    </text>"                                                                                    
[21] "  </license>"                                                                                   
[22] "  <src>"                                                                                        
[23] "    <format>PNG images</format>"                                                                
[24] "    <link href=\"http://www.grida.no/graphicslib/detail/mean-surface-temperature_c7e4\""        
[25] "\t  >Temperature</link>"                                                                        
[26] "    <link href=\"http://www.grida.no/graphicslib/detail/arctic-topography-and-bathymetry_5645\""
[27] "\t  >Arctic bathymetry</link>"                                                                  
[28] "    <link href=\"http://www.grida.no/graphicslib/detail/map-of-zimbabwe_36a5\""                 
[29] "\t  >Zambezi</link>"                                                                            
[30] "  </src>"                                                                                       
[31] "  <distribute>"                                                                                 
[32] "    <qgis distribute=\"yes\" license=\"other\"/>"                                               
[33] "  </distribute>"                                                                                
[34] "</copying>"  
```
