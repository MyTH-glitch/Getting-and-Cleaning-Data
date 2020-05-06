#Getting and Cleaning Data

This repository contains the source and ouput files submitted by Shini Renjith for the Peer-graded Assignment for Getting and Cleaning Data.

#Dataset

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Files

1. CodeBook.md : data to indicate all the variables and summaries calculated, along with units, and any other relevant information
2. get_data.R : downloads the dataset and arrange it locally
3. run_analysis.R : performs the data preparation and cleansing as described in the course project’s definition which includes

	i. Merges the training and the test sets to create one data set
	
	ii. Extracts only the measurements on the mean and standard deviation for each measurement
	
	iii. Uses descriptive activity names to name the activities in the data set
	
	iv. Appropriately labels the data set with descriptive variable names
	
	v. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
	
4. FinalData.txt : the exported final data after going through all the sequences described above.