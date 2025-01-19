# 5 (x,y) data points: (43, 41), (44, 45), (45, 49), (46, 47), (47, 44) 
data<- data.frame(x=c(43,44,45,46,47,43.5,44.5,46.5), y=c(41,45,49,47,44,42,46,48))
# plot this original dataset
plot(data$x,data$y)

# fit the data with a linear model
linearModel <- lm(y~x, data=data)
# display the details, e.g. coefficients of the linear model
linearModel
# generate  x sequence from 43 to 47 with increment 0.1
xValues <- seq(43,47,0.1)
# predicted output y for the linear model
yPredict <-predict(linearModel, list(x=xValues))
# plot original x and y
plot(data$x,data$y)
# plot the linear line 
lines(xValues, yPredict, col='red')

#generate variable x2 as squared x 
data$x2 <-data$x^2
# fit the data with a quadratic model
quadraticModel <-lm(y~x+x2, data=data)
# display details of the fitted qudratic model
quadraticModel
#generate a sequence of x from 43 to 47 with increment 0.1
# (already generated in the first part of code, can be removed)
xValues <- seq(43,47,0.1)
#predicted output y of the quadraticModel, given xValues
yPredict <-predict(quadraticModel, list(x=xValues, x2=xValues^2))
# plot original x and y
plot(data$x,data$y)
# plot the qudratic model in blue line
lines(xValues, yPredict, col='blue')
