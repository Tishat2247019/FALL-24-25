data <- read.csv("E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/FINAL/Final Lab Task 2/Dataset/healthcare-dataset-stroke-data.csv", header=TRUE, sep=',',na.strings = c("N/A", ""))
print(data)
no_of_col <- ncol(data)
no_of_row <- nrow(data)
cat("No of row in the dataset: ", no_of_row) 
cat("No of column in the dataset: ", no_of_col) 
str(data) 

colSums(is.na(data));
data <- na.omit(data)


install.packages("rcompanion")
library(rcompanion) 


plotNormalHistogram(data$age, 
                    main = "Line Histogram of Age Attribute", 
                    xlab = "Age", 
                    prob = FALSE)  

skewness_value_age <- skewness(data$age)
print(paste("Skewness:", skewness_value_age))

if (skewness_value_age > 0) {
  skewness_type_age <- "Positive"
} else if (skewness_value_age < 0) {
  skewness_type_age <- "Negative"
} else {
  skewness_type_age <- "Zero"
}

print(paste("The data is", skewness_type_age, "skewed."))


plotNormalHistogram(data$age, 
                    main = "Line Histogram of Age Attribute", 
                    xlab = "Age", 
                    prob = FALSE)  

text(x = max(data$age) * 0.7, y = max(table(data$age)) * 0.8, 
     labels = paste("Skewness:", round(skewness_value_age, 3), "\n", skewness_type_age, "Skewness"), 
     col = "red", cex = 0.8)




plotNormalHistogram(data$avg_glucose_level, 
                    main = "Line Histogram of Avg_glucose_level Attribute", 
                    xlab = "Avg_glucose_level", 
                    prob = FALSE)

skewness_value_avg_glucose_level<- skewness(data$avg_glucose_level)
print(paste("Skewness:", skewness_value_avg_glucose_level))

if (skewness_value_avg_glucose_level > 0) {
  skewness_type_avg_glucose_level <- "Positive"
} else if (skewness_value_avg_glucose_level < 0) {
  skewness_type_avg_glucose_level <- "Negative"
} else {
  skewness_type_avg_glucose_level <- "Zero"
}

print(paste("The data is", skewness_type_avg_glucose_level, "skewed."))


plotNormalHistogram(data$avg_glucose_level, 
                    main = "Line Histogram of Avg_glucose_level Attribute", 
                    xlab = "Avg_glucose_level", 
                    prob = FALSE)

text(x = max(data$avg_glucose_level) * 0.7, y = max(table(data$avg_glucose_level)) * 0.8, 
     labels = paste("Skewness:", round(skewness_value_avg_glucose_level, 3), "\n", skewness_type_avg_glucose_level, "Skewness"), 
     col = "red", cex = 0.8)




gender_counts <- table(data$gender)
barplot(gender_counts, xlab = "Gender", ylab = "Frequency", main = "Bar Graph for Gender Attribute")



work_type_counts <- table(data$work_type)
barplot(work_type_counts, xlab = "work_type", ylab = "Frequency", 
        main = "Bar Graph for work_type Attribute", cex.names = 0.80)  


smoking_status_counts <- table(data$smoking_status)

barplot(smoking_status_counts, xlab = "smoking_status", ylab = "Frequency", 
        main = "Bar Graph for smoking_status Attribute", cex.names = 0.80)





boxplot(data$avg_glucose_level, 
        main = "Box Plot for Average Glucose Level", 
        ylab = "Avg Glucose Level",
        col = "lightblue", 
        border = "black")




boxplot(data$bmi, 
        main = "Box Plot for bmi", 
        ylab = "bmi",
        col = "lightblue", 
        border = "black")








plot(data$age, data$avg_glucose_level, 
     main = "Scatterplot of Age vs Avg Glucose Level", 
     xlab = "Age", 
     ylab = "Avg Glucose Level", 
     col = ifelse(data$stroke == 1, "red", "blue"), 
     pch = 19)

legend("topleft", 
       legend = c("Stroke", "No Stroke"), 
       col = c("red", "blue"), 
       pch = 19)


plot(data$age, data$bmi, 
     main = "Scatterplot of Age vs BMI by Stroke Status", 
     xlab = "Age", 
     ylab = "BMI", 
     col = ifelse(data$stroke == 1, "red", "blue"), 
     pch = 19, ) 

AAlegend("topright", 
       legend = c("Stroke", "No Stroke"), 
       col = c("red", "blue"), 
       pch = 19)



install.packages("ggplot2")
library(ggplot2)


ggplot(data, aes(x = as.factor(stroke), y = age, fill = as.factor(stroke))) +
  geom_violin(trim = FALSE) + 
  geom_boxplot(width = 0.2, position = position_dodge(0.9), outlier.shape = NA)+
  labs(title = "Violin Plot of Age by Stroke",
       x = "Stroke (0 = No, 1 = Yes)",
       y = "Age") +
  scale_fill_manual(values = c("blue", "red"), labels = c("No Stroke", "Stroke")) + 
  theme_minimal()


ggplot(data, aes(x = smoking_status, y = avg_glucose_level, fill = smoking_status)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.2, position = position_dodge(0.9), outlier.shape = NA) +
  labs(title = "Violin Plot with Boxplot of Avg Glucose Level by Smoking Status",
       x = "Smoking Status",
       y = "Avg Glucose Level") +
  scale_fill_brewer(palette = "Set3") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


ggplot(data, aes(x = as.factor(stroke), y = avg_glucose_level, fill = as.factor(stroke))) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.2, position = position_dodge(0.9), outlier.shape = NA) +
  labs(title = "Violin Plot with Boxplot of Avg Glucose Level by Stroke",
       x = "Stroke (0 = No, 1 = Yes)",
       y = "Avg Glucose Level",
       fill = "Stroke") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


install.packages("ggplot2")
library(ggplot2)


ggplot(data, aes(x = age, y = avg_glucose_level)) +
  geom_line(stat = "summary", fun = "mean", color = "blue") + 
  labs(title = "Line Plot of Avg Glucose Level by Age",
       x = "Age",
       y = "Avg Glucose Level") +
  theme_minimal()

ggplot(data, aes(x = age, y = bmi)) +
  geom_line(stat = "summary", fun = "mean", color = "blue") + 
  labs(title = "Line Plot of bmi by Age",
       x = "Age",
       y = "bmi") +
  theme_minimal()

