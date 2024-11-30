# switch(2, "red", "green", "blue")
# 
# switch("shape", "color" = "red", "shape" = "square" , "length" = 5)
# 
# i <- 1
# while (i < 6){
#   print(i)
#   i <- i + 1
# }
# 
# i <- 1
# while (i < 6){
#   i <- i + 1
#   print("I love coding")
#   print(i)
#   if ( i == 4){
#     break;
#   }
# }
# 
# i <- 0
# while (i < 6){
#   i <- i + 1
#   if (i == 3){
#     next
#   }
#   print(i)
# }
# 
# for (x in 1 : 10){
#   if (x == 5){
#     next
#   }
#   print(x)
# }

for (x in 1 : 10){
  x <- x + 1
  print(x)
  print ("----")
  print(x)
}

for (x in 1 : 2){
  for (y in 1 : 3){
    print(x * y)
  }
}

# myfunction <- function (arg1, arg2, ){
#   statements
#   reutnr(object)
# }

add_number <- function(a, b){
  sum <- a +b
  return (sum)
}

print(add_number(4, 5))

#R data structure
# Vectors
# Matrices
# Arrays
# Data Frames
# Fators

# Vectors : Vectors are onedimensional arrays that can hold numeric data, 
#character data, or logical 
# data. The combine function c() is used to form the vector
# only one data type for one vector object
# vector is a one dimensional array 

# a <- c(1, 2, 5, 3, 6, -2, 4) numeric vector
# b < c("one", "two", "three")
# c <- c(TRUE, TRUE, FALSE, FALSE)

a <- c(1, 2, 5, 3, 6, -2, 4)
sum(a) # access all the elements of the vector
min(a)
max(a)

b <- c("one", "two", "three")
b # access all the elements of the vector
min(b)

# name <- "Hello world" 
# Here hello world is stored as a single character stirng. How can we store both the first
# and last name separatly in a single object
# 
# The function c() concatenates or combines single R objects into a vector of R objects

Name <- c("hello", "world")
nchar(Name) # output wil be 5, 5

# Sort a vector
# To sort a vector alphabetically or numerically, use the sort() function

X <- c(20, 10, 40, 15)
sort(X,  decreasing = TRUE) # sort in descending order

# Access Vector
# we can access the vector items by referring to its index number inside brackets[].
# the first item has index 1 and second item has index 2 and so on

xx <- c(20, 10, 40,15)
xx[1:2] # printing consecutive values of vector
xx[c(1, 3)] # printing of specific values of vector

for (i in 1 : length(xx)){
  print(xx[i])
}
x[1]
xx <- c(20, 10, 40,15)
for (i in 2 : 3){
  print(xx[i])
}


#Matrices
# A Matrix is a two-dimensional array where each element has the same mode(numric, character,
# or logical).
# mymatric <- matrix(vector,nrow= no_of_rows, ncol = no_of_column, byrow = logical_value, dimnanmes = 
# list(char_vector_rownames, char_vector_columnsnames))
# by default , column wise fill up of elements (byrow = FALSE)

mymatrix <- matrix (1 : 20, nrow = 5, ncol= 4)
mymatrix

mymatrix1 <- matrix (1 : 20, nrow = 5, ncol= 4,byrow = FALSE, dimname = list(c("row1", "row2","row3","row4","row5"), c("col1","col2", "col3", "col4")))
mymatrix1
mymatrix1[, 3:4]
mymatrix1[1,c(3, 4)]
mymatrix1[c(1, 2),4]

myarray <-array(1 : 24, c (2, 3,5))
myarray
myarray[1, 2,1]

# # Data Frmae
# # A data frame is more generalt thatn a matrix in that different columns can contian different
# modes of data(numeric, character, etc.). It's similar to datasets you'd typpically seen SAS,
# SPSS, ans stata. Data frames are the most common data structure you ull deal with in R.

# A data frame is created with the data.frame() function:

patientID <- c(1, 2, 3, 4)
age <- c(25, 24, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor","improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
