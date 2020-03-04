## ----tidy=FALSE---------------------------------------------------------------
library("ggplot2")
data(bond, package = "jrGgplot2")
(g = ggplot(data = bond, aes(x = Alcohol_Units, y = Kills)) + 
  geom_point(aes(colour = Actor)))

(g1 = g + scale_colour_hue(l = 70, c = 60))

(g2 = g + scale_colour_brewer(palette = "PuOr", type = "div"))

# Colours for amusement rather than clarity
(g3 = g + scale_colour_manual(values = c(
    "Brosnan" = rgb(192, 192, 192, maxColorValue = 255), #silver
    "Connery" = "Gold",
    "Craig" = rgb(205, 127, 50, maxColorValue = 255), #Bronze 
    "Dalton" = "tomato1",
    "Lazenby" = "tomato2",
    "Moore" = "tomato3")))

(g4 = g + scale_colour_grey())

## ----tidy=FALSE---------------------------------------------------------------
library("grid")
vplayout = function(x, y) 
  viewport(layout.pos.row = x, layout.pos.col = y)

## -----------------------------------------------------------------------------
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 2)))

print(g1, vp = vplayout(1, 1:2))
print(g2, vp = vplayout(2, 1))
print(g3, vp = vplayout(2, 2))

