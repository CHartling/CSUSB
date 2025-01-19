library("tigerstats")
library(datasets)

# Iris flower dataset
flowers <- iris

histogram(~Petal.Width | Species, data = flowers)

gf_boxplot(Petal.Width ~ Species, data = flowers)

oneway.test(Petal.Width ~ Species, data = flowers)
