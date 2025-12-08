## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
)

## ----setup, message = FALSE---------------------------------------------------
library(distplyr)
library(distionary)

## ----operators-fn-------------------------------------------------------------
d <- dst_exp(1)
shift(d, 5)

## ----operators-op-------------------------------------------------------------
d + 5

## ----chaining-concise---------------------------------------------------------
10 - 2 * dst_norm(0, 1)

## ----transform-ex-------------------------------------------------------------
d <- dst_exp(1)
shifted <- shift(d, 10)
scaled <- multiply(d, 5)

## ----transform-properties-----------------------------------------------------
range(d)
range(shifted)
range(scaled)

## ----mixture-create-----------------------------------------------------------
dry <- dst_degenerate(0)
rain <- dst_gamma(5, 0.5)
rainfall <- mix(dry, rain, weights = c(0.7, 0.3))

## ----mixture-realize----------------------------------------------------------
set.seed(1)
x <- realize(rainfall, n = 30)
plot(x, ylab = "Rainfall (mm)", xlab = "Day")
lines(x)

## ----simplification-start-----------------------------------------------------
lognormal <- dst_lnorm(meanlog = 2, sdlog = 0.5)
lognormal

## ----simplification-log-------------------------------------------------------
result <- log(lognormal)
result

## -----------------------------------------------------------------------------
maximize(dst_unif(0, 1), dst_unif(4, 10))

## -----------------------------------------------------------------------------
maximize(dst_unif(0, 7), dst_unif(4, 10))

