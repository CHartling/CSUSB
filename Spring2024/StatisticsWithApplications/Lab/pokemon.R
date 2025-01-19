linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vTyGgp4Pdt8diSAiJ0MD4WzyRdGMojMePO9DHreNWczPoDYOzWDGRB4MqrQLtC-ytcWb7QozkhYPmQc/pub?output=csv"

library(ggplot2)
library(ggformula)
library(mosaic)

pokemon <- read.csv(linktocsv, head=TRUE)

#pokemon

#arrange(pokemon, Name)

gf_bar(~Type1,data = pokemon)
gf_bar(~Type2,data = pokemon)
gf_boxplot(Total~Type1, data = pokemon)
gf_boxplot(Total~Type2, data = pokemon)
