install.packages("dplyr")
library(dplyr)
install.packages("readxl"); # installing "readxl" library for reading the xlsx files
library(readxl); # importing the xlsx file
dataSet_1 <- read_excel("E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/MID/Mid Term Project/Metarials/Midterm_Dataset_Section(C).xlsx");
# dataSet_1 <- data.frame(dataSet_1)
dataSet_1 # will not display the whole dataset, instead it will dispaly the first 10 or 11 rows
print(dataSet_1, n = 201) # in the print function , we can specify how many rows we want to display
print(dataSet_1, n = nrow(dataSet_1)); # we can use nrow function to fetch all the instances(rows)


no_of_col <- ncol(dataSet_1)
no_of_row <- nrow(dataSet_1)
cat("now of row in the dataset: ", no_of_row) # dispalying the total number fo rows in the dataset
cat("now of column in the dataset: ", no_of_col) # dsiplaying th total number for column in the dataset
str(dataSet_1) # display the structure of the dataset

# duplicated(dataSet_1)
#is.na(dataSet_1)
#colSums(is.na(dataSet_1)); #to display how many missing values in each attribute(columns)

#remove duplicate instances
remo_dupli_dataset <- distinct(dataSet_1);
remo_dupli_dataset # removed duplicates instances from  the original dataSet_1 dataset


# Using unique functions we can find unique attributes
unique(dataSet_1$person_age)
unique(dataSet_1$person_gender)
unique(dataSet_1$person_education)
unique(dataSet_1$person_income)
unique(dataSet_1$person_emp_exp)
unique(dataSet_1$person_home_ownership)
unique(dataSet_1$loan_amnt)
unique(dataSet_1$loan_intent)
unique(dataSet_1$loan_int_rate)
unique(dataSet_1$loan_percent_income);
unique(dataSet_1$cb_person_cred_hist_length);
unique(dataSet_1$credit_score);
unique(dataSet_1$previous_loan_defaults_on_file);


fresh_dataset <- remo_dupli_dataset;


# dealing with invalild data
deal_invalid_dataset <- fresh_dataset;

deal_invalid_dataset$person_home_ownership <- ifelse(
  substr(toupper(deal_invalid_dataset$person_home_ownership), 1, 2) == "OT", "OTHER",  # For "OTHER"
  ifelse(
    substr(toupper(deal_invalid_dataset$person_home_ownership), 1, 1) == "O", "OWN",  # For "OWN"
    ifelse(
      substr(toupper(deal_invalid_dataset$person_home_ownership), 1, 1) == "R", "RENT",  # For "RENT"
      ifelse(
        substr(toupper(deal_invalid_dataset$person_home_ownership), 1, 1) == "M", "MORTGAGE",  # For "MORTGAGE"
        "NA"  # For everything else
      )
    )
  )
)

# Check unique categories after applying the logic
unique(deal_invalid_dataset $person_home_ownership)
print(deal_invalid_dataset)

fresh_dataset <- deal_invalid_dataset;

#dealing with missing value
deal_miss_value_dataset <- fresh_dataset;
colSums(is.na(deal_miss_value_dataset));
which(is.na(deal_miss_value_dataset$ person_age))
#discard insances
deal_miss_value_dataset <- na.omit(deal_miss_value_dataset); # will delete the instances, whose values are missing
deal_miss_value_dataset
colSums(is.na(deal_miss_value_dataset));

#Install tidyr package
install.packages('tidyr')
#Load the library
library(tidyr)

#Creste new dataframe by filling missing values (Up) [bottom - up approach]
bottom_up_dataset <- deal_miss_value_dataset %>% fill(person_age,person_gender, person_education, person_income,loan_percent_income, loan_status, .direction = 'up')
colSums(is.na(bottom_up_dataset));
#Creates new dataframe by filling missing values (Down) - (Top-Down approach)
top_down_dataset <- deal_miss_value_dataset %>% fill(person_age,person_gender, person_education, person_income,loan_percent_income, loan_status, .direction = 'down')
colSums(is.na(top_down_dataset));

