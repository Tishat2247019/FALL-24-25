data <- read.csv("E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/FINAL/Final Lab Task 1/Dataset/healthcare-dataset-stroke-data.csv", header=TRUE, sep=',',na.strings = c("N/A", ""))
print(data)
no_of_col <- ncol(data)
no_of_row <- nrow(data)
cat("No of row in the dataset: ", no_of_row) 
cat("No of column in the dataset: ", no_of_col) 
str(data) 

data$stroke <- as.factor(data$stroke)

colSums(is.na(data));
which(is.na(data$bmi))
which(is.na(data), arr.ind=TRUE)

data <- na.omit(data)
no_of_col1 <- ncol(data)
no_of_row1 <- nrow(data)
cat("No of row in the dataset: ", no_of_row1) 
cat("No of column in the dataset: ", no_of_col1) 


#ANOVA for id
##############################
install.packages("dplyr") 
library(dplyr) 
anova_result <- aov(id ~ stroke, data = data)
summary(anova_result)

#pr(>F) is greater than 0.05. so these two attribute has no strong relationship



#chi square method for gender
########################

# Create a contingency table
contingency_table_gender <- table(data$gender, data$stroke)
# View the table
print(contingency_table_gender)
# Perform Chi-Square Test
chi_square_result_gender <- chisq.test(contingency_table_gender)
# View the result
print(chi_square_result_gender)



table_data <- as.data.frame(contingency_table_gender)
colnames(table_data) <- c("Gender", "Stroke", "Freq")

# Load the ggplot2 library if not already loaded
library(ggplot2)

# Create the heatmap
ggplot(table_data, aes(x = Gender, y = Stroke, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(title = "Heatmap of Gender vs Stroke", x = "Gender", y = "Stroke")



#anova for age
##########################
anova_result_age <- aov(age ~ stroke, data = data)
summary(anova_result_age)


#kendalls for age
###############################
categorical_numeric <- as.numeric(data$stroke)
kendall_tau <- cor( data$age,categorical_numeric, method = "kendall")
# Output the result
print(kendall_tau)
#tau = 0.2050 so, Weak positive correlation.



#chi squre for hypertension
##############################
data$hypertension<- as.factor(data$hypertension)

# Create a contingency table
contingency_table_hypertension <- table(data$hypertension, data$stroke)

# View the table
print(contingency_table_hypertension)

# Perform Chi-Square Test
chi_square_result_hypertension <- chisq.test(contingency_table_hypertension)

# View the result
print(chi_square_result_hypertension)


#mutual information for heart_desease
########################################
install.packages("infotheo")

# Load the package
library(infotheo)

data$heart_disease<- as.factor(data$heart_disease)

mi_result <- mutinformation(data$heart_disease, data$stroke)
mi_result


# MI > 0: There is some dependence between the variables (information is shared).
# Higher MI values indicate a stronger relationship between the variables.
# For example:
#   
#   If mi_result returns 0.6, it indicates that there is a moderate amount of shared 
# information between the categorical input and output variables. 
# This means that knowing the value of the input reduces the uncertainty 
# about the output to some extent, but it's not a perfect prediction.




#chi squre for ever_married
##############################
data$ever_married<- as.factor(data$ever_married)

# Create a contingency table
contingency_table_ever_married <- table(data$ever_married, data$stroke)

# View the table
print(contingency_table_ever_married)

# Perform Chi-Square Test
chi_square_result_hypertension_ever_married <- chisq.test(contingency_table_ever_married)

# View the result
print(chi_square_result_hypertension_ever_married)



#mutual information for work_type
########################################

data$work_type<- as.factor(data$work_type)

mi_result_work_type <- mutinformation(data$work_type, data$stroke)
mi_result_work_type





#chi squre for residence_type
##############################
data$Residence_type<- as.factor(data$Residence_type)

# Create a contingency table
contingency_table_residence_type <- table(data$Residence_type, data$stroke)

# View the table
print(contingency_table_residence_type)

# Perform Chi-Square Test
chi_square_result_hypertension_residence_type <- chisq.test(contingency_table_residence_type)

# View the result
print(chi_square_result_hypertension_residence_type)



#ANOVA for avg_glucose_level
##############################

anova_result_avg_glucose_level <- aov(avg_glucose_level ~ stroke, data = data)
summary(anova_result_avg_glucose_level)


#ANOVA for bmi
##############################

anova_result_bmi <- aov(bmi ~ stroke, data = data)
summary(anova_result_bmi)


#chi squre for smoking_status
##############################
data$smoking_status<- as.factor(data$smoking_status)

# Create a contingency table
contingency_table_smoking_status <- table(data$smoking_status, data$stroke)

# View the table
print(contingency_table_smoking_status)

# Perform Chi-Square Test
chi_square_result_smoking_status <- chisq.test(contingency_table_smoking_status)

# View the result
print(chi_square_result_smoking_status)
