# Lab 17

# 1. Choose either the 2011 Movies or the Pokemon data set
# 2. Explore the data set
# 3. Ask some statistical questions
# 4. Try to answer these questions with the methods we have learned.
##### you may want to copy and past code from other .R files on Canvas

# Import libraries
library("tigerstats")
library(datasets)
library(ggplot2)
library(ggformula)
library(mosaic)

# Load data sets
linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vTyGgp4Pdt8diSAiJ0MD4WzyRdGMojMePO9DHreNWczPoDYOzWDGRB4MqrQLtC-ytcWb7QozkhYPmQc/pub?output=csv"
pokemon <- read.csv(linktocsv, head=TRUE)

linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vQlenHjt3tpxmfVgYUgDr0OVss_BrsintAOZ3zV0yIWm0dv1ApCTVpOrcTzTq3tzsuR549yA1ynUXFb/pub?gid=0&single=true&output=csv"
movies <- read.csv(linktocsv, head=TRUE)

# Explore data sets
gf_bar(~Type1,data = pokemon)
gf_bar(~Type2,data = pokemon)
gf_boxplot(Total~Type1, data = pokemon)
gf_boxplot(Total~Type2, data = pokemon)

# Ask statistical questions
histogram(~Total | Type1, data = pokemon)
histogram(~Total | Type2, data = pokemon)

gf_boxplot(Total ~ Type1, data = pokemon)
gf_boxplot(Total ~ Type2, data = pokemon)

histogram(~Generation|HowManyTypes,data=pokemon)
ttestGC(Generation~HowManyTypes, data=pokemon, mu=0, graph=TRUE)