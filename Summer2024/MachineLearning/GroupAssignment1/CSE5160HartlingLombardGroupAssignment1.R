library(ISLR2)
Auto <- ISLR2::Auto

# 8a
linearModel <- lm(mpg ~ horsepower, data=Auto)
summary(linearModel)

predict(linearModel, data.frame(horsepower = 98), interval = "confidence")
predict(linearModel, data.frame(horsepower = 98), interval = "prediction")

# 8b
plot(Auto$horsepower, Auto$mpg)
abline(linearModel)

# 8c
par(mfrow=c(2,2))
plot(linearModel)