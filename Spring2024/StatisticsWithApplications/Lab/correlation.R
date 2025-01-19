library("tigerstats")
library(datasets)

# Iris flower dataset
flowers <- iris

histogram(~Sepal.Length, data=flowers)
histogram(~Sepal.Width, data=flowers)
histogram(~Petal.Length, data=flowers)
histogram(~Sepal.Width, data=flowers)

pairs(flowers)

# include only the numeric variables (vars 1 through 4).
new_flowers <- flowers[c(1:4)]

pairs(new_flowers)

# r values
cor(new_flowers)

# all of it at once
library(GGally)
ggpairs(new_flowers)


## Try exploring some correlations with the 2011 Movies data
linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vQlenHjt3tpxmfVgYUgDr0OVss_BrsintAOZ3zV0yIWm0dv1ApCTVpOrcTzTq3tzsuR549yA1ynUXFb/pub?gid=0&single=true&output=csv"
movies <- read.csv(linktocsv, head=TRUE)
movies

