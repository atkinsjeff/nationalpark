<!-- README.md is generated from README.Rmd. Please edit that file -->
National Park Palettes
=====================



> I saved you from boring plots. What did you ever do? - Max Fischer
> (probably)

Tired of generic mass produced palettes for your plots? Short of adding
an owl and dressing up your plot in a bowler hat, here’s the most indie
thing you can do to one. First round of palettes derived from the
amazing Tumblr blog [Wes Anderson
Palettes.](http://wesandersonpalettes.tumblr.com/)

Installation
------------

``` r
install.packages("nationalpark")
```

**Or the development version**

``` r
devtools::install_github("atkinsjeff/nationalpark")
```

Usage
-----

``` r
library("nationalpark")

# See all palettes
names(nationalpark)
#>  [1] "BottleRocket1"  "BottleRocket2"  "Rushmore1"      "Rushmore"      
#>  [5] "Royal1"         "Royal2"         "Zissou1"        "Darjeeling1"   
#>  [9] "Darjeeling2"    "Chevalier1"     "FantasticFox1"  "Moonrise1"     
#> [13] "Moonrise2"      "Moonrise3"      "Cavalcanti1"    "GrandBudapest1"
#> [17] "GrandBudapest2" "IsleofDogs1"    "IsleofDogs2"
```

Palettes
--------

### Rocky Mountain National Park, Colorado

``` r
np_palette("rockymtn")
```

![](figure/rockymtn.png)


### Tallgrass National Park

``` r
np_palette("tallgrass")
```

![](figure/tallgrass.png)


``` r
library("ggplot2")
ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +  geom_bar() +
  scale_fill_manual(values = np_palette("tallgrass"))
```

![](figure/ggplot1-1.png)


