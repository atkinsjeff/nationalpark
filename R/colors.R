#' Complete list of palettes
#'
#' Use \code{\link{np_palette}} to construct palettes of desired length.
#'
#' @export
np_palettes <- list(
  badlands = c("#3D6F07", "#FBF9FF", "#7D2010", "#DE5A31", "#535261"),
  deathvalley = c("#932ABE", "#2788F9", "#FFE9E6", "#F4B80D", "#665543"),
  smokies1 = c("#932ABE", "#2788F9", "#FFE9E6", "#F4B80D", "#665543"),
  tallgrass = c("#82A8E5", "#3C481D", "#757553", "#341A16", "#EDD8B9"),
  rockymtn = c("#EBECF5", "#6699F2", "#CBA230", "#949482", "#22251E")
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