#dealing with missing value with mode
#Replace missing values with the most frequent value (mode) for each categorical column
deal_miss_value_mode <- fresh_dataset;

# Mode for person_gender
mode_person_gender <- names(sort(table(deal_miss_value_mode$person_gender), decreasing = TRUE))[1]
deal_miss_value_mode$person_gender[is.na(deal_miss_value_mode$person_gender)] <- mode_person_gender

# Mode for person_education
mode_person_education <- names(sort(table(deal_miss_value_mode$person_education), decreasing = TRUE))[1]
deal_miss_value_mode$person_education[is.na(deal_miss_value_mode$person_education)] <- mode_person_education

# Mode for person_home_ownership
mode_person_home_ownership <- names(sort(table(deal_miss_value_mode$person_home_ownership), decreasing = TRUE))[1]
deal_miss_value_mode$person_home_ownership[is.na(deal_miss_value_mode$person_home_ownership)] <- mode_person_home_ownership

# Mode for loan_intent
mode_loan_intent <- names(sort(table(deal_miss_value_mode$loan_intent), decreasing = TRUE))[1]
deal_miss_value_mode$loan_intent[is.na(deal_miss_value_mode$loan_intent)] <- mode_loan_intent

# Mode for previos loan defaults on file
mode_previous_loan_defaults_on_file <- names(sort(table(deal_miss_value_mode$previous_loan_defaults_on_file), decreasing = TRUE))[1]
deal_miss_value_mode$previous_loan_defaults_on_file[is.na(deal_miss_value_mode$previous_loan_defaults_on_file)] <- mode_previous_loan_defaults_on_file

# Check the data after replacing missing values
deal_miss_value_mode

# Count NA values in each column to verify if there are any left
na_counts <- colSums(is.na(deal_miss_value_mode))
print(na_counts)

#dealing with missing value with mean
#Replace missing values with the mean(average) for each numerical column

deal_miss_value_mean <- deal_miss_value_mode;

deal_miss_value_mean$person_age <- as.numeric(deal_miss_value_mean$person_age)
deal_miss_value_mean$person_income <- as.numeric(deal_miss_value_mean$person_income)
deal_miss_value_mean$loan_status <- as.numeric(deal_miss_value_mean$loan_status)
deal_miss_value_mean$loan_percent_income <- as.numeric(deal_miss_value_mean$loan_percent_income)

# Loop over the specified columns ('person_age', 'person_income') to replace NA with column mean
for(col_name in c("person_age", "person_income", "loan_percent_income", "loan_status")) {
  if(is.numeric(deal_miss_value_mean[[col_name]])) {
    # Calculate column mean excluding NA values
    column_mean <- mean(deal_miss_value_mean[[col_name]], na.rm = TRUE)
    
    # Replace NA values with the column mean
    deal_miss_value_mean[[col_name]][is.na(deal_miss_value_mean[[col_name]])] <- column_mean
    
    # Round the column values to the nearest integer
    deal_miss_value_mean[[col_name]] <- round(deal_miss_value_mean[[col_name]], digits = 0)
  }
}

# Verify the NA counts in each column after replacement
na_counts <- colSums(is.na(deal_miss_value_mean))
print(na_counts)

fresh_dataset <- deal_miss_value_mean;
fresh_dataset

#the fresh dataset after discarding missing instances
fresh_dataset <- deal_miss_value_dataset;

