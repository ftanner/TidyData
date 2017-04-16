# Getting and Cleaning Data

## Course Project
Per the course assignment, this '''run_analysis.R''' script performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to run code
1. Download the data source information and unzip it into the same directory as the '''run_analysis.R''' script.
2. start rstudio in the directory that includes the run_analysis script
3. source("run_analysis.R")

This will produce a tiny_data.txt file in your working directory
