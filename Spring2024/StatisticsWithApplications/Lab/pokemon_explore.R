#install packages
install.packages("ggplot2")
install.packages("ggformula")
install.packages("mosaic")

#load packages
library(ggplot2)
library(ggformula)
library(mosaic)

#load the dataset
linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vTyGgp4Pdt8diSAiJ0MD4WzyRdGMojMePO9DHreNWczPoDYOzWDGRB4MqrQLtC-ytcWb7QozkhYPmQc/pub?output=csv"

#save the dataset
pokemon <- read.csv(linktocsv, head=TRUE)

#descriptive stats for every variable
summary(pokemon)

#descriptive stats for a single variable
favstats(~HitPoints, data = pokemon)

#produce a histogram for one variable
gf_histogram(~HitPoints, data = pokemon)

#produce a scatterplot for two variables
gf_point(Attack ~ Defense, data = pokemon)


