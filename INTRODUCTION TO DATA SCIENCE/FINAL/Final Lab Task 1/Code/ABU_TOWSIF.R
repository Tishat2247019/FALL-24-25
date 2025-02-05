data <- read.csv("E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/FINAL/Final Lab Task 1/Dataset/healthcare-dataset-stroke-data.csv", header=TRUE, sep=',',na.strings = c("N/A", ""))
print(data)
no_of_col <- ncol(data)
no_of_row <- nrow(data)
cat("No of row in the dataset: ", no_of_row) 
cat("No of column in the dataset: ", no_of_col) 
str(data) 


colSums(is.na(data));
data <- na.omit(data)

no_of_col1 <- ncol(data)
no_of_row1 <- nrow(data)
cat("No of row in the dataset: ", no_of_row1) 
cat("No of column in the dataset: ", no_of_col1) 

data$stroke <- as.factor(data$stroke)


install.packages("dplyr") 
library(dplyr) 
anova_result_id <- aov(id ~ stroke, data = data)
summary(anova_result_id)


contingency_table_gender <- table(data$gender, data$stroke)
print(contingency_table_gender)
chi_square_result_gender <- chisq.test(contingency_table_gender)
print(chi_square_result_gender)


anova_result_age <- aov(age ~ stroke, data = data)
summary(anova_result_age)


categorical_numeric <- as.numeric(data$stroke)
kendall_tau <- cor( data$age,categorical_numeric, method = "kendall")
print(kendall_tau)


data$hypertension<- as.factor(data$hypertension)
contingency_table_hypertension <- table(data$hypertension, data$stroke)
print(contingency_table_hypertension)
chi_square_result_hypertension <- chisq.test(contingency_table_hypertension)
print(chi_square_result_hypertension)



install.packages("infotheo")
library(infotheo)
data$heart_disease<- as.factor(data$heart_disease)
mi_result <- mutinformation(data$heart_disease, data$stroke)
mi_result



data$ever_married<- as.factor(data$ever_married)
contingency_table_ever_married <- table(data$ever_married, data$stroke)
print(contingency_table_ever_married)
chi_square_result_hypertension_ever_married <- chisq.test(contingency_table_ever_married)
print(chi_square_result_hypertension_ever_married)



data$work_type<- as.factor(data$work_type)
mi_result_work_type <- mutinformation(data$work_type, data$stroke)
mi_result_work_type


data$Residence_type<- as.factor(data$Residence_type)
contingency_table_residence_type <- table(data$Residence_type, data$stroke)
print(contingency_table_residence_type)
chi_square_result_hypertension_residence_type <- chisq.test(contingency_table_residence_type)
print(chi_square_result_hypertension_residence_type)


anova_result_avg_glucose_level <- aov(avg_glucose_level ~ stroke, data = data)
summary(anova_result_avg_glucose_level)


anova_result_bmi <- aov(bmi ~ stroke, data = data)
summary(anova_result_bmi)


data$smoking_status<- as.factor(data$smoking_status)
contingency_table_smoking_status <- table(data$smoking_status, data$stroke)
print(contingency_table_smoking_status)
chi_square_result_smoking_status <- chisq.test(contingency_table_smoking_status)
print(chi_square_result_smoking_status)

