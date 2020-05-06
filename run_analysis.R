# Getting and Cleaning Data - Coursera Project

# Load required packages
library(dplyr)

# Setup working directory
working_dir <- "F://Work"
prev_dir <- getwd()
setwd(working_dir)

################################################################################
# Merges the training and the test sets to create one data set
################################################################################

# Reading trainings tables and assigning column names

# feature vector
features <- read.table('./UCI HAR Dataset/features.txt',
                       col.names = c("feature_id","feature"))

# Reading activity labels
activities = read.table('./UCI HAR Dataset/activity_labels.txt',
                            col.names = c("activity_id","activity"))

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Reading testing tables
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Merging all data into one dataset
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

################################################################################
# Extracts only the measurements on the mean and standard deviation for each
# measurement
################################################################################

CleanData <- Merged_Data %>% 
  select(subject, activity_id, contains("mean"), contains("std"))

################################################################################
# Uses descriptive activity names to name the activities in the data set
################################################################################

CleanData$activity_id <- activities[CleanData$activity_id, 2]

################################################################################
# Appropriately labels the data set with descriptive variable names
################################################################################

names(CleanData)[2] = "activity"
names(CleanData)<-gsub("Acc", "Accelerometer", names(CleanData))
names(CleanData)<-gsub("Gyro", "Gyroscope", names(CleanData))
names(CleanData)<-gsub("BodyBody", "Body", names(CleanData))
names(CleanData)<-gsub("Mag", "Magnitude", names(CleanData))
names(CleanData)<-gsub("^t", "Time", names(CleanData))
names(CleanData)<-gsub("^f", "Frequency", names(CleanData))
names(CleanData)<-gsub("tBody", "TimeBody", names(CleanData))
names(CleanData)<-gsub("-mean()", "Mean", names(CleanData), ignore.case = TRUE)
names(CleanData)<-gsub("-std()", "STD", names(CleanData), ignore.case = TRUE)
names(CleanData)<-gsub("-freq()", "Frequency", names(CleanData), ignore.case = TRUE)
names(CleanData)<-gsub("angle", "Angle", names(CleanData))
names(CleanData)<-gsub("gravity", "Gravity", names(CleanData))

################################################################################
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
################################################################################

FinalData <- CleanData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)

# Check the output
str(FinalData)

setwd(prev_dir)
