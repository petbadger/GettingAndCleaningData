# This script is for the course project of Getting and Cleaning Data.
# See https://www.coursera.org/course/getdata

# USAGE
# See the README.md and CodeBook.md here: 

# Project instructions:
# 1. Merge the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

#########################
# Setup the environment 
#########################

# Download the file if it doesn't already exist 
# Note, this download code is for Linux and might not work accordingly on Windows. 
file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists("uci.zip")){
  download.file(file_url, "uci.zip", method="curl")
}

# Unzip the data if the extract directory doesn't exist
# If a directory of the name already exist which wasn't created by this script, your data files will not be extracted
if (!dir.exists("uci_data")){
  unzip("uci.zip", overwrite = FALSE, exdir = "uci_data")
}

# Move to the data folder
old_dir <- getwd()
setwd('uci_data/UCI HAR Dataset')


#########################
# Step 1: Merge the training and the test sets to create one data set.              
#########################

# Get the training data

# Get the testing data

# Merge the training and testing data


#########################
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.            
#########################

# Extract the mean and standard deviation for each measurement



#########################
# Step 3: Uses descriptive activity names to name the activities in the data set               
#########################

# 



#########################
# Step 4: Appropriately labels the data set with descriptive variable names.                
#########################

#


#########################
# Step 5: From the data set in step 4, creates a second, independent tidy data set 
#         with the average of each variable for each activity and each subject.               
#########################

#



#########################
# Cleanup               
#########################

setwd(old_dir)
