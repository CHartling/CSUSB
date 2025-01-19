### One-Sample t-Tests
library("tigerstats")


## Summary Data Example
ttestGC(mean=124.32,sd=37.74,n=52, mu=35, alternative="two.sided",graph=TRUE)

 
## Dataset Example
linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vQlenHjt3tpxmfVgYUgDr0OVss_BrsintAOZ3zV0yIWm0dv1ApCTVpOrcTzTq3tzsuR549yA1ynUXFb/pub?gid=0&single=true&output=csv"
movies <- read.csv(linktocsv, head=TRUE)

#checking histogram of Audience Scores
histogram(~Audience.Score, data=movies)

#testing if average Audience Score rating is 50
ttestGC(~Audience.Score,data=movies,mu=50, alternative="two.sided",graph=TRUE)

ttestGC(~Audience.Score,data=movies,mu=50, alternative="two.sided",graph=TRUE)