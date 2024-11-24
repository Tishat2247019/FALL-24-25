#to load the data set(iris data set)
dataset <- read.csv("C:/Users/student/Desktop/November_24_Lab/iris.csv", header=TRUE, sep=',')
# vars <- c("sepalLength", "sepalWidth", "petalLength" , "petalWidth");
# print(dataset[vars]);
print(dataset);


#to display the first 6 instances of the dataset
head(dataset);

dataset$species <- factor(dataset$species, levels = c("setosa", "versicolor", "virginica"), labels = c(1,2,3));
dataset

#for displaying a specific column(attribute)
# dataset[c("sepal_length")]

#to display the summary of the dataset
summary(dataset);

#to diplay the structure of the the dataset
str(dataset);

#to calculate the standard deviation of a specific column(attribute)
s <- dataset$sepal_length;
sd(s) 
#sd function to calculate the standard deviation

library(dplyr);
dataset %>%summarise_if(is.numeric, sd);

#to apply standard deviatoin value for all columns(attributes)
apply(dataset,2,sd);

#will display TRUE value for those , whose values are NA
is.na(dataset); # detect missng values from the dataset

colSums(is.na(dataset)); #to display how many missing values in each attribute(columns)

which(is.na(dataset$sepal_width)) #to display in which row , there is missing values for a specific attribute
which(is.na(dataset$petal_length)) #to display in which row , there is missing values for a specific attribute

remove <- na.omit(dataset); # will delete the instances, whose values are missing
remove
is.na(remove)
remove
