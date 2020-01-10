## ----echo=FALSE---------------------------------------------------------------
library(tufte)
knitr::opts_chunk$set(results = "hide", echo = FALSE)

## ----overplotting, cache=TRUE, tidy=FALSE, echo=1:4---------------------------
## If your computer is slow when plotting reduce the value of n
library("jrGgplot2")
library("ggplot2")
df = overplot_data(n = 20000)
h = ggplot(df) + geom_point(aes(x, y))

## ----echo=FALSE, fig.margin = TRUE, fig.cap="A scatter plot that suffers from over plotting.", fig.height = 4----
h

## ---- echo = 2----------------------------------------------------------------
library("ggplot2")
h = ggplot(df) + geom_point(aes(x, y))

## ----cache=TRUE, fig.keep='none', tidy=FALSE, echo = TRUE---------------------
h +  stat_density2d(aes(x, y, fill = ..density..),
                contour = FALSE, geom = "tile")

## ---- echo = TRUE-------------------------------------------------------------
data(diamonds, package = "ggplot2")

## ----tidy=FALSE, eval=FALSE, echo = TRUE--------------------------------------
#  ?diamonds

## ----fig.keep='none', message=FALSE, echo = TRUE------------------------------
i1 = ggplot(data = diamonds) +
  geom_histogram(aes(x = depth))

## ----echo=FALSE, message=FALSE, fig.margin = TRUE, fig.cap = "Histogram of the diamond data set.", fig.height = 4----
i1

## ----F1, echo=FALSE, message=FALSE, fig.keep='none',results='hide'------------
data(mpg, package = "ggplot2")
g = ggplot(data = mpg, aes(x = displ, y = hwy))
g1 = g + geom_point() + stat_smooth(linetype = 2) +
  xlab("Displacement") + ylab("Highway mpg")
g2 = g + geom_point() + stat_smooth(aes(colour = drv))

## ----dev='png', out.width='\\textwidth', echo=FALSE, message=FALSE, fig.margin = TRUE, fig.cap = "Graphics for section 1.", fig.height = 4----
g1

## ----message=FALSE, echo = TRUE-----------------------------------------------
library("ggplot2")

## ----results='hide', echo = TRUE----------------------------------------------
data(mpg, package = "ggplot2")
dim(mpg)

## ----fig.keep='none', tidy=FALSE, echo = TRUE---------------------------------
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() + xlab("Displacement")

## -----------------------------------------------------------------------------
g = ggplot(data = mpg, aes(x = displ, y = hwy))
g1 = g + geom_point() + stat_smooth(linetype = 2) +
  xlab("Displacement") + ylab("Highway mpg")

## ----dev='png', out.width='\\textwidth', echo=FALSE, message=FALSE, fig.margin = TRUE, fig.cap = "Graphics for section 1.", fig.height = 4----
g2

## -----------------------------------------------------------------------------
g2 = g + geom_point() + stat_smooth(aes(colour = drv))

## ----eval=FALSE---------------------------------------------------------------
#  library(jrGgplot2)
#  vignette("solutions2", package = "jrGgplot2")

