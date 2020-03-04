## ---- echo=FALSE, message=TRUE, label="F2-11", fig.margin = TRUE, fig.cap="Average number of units consumed per actor.", fig.width=4, fig.height=4, message = FALSE----
library("ggplot2")
data(bond, package = "jrGgplot2")
ggplot(bond, aes(Actor, Alcohol_Units)) +
             stat_summary(geom = "point", fun.y = mean)

## ---- fig.keep="none", echo = TRUE, message = FALSE---------------------------
library("ggplot2")
data(bond, package = "jrGgplot2")
ggplot(bond, aes(Actor, Alcohol_Units)) +
  stat_summary(geom = "point", 
               fun.y = mean)

## ---- tidy=FALSE, fig.keep="none", echo = TRUE--------------------------------
ggplot(bond, aes(Actor, Alcohol_Units)) +
    stat_summary(geom = "point",
                 fun.y =  function(i) max(i) - min(i))

## ---- echo=FALSE, message=TRUE, label="F2-12", fig.margin = TRUE, fig.cap="Plot of the range for each actor.", fig.width=4, fig.height=4----
ggplot(bond, aes(Actor, Alcohol_Units)) +
             stat_summary(geom = "point", fun.y = mean)

## ---- tidy=FALSE, fig.keep="none", warning=FALSE, message=FALSE, error=FALSE, echo = TRUE----
## Standard error function
std_err = function(i)
    dt(0.975, length(i) - 1) * sd(i) / sqrt(length(i))

ggplot(bond, aes(x = Actor, y = Alcohol_Units)) +
    stat_summary(fun.ymin = function(i) mean(i) - std_err(i),
                 fun.ymax = function(i) mean(i) + std_err(i),
                 colour = "steelblue", geom = "errorbar",
                 width = 0.2, lwd = 2) +
    ylim(c(0, 20))

## ---- echo=FALSE, warning=FALSE, message=FALSE, error=FALSE, label="F2-13", fig.margin = TRUE, fig.cap="Confidence intervals for the mean number of units consumed by each actor.", fig.width=4, fig.height=4----
ggplot(bond, aes(x = Actor, y = Alcohol_Units)) +
    stat_summary(fun.ymin = function(i) mean(i) - std_err(i),
                 fun.ymax = function(i) mean(i) + std_err(i),
                 colour = "steelblue", geom = "errorbar",
                 width = 0.2, lwd = 2) +
    ylim(c(0, 20))