#from categorical to numerical value
str(fresh_dataset);# for displaying the structure of the dataset
dataSet_num <- fresh_dataset; 
dataSet_num$person_gender <- factor(dataSet_num$person_gender, levels = c("male", "female"), labels = c(1,2));
dataSet_num$person_education <-  factor(dataSet_num$person_education, levels = c("High School", "Bachelor", "Master", "Associate", "Doctorate"), labels = c(1,2,3,4,5));
dataSet_num$loan_intent <-  factor(dataSet_num$loan_intent, levels = c("PERSONAL","EDUCATION","MEDICAL","VENTURE","HOMEIMPROVEMENT", "DEBTCONSOLIDATION"), labels = c(1,2,3,4,5, 6));
dataSet_num$person_home_ownership <-  factor(dataSet_num$person_home_ownership, levels = c("RENT","OWN","MORTGAGE","OTHER"), labels = c(1,2,3,4));
dataSet_num$previous_loan_defaults_on_file <-  factor(dataSet_num$previous_loan_defaults_on_file, levels = c("Yes", "No"), labels = c(1,2));
unique(dataSet_num$previous_loan_defaults_on_file)
dataSet_num$person_home_ownership
dataSet_num$loan_intent
dataSet_num$person_education
dataSet_num
colSums(is.na(fresh_dataset))



fresh_dataset <- dataSet_num


# Create the detect_outlier function
detect_outlier <- function(dataframe, columns) {
  for (col in columns) {
    if (is.numeric(dataframe[[col]])) {
      # Calculate quartiles and IQR
      Quantile1 <- quantile(dataframe[[col]], probs = 0.25)
      Quantile3 <- quantile(dataframe[[col]], probs = 0.75)
      IQR <- Quantile3 - Quantile1
      
      # Detect outliers
      outlier_flags <- dataframe[[col]] > Quantile3 + (IQR * 1.5) | dataframe[[col]] < Quantile1 - (IQR * 1.5)
      
      # Print outliers if any
      outliers <- dataframe[[col]][outlier_flags]
      if (length(outliers) > 0) {
        cat("Outliers detected in column", col, ":\n")
        print(outliers)
      } else {
        cat("No outliers detected in column", col, "\n")
      }
    } else {
      cat("Column", col, "is not numeric, skipping...\n")
    }
  }
}


# Create the remove_outlier function
remove_outlier <- function(dataframe, columns) {
  for (col in columns) {
    if (is.numeric(dataframe[[col]])) {
      # Calculate quartiles and IQR
      Quantile1 <- quantile(dataframe[[col]], probs = 0.25)
      Quantile3 <- quantile(dataframe[[col]], probs = 0.75)
      IQR <- Quantile3 - Quantile1
      
      # Remove rows with outliers
      dataframe <- dataframe[!(
        dataframe[[col]] > Quantile3 + (IQR * 1.5) | 
          dataframe[[col]] < Quantile1 - (IQR * 1.5)
      ), ]
    }
  }
  return(dataframe)
}


# Specify your dataset and column names
# numeric_columns <- c("person_age","person_income", "person_emp_exp",
#                      "loan_amnt", "loan_int_rate", "loan_percent_income",
#                      "cb_person_cred_hist_length", "credit_score");

# Assume your dataset is named 'fresh_dataset'
# outliers <- apply(fresh_dataset, 2, detect_outlier)
detect_outlier(fresh_dataset, names(fresh_dataset))
without_outlier_data <- remove_outlier(fresh_dataset, names(fresh_dataset))
without_outlier_data


fresh_dataset <- without_outlier_data;

#this part is for write a dataset to a xl file
install.packages('writexl')
library(writexl)
write_xlsx(fresh_dataset, "E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/MID/Mid Term Project/Metarials/fresh_dataset.xlsx")


#normalization

normalize_dataset <- fresh_dataset;

min_age <- min(normalize_dataset$person_age, na.rm = TRUE)
max_age <- max(normalize_dataset$person_age, na.rm = TRUE)
normalize_dataset$person_age <- (normalize_dataset$person_age - min_age) / (max_age - min_age)

min_income <- min(normalize_dataset$person_income, na.rm = TRUE)
max_income <- max(normalize_dataset$person_income, na.rm = TRUE)
normalize_dataset$person_income <- (normalize_dataset$person_income - min_income) / (max_income - min_income)


min_loan_amnt <- min(normalize_dataset$loan_amnt, na.rm = TRUE)
max_loan_amnt <- max(normalize_dataset$loan_amnt, na.rm = TRUE)
normalize_dataset$loan_amnt <- (normalize_dataset$loan_amnt - min_loan_amnt) / (max_loan_amnt - min_loan_amnt);

