
wbcd <- read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vR-MnP-EVeDpnrJoPy9LLbCrJ14uKbMAddLL6NdPhWvjXi32WvmpG9ab5gytnp6QJUuIXb_aJpHu73C/pub?output=csv", header=TRUE)


names(wbcd)
summary(wbcd)
str(wbcd)  
wbcd <- wbcd[, -33]


wbcd = wbcd[, -1] 
str(wbcd)   
names(wbcd)

dim(wbcd)


x = c(1, 2, 3, 4, 5)
x.normalized = (x - min(x)) / (max(x) - min(x))
x.normalized
# Define function normalize: 
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
y = c(2, 3, 4, 5, 6)
y.n = normalize(y)
y.n

# Continue the application on breast cancer analysis
summary(wbcd)
# Get X by excluding the diagnosis (removing column 1)
wbcd.X = subset(wbcd, select = -1)
summary(wbcd.X)
dim(wbcd.X)
# Normalize X so all attributes contribute equally in calculating distance
wbcd_X.normalized = as.data.frame(lapply(wbcd.X, normalize))
summary(wbcd_X.normalized)

# STEP 3: Split data into training and test sets
# Training the model on the data
training.X = wbcd_X.normalized[1:350, ]
test.X = wbcd_X.normalized[351:569, ]
# Here first 350 data points are used for training, the others are used for test/validation
train.Y = wbcd[1:350, 1]
test.Y = wbcd[351:569, 1] 
# Important to install the package that has knn function
install.packages("class")
library("class")
help("knn")
dim(wbcd)

# KNN use majority votes for classification, and breaks a tie at random
# To avoid randomness and make the results reproducible, set a seed before training 
set.seed(1)

# STEP 4: Train the model and evaluate performance for K ranging from 1 to 21
errors <- c()

for (k in 1:21) {
  wbcd.pred = knn(training.X, test.X, train.Y, k)
  err = mean(wbcd.pred != test.Y)
  errors <- c(errors, err)
}

# Display errors for each K
errors

# Find the best K with the minimum error
best_k <- which.min(errors)
cat("The best K is:", best_k, "with an error rate of:", min(errors), "\n")

# Vector for K
K <- c(1:21)

# Plot the curve of test error vs. 1/K
pdf("test_error_vs_1_over_K.pdf")
plot(1/K, errors, type="b", xlab="1/K", ylab="Test Error", main="Test Error vs. 1/K")
dev.off()

# Plot the curve of test error vs. K
pdf("test_error_vs_K.pdf")
plot(K, errors, type="b", xlab="K", ylab="Test Error", main="Test Error vs. K")
dev.off()
