### Normal probabilities ###

#loading tigerstats package
library(tigerstats)

#with defaults N(0,1), lower tail, no graph
pnormGC(1)

#finding percent between 900 and 1300 for N(1100, 200)
pnormGC(bound = c(52.761,54.453), mean=54.030, sd=0.846, 
        region="between", graph=TRUE)

#reversing--finding the values that give a middle 68%
qnormGC(0.95, mean=54.030, sd=0.846, 
        region="between", graph=TRUE)


#Lab 9 Coins
proptestGC(x=4, n=5, p=0.5, graph=TRUE)
proptestGC(x=4, n=10, p=0.5, graph=TRUE)
proptestGC(x=13, n=20, p=0.5, graph=TRUE)
proptestGC(x=1, n=30, p=0.5, graph=TRUE)