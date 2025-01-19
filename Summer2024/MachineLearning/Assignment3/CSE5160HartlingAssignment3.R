# 1. type the commands to create the following 3 vectors
student_name <- c("Mike A", "Joy B", "Kate C", "Jose D")
student_ID <- c(00123, 00124, 00125, 00126)
GPA <- c(3.1, 2.9, 3.6, 3.3)

# 2. type the command to create the factor with the name of gender
gender <- factor(c("MALE", "MALE", "FEMALE", "MALE"))

# 3. type the command to create a frame with the name of "students", consisting of the above 3 vectors and 1 factor
students <- data.frame(student_name, student_ID, GPA, gender, stringsAsFactors = FALSE)

# 4. type the command to create the following list with the name of stu_4
stu_4 <- list(student_name = "Maria E", student_ID = "00130", GPA = 3.9,  gender = "FEMALE")

# 5. type the commend to append the list of "stu_4" to the last row of data frame of "students"
students <- rbind(students, stu_4)

# 6. type the command to display the number of rows and columns in the data frame of "students"
dim(students)

# 7. type the command to display the access rows 1 and 2 only in the data frame
print(students[1:2,])

# 8. type the command to display the column "gender"
print(students[['gender']])