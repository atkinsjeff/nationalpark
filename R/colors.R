#' Complete list of palettes
#'
#' Use \code{\link{np_palette}} to construct palettes of desired length.
#'
#' @export
np_palettes <- list(
  arches = c("#3B1105", "#FC7500", "#ADB5BE", "#5487C8", "#FFD707"),
  badlands = c("#3D6F07", "#FBF9FF", "#7D2010", "#DE5A31", "#535261"),
  bryce = c("#DCDFE4", "#01261D", "#3C63A6", "#4F2716", "#F2B06A"),
  #conagree = c("#204608", "#403F0F", "#F4F3E1", "#11130E", "#A0F51C"),
  chesapeake = c("#0D0B07", "#F2884B", "#FF4F46", "#A66D60", "#594540"),
  conagree = c("#78A31F", "#13480A", "#69B1FF", "#190B40", "#612407"),
  deathvalley = c("#6503A6", "#6BB3F2", "#5C6F13", "#F2CB05", "#6B3C22"),
  everglades = c("#78A633", "#DADC57", "#735826", "#17130D", "#323D58"),
  flatirons = c("#261E29", "#383354", "#AFAEE7", "#2A301E", "#EEDB96"),
  grandtetons = c("#3F1359", "#9C98BD", "#67381F", "#354920", "#F4D4CA"),
  lakesuperior = c("#FAC9B1", "#DCABB0", "#6A5551", "#192E31", "#9BBFE6"),
  kingscanyon = c( "#B28D92", "#A4C3E1", "#2C3E12", "#413632",
                  "#7E7D4F", "#2B2B1D", "#A77957", "#BA9B23", "#080503"),
  picturedrocks = c("#254C84", "#58A0CD", "#5C845F", "#7E8081", "#EAAC72"),
  rockymtn = c("#E8B02C", "#333D2E", "#6A9CF5", "#5F6E2D", "#CE916C"),
  shenandoah = c("#253222", "#485551", "#A1A1A6", "#080A08", "#37291C"),
  shenandoah2 = c("#2B4622", "#FFFE01", "#1A1A10", "#4F9503", "#727B77"),
  smokies2 = c("#4C5961", "#000405", "#F2E702", "#2C4800", "#FBE1CA"),
  smokies3 = c("#004E5A", "#BBD0ED", "#F0C02D", "#BF6514", "#0B0F0D"),
  smokies = c("#932ABE", "#2788F9", "#FFE9E6", "#F4B80D", "#665543"),
  tallgrass = c("#82A8E5", "#3C481D", "#757553", "#341A16", "#EDD8B9"),
  yellowstone = c("#0154BE", "#FADB31", "#163003", "#C41F1E", "#4896F2"),
  yellowstone2 = c("#244200", "#211C12", "#D5AA7D", "#663726", "#93A2BF"),
  zion = c("#244200", "#211C12", "#D5AA7D", "#663726", "#9B856B")
)

#' A National Parks of the United States palette generator
#'
#' These are a handful of color palettes pulled from photographs of US National Parks.
#'
#' @param n Number of colors desired. Unfortunately most palettes now only
#'   have 5 colors. These palettes are picked using color.adobe.com
#'   from photographs provided by J.W. Atkins, E. Agee, A. R. Woleslagle.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{badlands}, \code{deathvalley}, \code{smokies},
#'   \code{picturedrocks}, \code{lakesuperior}, \code{tallgrass},
#'   \code{rockymtn}, \code{flatirons}, \code{shenandoah},
#'   \code{shenandoah2}, \code{kingscanyon}, \code{kingscanyon2},
#'   \code{smokies2}, \code{smokies3}, \code{arches},
#'   \code{bryce}, \code{grandtetons}, \code{conagree},
#'   \code{zion}, \code{yellowstone}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' np_palette("badlands")
#' np_palette("deathvalley")
#' np_palette("deathvalley", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- np_palette(21, name = "badlands", type = "continuous")
#' image(volcano, col = pal)
np_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- np_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

#' heatmap
#'
#' A heatmap example
"heatmap"
