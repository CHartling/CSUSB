## MTG Project
library(tigerstats)

linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vSfh2maq4XAiTA6mLaTAP1YhjuIxyduS0sY-gYCOKxOg5PuoH4Ny5oAJ32NoOuX0vJcltG9_V4EpC7s/pub?gid=0&single=true&output=csv"
mtg <- read.csv(linktocsv, head=TRUE)

mtg

# Bar Chart
x <- xtabs(~win+land,data=mtg)
x
barchartGC(x,type="count",
           main="Wins by Number of Lands in Opening Hand",
           xlab="Loss(0) or Win(1)")

# Test
