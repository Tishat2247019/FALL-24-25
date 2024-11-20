patientID <- c(1, 2, 3, 4)
age <- c(25, 24, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor","improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
write.csv(patientdata,"C:/Users/student/Desktop/csv_write/data_frmae.csv")

#adding a new column in a data frame
# we can do this by the dollar sign as well as by using the
# base funtion cbind

# patientdata$bloodGrop <- c("A+", "B+", "AB+", "O")

bloodGroup <- c("A+", "B+", "AB+", "O")
new_patientdata <- cbind(patientdata, bloodGroup)
new_patientdata

#adding new row in a data frame
new_row <- c(5, 33, "Type2", "improve", "A+")
new_patientdata <- rbind(new_patientdata, new_row);
new_patientdata

#printing the dataframe using attribute ame

new_patientdata[c("diabetes","status")]

#Factor

#list
#A list in R can contain many different data types

g <- "My First List"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow = 5)
k <- c("one", "two", "three")
mylist <- list(title = g, ages = h, j, k)

mylist[[2]]

#for user input
#we will use readline and scan function
#in readling function, by default value will be in string

var1 = readline(prompt = "Enter any value : ")
var2 <- readline(prompt = "Enter any number : ")

var2 <- as.integer(var2) # to convert the string type input data, we used the as.ineger function
print(var1)
print(var2)

#scan function
#This method reads data in theform of a vector or list
#This method can be used to read input from a file as well
#scan() method takes input continously. Press Enter key twice to terminate the input

xx = scan()
print(xx)

#for stirng input or any other type input, use the what keyword

xxx = scan(what = "")
print(xxx)

mydata <-data.frame(age = numeric(0), gender =  character(0), weight=numeric(0))
mydata <- edit(mydata)

#to write the data in a csv file
write.csv(mydata,"C:/Users/student/Desktop/csv_write/new.csv") 
#to reate a csv file
myread <- read.csv("C:/Users/student/Desktop/csv_read/iris.csv", header = TRUE, sep=",") 
myread[5:10,]

#accessing spcefic row
myread[c(5, 7),]
myread$sepal.length
subset(myread,variety=="Setosa") # print only for the species Setosa
subset(myread,sepal.length >= 5) # print only for the sepal.length value greater than 5