min_loan_int_rate <- min(normalize_dataset$loan_int_rate, na.rm = TRUE)
max_loan_int_rate <- max(normalize_dataset$loan_int_rate, na.rm = TRUE)
normalize_dataset$loan_int_rate <- (normalize_dataset$loan_int_rate - min_loan_int_rate) / (max_loan_int_rate - min_loan_int_rate);

min_credit_score <- min(normalize_dataset$credit_score, na.rm = TRUE)
max_credit_score <- max(normalize_dataset$credit_score, na.rm = TRUE)
normalize_dataset$credit_score <- (normalize_dataset$credit_score - min_credit_score) / (max_credit_score - min_credit_score );

normalize_dataset

fresh_dataset <- normalize_dataset;


#descriptive statistic
summary(fresh_dataset); #displaying the summary of the dataset\

# Function to calculate mean, median, and mode for specific columns
calculate_stats <- function(dataset, columns) {
  for (column_name in columns) {
    # Check if the column exists in the dataset and is numeric
    if (is.numeric(dataset[[column_name]])) {
      
      # Extract the column data
      column_data <- dataset[[column_name]]
      
      # Calculate statistics
      column_mean <- mean(column_data, na.rm = TRUE)
      column_median <- median(column_data, na.rm = TRUE)
      column_mode <- as.numeric(names(sort(table(column_data), decreasing = TRUE))[1])
      
      # Print results
      cat("Mean of column", column_name, "is", column_mean, "\n")
      cat("Median of column", column_name, "is", column_median, "\n")
      cat("Mode of column", column_name, "is", column_mode, "\n")
      cat("\n")  # Line break for readability
    }
  }
}


calculate_stats(fresh_dataset,names(fresh_dataset))

# List of specific columns to calculate standard deviation
columns_to_analyze <- c(
  "person_age", 
  "person_income", "person_emp_exp",  
  "loan_amnt", "loan_int_rate", 
  "loan_percent_income","cb_person_cred_hist_length",
  "credit_score", 
)

# apply(fresh_dataset,fresh_dataset$person_age,sd);
#colSums(is.na(fresh_dataset))

sd(fresh_dataset$person_age)
sd(fresh_dataset$person_income)
sd(fresh_dataset$person_emp_exp)
sd(fresh_dataset$loan_amnt)
sd(fresh_dataset$loan_int_rate)
sd(fresh_dataset$loan_percent_income)
sd(fresh_dataset$cb_person_cred_hist_length)
sd(fresh_dataset$credit_score)

# Function to calculate measures of spread: range, IQR, standard deviation, and variance
calculate_spread <- function(dataset, columns) {
  for (col_name in columns) {
    # Check if the column exists in the dataset
    if (col_name %in% names(dataset)) {
      # Ensure the column is numeric
      column_data <- as.numeric(dataset[[col_name]])
      
      # Calculate measures of spread if the column is numeric
      if (!all(is.na(column_data))) {  # Avoid calculations if all values are NA
        column_range <- range(column_data, na.rm = TRUE)  # Minimum and maximum
        column_iqr <- IQR(column_data, na.rm = TRUE)      # Interquartile range
        column_sd <- sd(column_data, na.rm = TRUE)        # Standard deviation
        column_variance <- var(column_data, na.rm = TRUE) # Variance

        cat("For column", col_name, ":\n")
        cat("  Range: [", column_range[1], ",", column_range[2], "]\n")
        cat("  IQR:", column_iqr, "\n")
        cat("  Standard Deviation:", column_sd, "\n")
        cat("  Variance:", column_variance, "\n")
        cat("\n")  
      } else {
        cat("Column", col_name, "contains no numeric data after conversion.\n")
      }
    } else {
      cat("Column", col_name, "not found in the dataset.\n")
    }
  }
}

calculate_spread(fresh_dataset, names(fresh_dataset))
