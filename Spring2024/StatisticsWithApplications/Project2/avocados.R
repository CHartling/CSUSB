# Import libraries
library(tigerstats)
library(googlesheets4)
library(ggplot2)
library(ggformula)
library(mosaic)

# Load data set
linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vQ89BumTRUMK_26rQtvSN864GTamfvj-5S7UPk6o3TyuCHzNCPvBtYbv76E06B2GLmRkEvvCE5sGNEw/pub?gid=1466217566&single=true&output=csv"
avo <- read.csv(linktocsv, head=TRUE)
avo

# Histograms
gf_histogram(~TotalVolume, data = avo)
gf_histogram(~AveragePrice, data = avo)

# regression predicting MPG from cars' weight
lmGC(TotalVolume ~ AveragePrice, data = avo, graph = TRUE)

# slope test
summary(lm(TotalVolume ~ AveragePrice, data = avo))