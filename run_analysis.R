# This code takes Human Activity Recognition (HAR) data stored locally and completes the following steps:
# 1. Merge training and test data into one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.


# 0.0 initialize libraries
library(dplyr)
library(data.table)
library(tidyr)
library(tidyselect)

# 0.1 name directories for source data ----

basewd <- "C:/Users/samra/Documents/Coursera/1_Data Scientist's Toolbox/3_Getting and Cleaning Data/Course Project/UCI HAR Dataset"
testwd <- file.path(basewd,"test")
trainwd <- file.path(basewd,"train")
test_signals_wd <- file.path(testwd,"Inertial Signals")
train_signals_wd <- file.path(trainwd,"Inertial Signals")

# 1.0 extract and assign data ----
setwd(basewd)
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt") # reads out column headers for the data sets

setwd(testwd)
subject_test <- read.table("subject_test.txt") # reads subject identifier for test data
x_test <- read.table("X_test.txt") # reads test data
y_test <- read.table("y_test.txt") # reads activity label for test data
test_data <- data.table(cbind(subject_test,y_test,x_test)) # merges subject, activity, and data set
colnames(test_data) <- c("subject","activity",as.vector(features$V2)) # renames variables by features info

setwd(trainwd)
subject_train <- read.table("subject_train.txt") # reads subject identifier for train data
x_train <- read.table("X_train.txt") # reads train data
y_train <- read.table("y_train.txt") # reads activity label for train data
train_data <- data.table(cbind(subject_train,y_train,x_train)) # merges subject, activity, and train data set
colnames(train_data) <- c("subject","activity",as.vector(features$V2)) # renames variables by features info

# 2.0 extract data pertaining to mean and standard deviation & adjust activity labels ---- 
merged_data <- rbind(test_data,train_data) # joins test and train data to one set
mean_std_data <- merged_data %>%
  subset(select = unique(names(merged_data))) %>% # remove any duplicated variables
  select(c("subject","activity",contains("mean"),contains("std"))) %>% # extract variables pertaining to mean and stdev
  mutate(activity = activity_labels$V2[activity]) # replace activity numerics with descriptive labels

# 3.0 create a new tidy set that summarizes each variables mean by subject and activity ----
mean_data <- mean_std_data %>%
  group_by(subject,activity) %>%
  summarize_all(mean)
