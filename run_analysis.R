# ABOUT---------------------
# This script is for the course project of Getting and Cleaning Data.
# See https://www.coursera.org/course/getdata


# USAGE---------------------
# See the README.md and CodeBook.md here: 
# <URL>

# PROJECT INSTRUCTIONS --------------------
# 1. Merge the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.



# -------------------------------
# Setup the environment 
# -------------------------------

## Download the file if it doesn't already exist 
# Note, this download code is for Linux and might not work accordingly on Windows. 
file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists("uci.zip")){
  download.file(file_url, "uci.zip", method="curl")
} else {
  message("File already downloaded")
}

## Unzip the data if the extract directory doesn't exist
# If a directory of the name already exist which wasn't created by this script, your data files will not be extracted
if (!dir.exists("uci_data")){
  unzip("uci.zip", overwrite = FALSE, exdir = "uci_data")
} else {
  message("Folder already exists")
}

## Move to the data folder for easier referencing
old_dir <- getwd(); setwd('uci_data/UCI HAR Dataset');


# -------------------------------
# Step 1: Merge the training and the test sets to create one data set.              
# -------------------------------

## Get the training data
train_x_data <- read.table("train/X_train.txt")
train_y_data <- read.table("train/y_train.txt")
train_subject_data <- read.table("train/subject_train.txt")

## Get the testing data
test_x_data <- read.table("test/X_test.txt")
test_y_data <- read.table("test/y_test.txt")
test_subject_data <- read.table("test/subject_test.txt")

## Merge the training and testing data
train_x_data <- cbind(train_x_data,train_y_data, train_subject_data)
test_x_data <- cbind(test_x_data,test_y_data, test_subject_data)
combined <- rbind(train_x_data, test_x_data)


# -------------------------------
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.            
# -------------------------------

## Extract the mean and standard deviation for each measurement
# Subset the features we are interested in - those with mean() and std()

## Get features
features <- read.table("features.txt", stringsAsFactors = FALSE)
features_index <- as.vector(grep("mean\\()|std\\()",features$V2)) #gets the column index of features

combined2 <- combined[ , c(features_index, 562, 563)] #includes the activity and subject index


# -------------------------------
# Step 3: Uses descriptive activity names to name the activities in the data set               
# -------------------------------

## Get vector of activities
activity_labels <- read.table("activity_labels.txt") #this will make factors which is necessary

library(plyr)
oldvalues <- activity_labels$V1
newvalues <- activity_labels$V2

combined2[ ,67] <- newvalues[ match(combined2[ ,67], oldvalues) ]


# -------------------------------
# Step 4: Appropriately labels the data set with descriptive variable names.                
# -------------------------------

## Rename columns
features_names <- as.vector(grep("mean\\()|std\\()",features$V2, value=TRUE))
col_names <- c(features_names, "activity", "subject")
names(combined2) <- col_names


# -------------------------------
# Step 5: From the data set in step 4, creates a second, independent tidy data set 
#         with the average of each variable for each activity and each subject.               
# -------------------------------

## Determine the mean for each column by subject then activity.
library(dplyr)
combined3 <- combined2 %>% group_by(subject, activity) %>% summarise_each(funs(mean))

## Rename fields to be "mean_of"
remove <- c("subject", "activity")
new_colnames <- names(combined3)
new_colnames <- new_colnames[!new_colnames %in% remove]
new_colnames <- paste("Mean_of", new_colnames, sep = "_")
new_colnames <- c(remove, new_colnames)
names(combined3) <- new_colnames


# -------------------------------
# Export Results and Cleanup               
# -------------------------------

## Export to text file
write.table(combined3, "courseproject_tidyresults.txt", row.name=FALSE)

## Reset the working directory
setwd(old_dir)
