## ----echo=FALSE----------------------------
library(tufte)
knitr::opts_chunk$set(results = "hide", echo = FALSE)

## ---- echo = TRUE--------------------------
library("ggplot2")

## ---- echo = TRUE--------------------------
library("jrGgplot2")
data(Beauty, package = "jrGgplot2")

## ----results='hide', echo = TRUE-----------
head(Beauty)
colnames(Beauty)
dim(Beauty)

## ----fig.keep='none', echo = TRUE----------
ggplot(data = Beauty) +
  geom_point(aes(x = age, y = beauty))

## ----cache=TRUE, echo = TRUE---------------
g = ggplot(data = Beauty)
g1 = g + geom_point(aes(x = age, y = beauty))

## ----fig.keep='none', echo = TRUE----------
g + geom_point(aes(x = age, y = beauty, colour = gender))

## ----fig.keep='none', tidy=FALSE, cache=TRUE, echo = TRUE----
g + geom_point(aes(x = age, y = beauty, colour = gender,
                   alpha = evaluation))

## ----fig.keep='none', echo = TRUE----------
g + geom_point(aes(x = age, y = beauty, colour = "blue"))

## ----fig.keep='none', echo = TRUE----------
g + geom_point(aes(x = age, y = beauty), colour = "blue")

## ----fig.keep='none', echo = TRUE----------
g + geom_boxplot(aes(x = gender, y = beauty))

## ----fig.keep='none', cache=TRUE, tidy=FALSE, echo = TRUE----
g + geom_boxplot(aes(x = gender, y = beauty,
                     colour = factor(tenured)))

## ----eval=FALSE, echo = TRUE---------------
#  g + geom_boxplot(aes(x = gender, y = beauty, colour = tenured))

## ----fig.keep='none', tidy=FALSE, echo = TRUE----
g + geom_boxplot(aes(x = gender, y = beauty,
                     colour = factor(tenured)))

## ----fig.keep='none', tidy=FALSE, echo = TRUE----
g + geom_boxplot(aes(x = gender, y = beauty,
                          colour = factor(tenured))) +
  geom_point(aes(x = gender, y = beauty))

## ----fig.keep='none', tidy=FALSE, echo = TRUE----
g + geom_boxplot(aes(x = gender, y = beauty,
                         colour = factor(tenured))) +
  geom_jitter(aes(x = gender, y = beauty))

## ----fig.keep='none', echo = TRUE----------
g + geom_bar(aes(x = factor(tenured)))

## ----fig.keep='none', echo = TRUE----------
Beauty$dec = factor(signif(Beauty$age, 1))

## ----fig.keep='none', echo = TRUE----------
g = ggplot(data = Beauty)
g + geom_bar(aes(x = gender, fill = dec))

## ----fig.keep='none', tidy=FALSE, echo = TRUE----
g + geom_bar(aes(x = gender, fill = dec),
             position = "stack")

## ----echo=FALSE, fig.margin = TRUE, fig.cap="Barplot of ages using position = 'dodge'", out.width="\\textwidth", fig.height = 4----
g + geom_bar(aes(x = gender, fill = dec),
             position = "dodge")

