## Options for loading data into R ##

#reading in from a csv file saved on your computer
#specify the location of the folder where your files are
setwd("/Users/daltonmarsh/Downloads")
#read in the file
crimes <- read.csv("CrimeData.csv")
crimes


#loading in from a google sheet published as a csv file
#publish to web as csv first (File > Share > Publish to Web)
linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vSK15eMsCUCug0JboyF6QR8wD7jm2gswxqfhAaXcwlw_aQNxL1CWDRw5fc8_pY5vEfkccfVrUYwD36U/pub?gid=1101450257&single=true&output=csv"
crimes <- read.csv(linktocsv, head=TRUE)
crimes


#loading in directly from a google sheet
install.packages("googlesheets4")
library(googlesheets4)

gs4_deauth()
myTable <- read_sheet("insert URL here")
myTable