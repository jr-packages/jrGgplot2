#' Random Data Generator
#'
#' A simple function for generating a data frame with two columns with
#' \code{n} rows.
#' @param n Number of rows. Default 10000
#' @return Dataframe
#' @importFrom stats rnorm
#' @export
overplot_data = function(n = 10000) {
  x1 = signif(matrix(rnorm(n), ncol = 2), 2)
  x2 = signif(matrix(
    rnorm(n, mean = 3, sd = 1.5), ncol = 2), 2)
  x = rbind(x1, x2)
  data.frame(x = x[, 1], y = x[, 2])
}
