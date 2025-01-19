library("tigerstats")

# regression predicting MPG from cars' weight
lmGC(mpg ~ wt, data = mtcars, graph = TRUE)

# slope test
summary(lm(mpg ~ wt, data = mtcars))