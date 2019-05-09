#' Complete list of palettes
#'
#' Use \code{\link{np_palette}} to construct palettes of desired length.
#'
#' @export
np_palettes <- list(
  arches = c("#3B1105", "#FC7500", "#E0E4FC", "#5487C8", "#FFD707"),
  badlands = c("#3D6F07", "#FBF9FF", "#7D2010", "#DE5A31", "#535261"),
  bryce = c("#DCDFE4", "#01261D", "#3C63A6", "#4F2716", "#F2B06A"),
  conagree = c("#204608", "#403F0F", "#F4F3E1", "#11130E", "#A0F51C"),
  deathvalley = c("#932ABE", "#2788F9", "#FFE9E6", "#F4B80D", "#665543"),
  everglades = c("#78A633", "#DADC57", "#735826", "#17130D", "#323D58"),
  flatirons = c("#261E29", "#383354", "#AFAEE7", "#2A301E", "#EEDB96"),
  grandtetons = c("#3F1359", "#9C98BD", "#67381F", "#354920", "#F4D4CA"),
  lakesuperior = c("#FCFEFD", "#DCABB0", "#6A5551", "#192E31", "#9BBFE6"),
  kingscanyon = c("#09090B", "#FDFEFD", "#A4C3E1", "#5A4F29", "#413632"),
  kingscanyon2 = c("#7E7D4F", "#2B2B1D", "#A77957", "#EDEDED", "#080503"),
  picturedrocks = c("#254C84", "#58A0CD", "#5C845F", "#FDF8F3", "#EAAC72"),
  rockymtn = c("#EBECF5", "#6699F2", "#CBA230", "#949482", "#22251E"),
  shenandoah = c("#253222", "#DFE4F3", "#6D6C71", "#080A08", "#37291C"),
  shenandoah2 = c("#525972", "#D6E7FF", "#72532F", "#6E6F35", "#F8E5AA"),
  smokies = c("#932ABE", "#2788F9", "#FFE9E6", "#F4B80D", "#665543"),
  smokies2 = c("#4C5961", "#000405", "#F2E702", "#2C4800", "#FBE1CA"),
  smokies3 = c("#004E5A", "#D8F7ED", "#F0C02D", "#BF6514", "#0B0F0D"),
  tallgrass = c("#82A8E5", "#3C481D", "#757553", "#341A16", "#EDD8B9"),
  yellowstone = c("#0154BE", "#FADB31", "#163003", "#C41F1E", "#4896F2"),
  zion = c("#244200", "#211C12", "#D5AA7D", "#663726", "#FAFCFE")
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
#'   \code{badlands}, \code{deathvalley}, \code{smokies1}
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
