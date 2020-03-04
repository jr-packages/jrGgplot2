#' Beauty data set
#'
#' This data set is from a study where researchers were
#' interested in whether a lecturers' attractiveness affected
#' their course evaluation. This is a cleaned version of the
#' data set and contains the following variables:
#' \describe{
#' \item{evaluation}{the questionnaire result}
#' \item{tenured}{does the lecturer have tenure;
#' 1 == Yes. In R, this value is continuous}
#' \item{minority}{does the lecturer come from an ethnic minority (in the USA)}
#' \item{age}{the lecturers' age}
#' \item{gender}{a factor: Female or Male}
#' \item{students}{number of students in the class}
#' \item{beauty}{each of the lecturers' pictures was rated by
#' six undergraduate students: three women and three men.
#' The raters were told to use a 10 (highest) to 1 rating scale,
#' to concentrate on the physiognomy of the
#' professor in the picture, to make their ratings independent of age, and to keep 5 in mind as
#' an average. The scores were then normalised.}
#' }
#' @name Beauty
#' @docType data
#' @usage data(Beauty)
#' @return A data frame
#'@keywords datasets
NULL

#' Aphids data set
#'
#' The is data described in Matis et al, 2008. The data set consists of five observations on
#' cotton aphid counts on twenty randomly chosen leaves in each plot, for twenty-seven
#' treatment-block combinations. The data were recorded in July 2004 in Lamesa, Texas.
#' The treatments consisted of three nitrogen levels (blanket, variable and zero), three
#' irrigation levels (low, medium and high) and three blocks, each being a distinct area.
#' Irrigation treatments were randomly assigned within each block as whole plots. Nitrogen
#' treatments were randomly assigned within each whole block as split plots.
#' Note that the sampling times are $t$=0, 1.14, 2.29, 3.57 and 4.57 weeks
#' (i.e. every 7 to 8 days).
#' \describe{
#' \item{Time}{Sampling time (in weeks). This has been slightly simplified}
#' \item{Water}{Water level at that particular plot: Low, Medium and High}
#' \item{Nitrogen}{Nitrogen level at that plot: Blanket, Variable and Zero}
#' \item{Block}{The plot block: 1, 2 or 3}
#' \item{Aphids}{The number of aphids counted}
#' }
#' @name aphids
#' @docType data
#' @usage data(aphids)
#' @return A data frame
#'@keywords datasets
NULL

#' Google data set
#'
#' The google data set
#' \describe{
#' \item{Rank}{Site rank (in terms of users)}
#' \item{Site}{Site name}
#' \item{Category}{Site classification}
#' \item{Users}{Approximate number of users}
#' \item{Views}{Approximate page views}
#' \item{Advertising}{Does the site have advertising}
#' }
#' @name google
#' @docType data
#' @usage data(google)
#' @return A data frame
#'@keywords datasets
NULL

#' Dummy cell data set
#'
#' Example cell data set. An experiment was conducted involving two cell types (Case and Control)
#' and two treatments (A and B). The data is stored as a data frame:
#' \describe{
#' \item{values}{measurements from the experiment}
#' \item{treatment}{either A or B}
#' \item{type}{Case or Control}
#' }
#' @name cell_data
#' @docType data
#' @usage data(cell_data)
#' @return A data frame
#'@keywords datasets
NULL

#' Raster example
#'
#' Simple matrix used to illustrate geom_raster
#' @name raster_example
#' @docType data
#' @usage data(raster_example)
#' @return A matrix
#'@keywords datasets
#'@examples
#'set.seed(1)
#' raster_example = expand.grid(x=1:10, y=1:10)
#' raster_example$z = runif(100)
NULL


#' @name bond
#' @title James Bond Data set
#'
#' @description Statistics from the James bond films
#' @source http://www.knownman.com/james-bond-graph/
#' @docType data
NULL
