library(tigerstats)

# from summary data
proptestGC(x=c(383.18),n=c(2254),
           p=0.38,conf.level=0.95,graph=TRUE)

proptestGC(x=c(111,143),n=c(181,302),
           p=0,conf.level=0.95,graph=TRUE)




# from a loaded dataset
students <- m111survey
proptestGC(~sex,data=students, success="yes",p=0, graph=TRUE)