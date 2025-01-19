### Two-Sample t-Tests
library("tigerstats")
# dataset of college students (preloaded with tigerstats)
# m111survey
linktocsv <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vTqdEm2GIX2qoHb9IO0wpt_58KYVaC46plUTZftMlT2VcOBdGGxH2OYZElsGRHDL1RTakBqT1c-gKru/pub?gid=1016600057&single=true&output=csv"
linktocsv2 <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vTNrNfzOWhgU2OacHTxSBw65B_5_ZnuqaUxPuy3FItILQNIv8a6aszODU9BIFBv75_oZ3GD9YupiM8A/pub?gid=175503276&single=true&output=csv"
adhd <- read.csv(linktocsv, head=TRUE)
animals <- read.csv(linktocsv2, head=TRUE)

animals
adhd

### independent groups

#histomgram for fastest speed ever reached in a car (mph)
histogram(~WRONG,data=animals)
histogram(~NECESSAR,data=animals)
histogram(~D0,data=adhd)
histogram(~D15,data=adhd)

#histogram by gender
histogram(~WRONG|GENDER,data=animals)
histogram(~D0|D15,data=adhd)

# independent samples t-test
ttestGC(WRONG~GENDER, data=animals, mu=0, graph=TRUE)
ttestGC(~D0-D15, data=adhd, mu=0, graph=TRUE)


### paired groups

#histograms for students' heights
histogram(~height,data=m111survey)  # height
histogram(~ideal_ht,data=m111survey) # ideal height
histogram(~ideal_ht - height,data=m111survey) # difference between ideal and actual

#paired samples t-test
ttestGC(~ideal_ht - height, data=m111survey, mu=0, graph=TRUE)
