## Author: Frank Tanner
## File: run_analysis.R
##
## Description: Performs the various analysis activities defined
## in the programming assignment for week 4 of the "getting and cleaning
## data" coursera course.  See: 
## https://www.coursera.org/learn/data-cleaning/
##
##
######################################################################

library(plyr)
##
## Define constants
##
DATA_LOCATION <- "./UCI\ HAR\ Dataset/"
TRAINING_DATA_FILE <- paste0(DATA_LOCATION, "train/X_train.txt")
TEST_DATA_FILE <- paste0(DATA_LOCATION, "test/X_test.txt")

TRAINING_LABELS_FILE <- paste0(DATA_LOCATION, "train/y_train.txt")
TEST_LABELS_FILE <- paste0(DATA_LOCATION, "test/y_test.txt")

FEATURES_FILE <- paste0(DATA_LOCATION, "features.txt")

SUBJECT_TEST_FILE = paste0(DATA_LOCATION, "train/subject_train.txt")
SUBJECT_TRAIN_FILE = paste0(DATA_LOCATION, "test/subject_test.txt")
#
# 1) Merges the training and the test sets to create one data set.
#
train_data <- read.table(TRAINING_DATA_FILE)
test_data <- read.table(TEST_DATA_FILE)

merged <- rbind(train_data, test_data)


#
# 2) Extracts only the measurements on the mean and standard deviation
# for each measurement. 
#
# merged table only contains values without labels.  Grab the labels
#
features <- read.table(FEATURES_FILE)
names(merged) <- features$V2

# determine which columns contain "mean" or "std"
meanstdcols <- grepl("mean", names(merged)) | grepl("std", names(merged))

meanstddat <- merged[, meanstdcols]

#
# 3) Uses descriptive activity names to name the activities in the data set
#
train_labels <- read.table(TRAINING_LABELS_FILE)
test_labels <- read.table(TEST_LABELS_FILE)

merged_labels <- rbind(train_labels, test_labels)
names(merged_labels) <- "activity"

combined <- cbind(merged, merged_labels)
combined$activity <- factor(combined$activity, labels=c("Walking",
                                                        "Walking Upstairs", 
                                                        "Walking Downstairs", 
                                                        "Sitting", "Standing", 
                                                        "Laying"))

#
# 4) Appropriately label the data set with descriptive variable names
#
subject_test_data = read.table(SUBJECT_TEST_FILE)
subject_train_data = read.table(SUBJECT_TRAIN_FILE)

subject_data = rbind(subject_train_data, subject_test_data)
names(subject_data) <- "subject"
all_data = cbind(combined, subject_data)

#
# 5) From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
#
tidy_data<-aggregate(. ~subject + activity, all_data, mean)
tidy_data<-tidy_data[order(tidy_data$subject,tidy_data$activity),]
write.table(tidy_data, "tidy_data.txt",row.name=FALSE)