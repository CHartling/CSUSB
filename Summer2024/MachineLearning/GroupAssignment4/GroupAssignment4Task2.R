# Group Assignment 4: Task 2
library(e1071)
library(ROCR)
library(ISLR2)
wbcd <- read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vR-MnP-EVeDpnrJoPy9LLbCrJ14uKbMAddLL6NdPhWvjXi32WvmpG9ab5gytnp6QJUuIXb_aJpHu73C/pub?output=csv", header=TRUE)

wbcd <- wbcd[, -1]
wbcd$diagnosis <- as.character(wbcd$diagnosis)


wbcd$diagnosis <- as.factor(ifelse(wbcd$diagnosis == "M", 1, 0))

set.seed(1)
sample_index <- sample(seq_len(nrow(wbcd)), size = floor(0.6144 * nrow(wbcd)))

wbcdTrain <- wbcd[sample_index, ]
wbcdTest <- wbcd[-sample_index, ]

trainX <- scale(wbcdTrain[, -1])
testX <- scale(wbcdTest[, -1], center = attr(trainX, "scaled:center"), 
               scale = attr(trainX, "scaled:scale"))

trainY <- wbcdTrain$diagnosis
testY <- wbcdTest$diagnosis


dat <- data.frame(x = trainX, y = as.factor(trainY))
out <- svm(y ~ ., data = dat, kernel = "linear", cost = 10)
summary(out)
table(out$fitted, dat$y)

dat.te <- data.frame(x = testX, y = as.factor(testY))
pred.te <- predict(out, newdata = dat.te)
table(pred.te, dat.te$y)