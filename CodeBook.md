# CodeBook

This is a code book that describes the data and variables for the Coursera ''Getting and Cleaning Data Course Project''

## Data Source

* The original data set was curtesy of University of California, Irvine: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Downloaded from cloudfront here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Set Information

From [1], the data can be summarized as a "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors."  Details on the data can be found at the data sources URL (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  This CodeBook only contains information on how the data was used for the Getting and Cleaning Data Course project.

For this assignment, we utilized the following files from the UCI data set:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Assignment and Results

Using the data in [1],  the run_analysis.R script performs the following tasks:

1. Merged training and test sets to create one merged data set
2. Extracted mean and standard deviation columns from the merged data set
3. Associated merged data with the activity the metric was derived from (e.g. Walking, Walking Upstairs, Walking Downstairs, etc.)
4. Associated labels with descriptive variable names
5. Created a second tidy data set with average values for each activity and each subject.

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

