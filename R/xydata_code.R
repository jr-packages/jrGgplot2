library("tibble")
library("ggplot2")
library("dplyr")
library("png")
logo = readPNG("inst/logo.png")
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
xynorm = round(cbind(x = rnorm(n = 20000, mean = 1000, sd = 700),
                     y = rnorm(n = 20000, mean = 1400, sd = 700)))

xydata = rbind(xynorm, ptsflipped)
n = nrow(xydata)

#reorder rows to hide the data
samp2 = sample(x = 1:n, size = n, replace = FALSE)
xydata = xydata[samp2, ]

xydata = as.tibble(xydata)
save(xydata, file = "data/xydata.RData")
