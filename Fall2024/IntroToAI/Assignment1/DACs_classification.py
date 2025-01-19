#Step 1:
# Import libraries
# In this section, you can use a search engine to look for the functions that will help you implement the following steps
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, accuracy_score

#Step 2:
# Load dataset and show basic statistics
dac = pd.read_csv('disadvantaged_communities.csv')

# 1. Show dataset size (dimensions)
print(dac.shape)

# 2. Show what column names exist for the 49 attributes in the dataset
col = []
for row in dac:
    col.append(row)
print(col)

# 3. Show the distribution of the target class CES 4.0 Percentile Range column
# 4. Show the percentage distribution of the target class CES 4.0 Percentile Range column



# Step 3:
#Clean the dataset - you can eitherhandle the missing values in the dataset
# with the mean of the columns attributes or remove rows the have missing values.
dac.dropna(inplace = True)

# Step 4: 
#Encode the Categorical Variables - Using OrdinalEncoder from the category_encoders library to encode categorical variables as ordinal integers
from sklearn.preprocessing import OrdinalEncoder
enc = OrdinalEncoder()
dac[["CES 4.0 Percentile Range","DAC category"]] = enc.fit_transform(dac[["CES 4.0 Percentile Range","DAC category"]])


# Step 5: 
# Separate predictor variables from the target variable (attributes (X) and target variable (y) as we did in the class)
# Create train and test splits for model development. Use the 80% and 20% split ratio
# Use stratifying (stratify=y) to ensure class balance in train/test splits
# Name them as X_train, X_test, y_train, and y_test
X = dac.iloc[:, 11:]
y = dac.iloc[:, 9]
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0, stratify = y)


# Do not do steps 6 - 8 for the Ramdom Forest Model
# Step 6:
# Standardize the features (Import StandardScaler here)
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.fit_transform(X_test)


# Step 7:
# Below is the code to convert X_train and X_test into data frames for the next steps
cols = X_train[0]
X_train = pd.DataFrame(X_train, columns=[cols])
X_test = pd.DataFrame(X_test, columns=[cols])



# Step 8 - Build and train the SVM classifier
# Train SVM with the following parameters. (use the parameters with the highest accuracy for the model)
   #    1. RBF kernel
   #    2. C=10.0 (Higher value of C means fewer outliers)
   #    3. gamma = 0.3 (Linear)
from sklearn.svm import SVC
svc_model = SVC(kernel = 'rbf', random_state = 0, C = 10.0, gamma = 0.3)
svc_model.fit(X_train, y_train)

# Test the above developed SVC on unseen disadvantaged communities dataset samples
y_pred = svc_model.predict(X_test)


# compute and print accuracy score
print("Accuracy Score: ", accuracy_score(y_test, y_pred))


# Save your SVC model (whatever name you have given your model) as .sav to upload with your submission
# You can use the library pickle to save and load your model for this assignment
import pickle
with open("svc_model.sav", "wb") as file: 
    pickle.dump(svc_model, file)


# Optional: You can print test results of your model here if you want. Otherwise implement them in evaluation.py file
# Get and print confusion matrix
cm = confusion_matrix(y_test, y_pred)

# Below are the metrics for computing classification accuracy, precision, recall and specificity
TP = cm[0][0]
TN = cm[1][1]
FP = cm[0][1]
FN = cm[1][0]

# Compute Precision and use the following line to print it
precision = TP / (TP + FP)
print('Precision : {0:0.3f}'.format(precision))

# Compute Recall and use the following line to print it
recall = TP / (TP + FN)
print('Recall or Sensitivity : {0:0.3f}'.format(recall))

# Compute Specificity and use the following line to print it
specificity = TN / (TN + FP)
print('Specificity : {0:0.3f}'.format(specificity))






# Step 9: Build and train the Random Forest classifier
# Train Random Forest  with the following parameters.
# (n_estimators=10, random_state=0)
from sklearn.ensemble import RandomForestClassifier
rf = RandomForestClassifier(n_estimators = 10, random_state=0) 
rf.fit(X_train, y_train)
y_pred = rf.predict(X_test)

# Test the above developed Random Forest model on unseen DACs dataset samples

# compute and print accuracy score
print("Accuracy Score: ", accuracy_score(y_test, y_pred))

# Save your Random Forest model (whatever name you have given your model) as .sav to upload with your submission
# You can use the library pickle to save and load your model for this assignment
with open("rf_model.sav", "wb") as file: 
    pickle.dump(rf, file)


# Optional: You can print test results of your model here if you want. Otherwise implement them in evaluation.py file
# Get and print confusion matrix
cm = confusion_matrix(y_test, y_pred)
# Below are the metrics for computing classification accuracy, precision, recall and specificity
TP = cm[0][0]
TN = cm[1][1]
FP = cm[0][1]
FN = cm[1][0]


# Compute Classification Accuracy and use the following line to print it
classification_accuracy = (TP + TN) / (TP + TN + FP + FN)
print('Classification accuracy : {0:0.4f}'.format(classification_accuracy))

# Compute Precision and use the following line to print it
precision = TP / (TP + FP)
print('Precision : {0:0.3f}'.format(precision))

# Compute Recall and use the following line to print it
recall = TP / (TP + FN)
print('Recall or Sensitivity : {0:0.3f}'.format(recall))

# Compute Specificity and use the following line to print it
specificity = TN / (TN + FP)
print('Specificity : {0:0.3f}'.format(specificity))