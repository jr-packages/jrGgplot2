## ----echo=FALSE----------------------------
library(tufte)
knitr::opts_chunk$set(results = "show", echo = TRUE)

## ----echo=FALSE----------------------------
library("ggplot2")
data(aphids, package = "jrGgplot2")

## ----message=FALSE, echo = TRUE------------
data(mpg, package = "ggplot2")

## ----tidy=FALSE, echo = TRUE---------------
g = ggplot(data=mpg, aes(x=displ, y=hwy)) +
  geom_point()

## ----fig.keep='none', message=FALSE, echo = TRUE----
g + stat_smooth(aes(colour=drv))

## ----eval=FALSE, echo = TRUE---------------
#  mpg[mpg$drv == "4",]$drv = "4wd"
#  mpg[mpg$drv == "f",]$drv = "Front"
#  mpg[mpg$drv == "r",]$drv = "Rear"

## ---- echo = TRUE--------------------------
##Reload the data just to make sure
data(mpg, package="ggplot2")
mpg$drv = factor(mpg$drv, labels = c("4wd", "Front", "Rear"))

## ----tidy=FALSE, echo = TRUE---------------
mpg$drv = factor(mpg$drv,
                 levels = c("Front", "Rear", "4wd"))

## ---- echo=FALSE, cache=TRUE, pos.width="\\textwidth", fig.width=6, fig.pos = "t", fig.cap = "Final figure from section 2.", fig.height = 5----
aphids$Block = factor(aphids$Block)
aphids$Water = factor(aphids$Water,
                      levels=c("Low", "Medium", "High"))
ga = ggplot(data=aphids) +
  geom_point(aes(Time, Aphids, colour=Block)) +
  facet_grid(Nitrogen ~ Water) +
  geom_line(aes(Time, Aphids, colour=Block)) +
  theme_bw()

print(ga)

## ----cache=TRUE, results='hide', echo = TRUE----
data(aphids, package="jrGgplot2")

## ----eval=FALSE, tidy=FALSE, echo = TRUE----
#   + xlab("Time")

## ----fig.keep='none', tidy=FALSE-----------
##Code for figure 1
aphids$Block = factor(aphids$Block)
aphids$Water = factor(aphids$Water,
                      levels=c("Low", "Medium", "High"))
ga = ggplot(data=aphids) +
  geom_point(aes(Time, Aphids, colour=Block)) +
  facet_grid(Nitrogen ~ Water) +
  geom_line(aes(Time, Aphids, colour=Block)) +
  theme_bw()

## ---- echo = TRUE--------------------------
data(Beauty, package="jrGgplot2")

## ----fig.keep='none', echo = TRUE----------
Beauty$dec = signif(Beauty$age, 1)
g = ggplot(data=Beauty)
g1 = g + geom_bar(aes(x=gender, fill=factor(dec)))

## ----echo=FALSE, pos.width="\\textwidth", fig.margin = TRUE, fig.cap = "Stacked bar chart of the Beauty data set.", label = "F2", fig.height = 4----
g1

## ----fig.keep='none', echo = TRUE----------
g2 = g + geom_bar(aes(x=gender)) +
  facet_grid(. ~ dec)

## ---- fig.keep='none'----------------------
g + geom_bar(aes(x=gender)) + facet_grid(. ~ dec, margins=TRUE)

## ----fig.keep='none'-----------------------
## Notice that the females have disappeared from the "70" facet.
## Probably not what we wanted.
g + geom_bar(aes(x=gender)) + facet_grid(. ~ dec, scales="free_x")

## ----fig.keep='none'-----------------------
g + geom_bar(aes(x=gender)) + facet_grid(dec ~.)

## ----fig.keep='none'-----------------------
##Relabel the factor
Beauty$dec = factor(Beauty$dec,
                    labels=c("Thirties", "Forties", "Fifties", "Sixties", "Seventies"))

## Plot as before
ggplot(data=Beauty) +
  geom_bar(aes(x=gender)) +
  facet_grid(dec ~.)

## ----F3,echo=FALSE-------------------------
data(google, package="jrGgplot2")
g = ggplot(google) +
  geom_point(aes(Rank, Users), alpha=0.2) +
  scale_y_log10(limit=c(1e0, 1e9))  +
  facet_grid(Advertising~.) +
  geom_point(data=subset(google, Category=="Social Networks"),
             aes(Rank, Users), colour="Red",  size=2)

## ---- echo = TRUE--------------------------
data(google, package="jrGgplot2")

## ----echo=FALSE, pos.width="\\textwidth", fig.margin = TRUE, fig.cap = "The Google data set.", fig.height = 4----
g

## ----tidy=FALSE----------------------------
g = ggplot(google) +
  geom_point(aes(Rank, Users), alpha=0.2) +
  scale_y_log10(limit=c(1e0, 1e9))  +
  facet_grid(Advertising~.) +
  geom_point(data=subset(google, Category=="Social Networks"),
             aes(Rank, Users), colour="Red",  size=2)

## ------------------------------------------
data(cell_data, package="jrGgplot2")

## ----tidy=FALSE, echo = TRUE---------------
##This doesn't plot anything
g = ggplot(cell_data, aes(treatment, values)) +
  facet_grid(.~type)

## ----fig.keep='none',  message=FALSE-------
##Boxplot
g + geom_boxplot()

## Dotplot
g + geom_dotplot(binaxis="y", stackdir="center",
                 colour="blue", fill="blue")

## Plain (jittered) points
g + geom_jitter()

## Dotplots + error bars
g +  geom_dotplot(binaxis="y", stackdir="center",
                  colour="blue", fill="blue") +
  stat_summary(geom="errorbar",
               fun.ymin=min, fun.ymax=max, fun.y=mean,
               width=0.2)

## ----eval=FALSE, echo = TRUE---------------
#  library(jrGgplot2)
#  vignette("solutions3", package="jrGgplot2")

