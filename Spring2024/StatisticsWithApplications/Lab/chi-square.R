## Example 6.41 using rbind

library(tigerstats)

setwd("C:/Users/cbhar/OneDrive/Desktop/School/CSUSB/Classes/Spring2024/StatisticsWithApplications/Lab")
sampleQ <- read.csv("stats6_36.csv")

#create the table with rbind function
diabetes <- rbind(should=c(264,299,351),shouldnot=c(38,55,77),dontknow=c(16,15,22))
colnames(diabetes) <- c("Republican","Democrats","Independant")

#check the table
diabetes

#perform the test
chisqtestGC(diabetes,graph=TRUE)
chisqtestGC(sampleQ,graph=TRUE)
