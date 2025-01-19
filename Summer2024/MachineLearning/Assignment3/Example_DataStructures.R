#Vector: store an ordered set of values called elements
subject_name <- c("Jone Doe", "Jone Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)
temperature[2]
temperature[2:3]
temperature[-2]
temperature[c(TRUE, TRUE, FALSE)]

#Factor: 
#a special case of vector solely used to represent nominal variables
gender <- factor(c("MALE", "FEMALE", "MALE"))
blood <- factor(c("O", "AB", "A"), levels = c("A", "B", "AB", "O"))
blood

#List: used to store an ordered est of values. 
#Unlike a vector that requires all elements to be of the same type, 
#a list allow different types of values to be collected.
# based on the vectors we created, we already have
subject_name[1] 
temperature[1]
flu_status[1]
gender[1]
blood[1]
#we can use LIST data structure to group all of a patient's data into one object
subject1 <- list(fullname = subject_name[1], 
                 temp=temperature[1],
                 flu_status=flu_status[1],
                 gender = gender[1],
                 blood=blood[1])
subject1$fullname
subject1[1]
subject1$temp
subject1[2]
subject1$blood
subject1[5]

#Data frame: a list of vectors
#we can construct a data frame using funciton data.frame() and existing vectors
pt_data <- data.frame(subject_name, temperature, flu_status, gender, blood, stringsAsFactors = FALSE)
#additional parameter stringAsFactors indicates whether to automatically convert every charactor vector to a factor. 
#Here subject_name is not a factor, so stringAsFactors = FALSE  
pt_data
pt_data$subject_name
pt_data[c("temperature", "flu_status")]
pt_data[1,2]
pt_data[c(1,3),c(2,4)]
pt_data[c(1,3), c("temlperature", "gender")]
pt_data[, 1]
pt_data[2,]
pt_data[-1,]
pt_data[, -5]

