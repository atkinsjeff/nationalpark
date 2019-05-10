<!-- README.md is generated from README.Rmd. Please edit that file -->
National Park Palettes
=====================

![(images/yellowstone_vintage.jpg)]

> Yellowstone National Park

Tired of generic mass produced palettes for your plots? 

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

Figures
-------

The figure sizes have been customized so that you can easily put two
images side-by-side.

    plot(1:10)
    plot(10:1)

![](README_files/figure-markdown_strict/unnamed-chunk-1-1.png)![](README_files/figure-markdown_strict/unnamed-chunk-1-2.png)
Usage -----

    library(nationalpark)

    # See all palettes
    names(nationalpark)
    #>  [1] "BottleRocket1"  "BottleRocket2"  "Rushmore1"      "Rushmore"      
    #>  [5] "Royal1"         "Royal2"         "Zissou1"        "Darjeeling1"   
    #>  [9] "Darjeeling2"    "Chevalier1"     "FantasticFox1"  "Moonrise1"     
    #> [13] "Moonrise2"      "Moonrise3"      "Cavalcanti1"    "GrandBudapest1"
    #> [17] "GrandBudapest2" "IsleofDogs1"    "IsleofDogs2"

Palettes
--------

### Rocky Mountain National Park, Colorado

    np_palette("rockymtn")

![Rocky Mountain National Park (image courtesy Liz
Agee)](images/rockymtn.jpg) ![](figure/rockymtn.png)

### Tallgrass National Park

    np_palette("tallgrass")

![](figure/tallgrass.png)

    library("ggplot2")
    ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +  geom_bar() +
      scale_fill_manual(values = np_palette("tallgrass"))

![](figure/ggplot1-1.png) You can enable figure captions by
`fig_caption: yes` in YAML:

    output:
      rmarkdown::html_vignette:
        fig_caption: yes

Then you can use the chunk option `fig.cap = "Your figure caption."` in
**knitr**.



Also a quote using `>`:

> "He who gives up \[code\] safety for \[code\] speed deserves neither."
> ([via](https://twitter.com/hadleywickham/status/504368538874703872))

[1] A footnote here.
