#' A function to generate a dummy x-y data set
#'
#' This is a function to load a \code{n} + 500 by 2 data set, consisting of
#' an x and y column, into your R session.
#'
#' @param n number of points in the random scatter (default is 20000)
#' @importFrom tibble as.tibble
#' @importFrom ggplot2 geom_point
#' @importFrom dplyr mutate %>%
#' @importFrom png readPNG
#' @return tibble
#' @export
get_xy_data = function(n = 20000) {
  logo = readPNG(system.file("logo.png", package = "jrGgplot2"))
  dims = dim(logo)
  pts = matrix(c(rep(1:dims[1], dims[2]), rep(1:dims[2], each = dims[1])), byrow = F, ncol = 2)

  #pick out only the points that are grey (on outline)
  pts = pts[sapply(1:(dims[1] * dims[2]),
                   function(x) {
                     logo[pts[x, 1], pts[x, 2], 4] > 0.5 &
                       logo[pts[x, 1], pts[x, 2], 4] < 0.8
                   }
  ), ]

  #nolint start
  samp = sample(x = 1:nrow(pts), size = 5000, replace = TRUE)
  #nolint end

  ptsflipped = cbind(x = pts[samp, 2], y = dims[2] - pts[samp, 1])

  #convert from matrix to tibble
  ptsflipped = as.tibble(ptsflipped)

  #centre image
  ptsflipped = ptsflipped %>%
    mutate(x  = x + 300, y = y + 300)

  # now add a random scatter of points
  xynorm = round(cbind(x = rnorm(n, mean = 1000, sd = 700),
                       y = rnorm(n, mean = 1400, sd = 700)))

  xydata = rbind(xynorm, ptsflipped)
  m = nrow(xydata)

  #reorder rows to hide the data
  samp2 = sample(x = 1:m, size = m, replace = FALSE)
  xydata = xydata[samp2, ]

  xydata = as.tibble(xydata)
  xydata
}
utils::globalVariables(c("x", "y"))
