---
title: "README.md"
author: "PetBadger"
date: "November 19, 2015"
output: html_document
---

# Repository
This repo explains how the run_analysis.R script works. 

# Getting and Cleaning Data - Course Project

Prepare tidy data from data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Installation

Download run_analysis.R and place it in your R environment's working directory.

## Usage

It's best to place this script into a new empty directory. The script will download a zip file, unzip it, and export the result to a new file.

The script merges the training and the test data sets from the extracted files and will create one data set.
Only the mean and standard deviation measurements, subject and activity are extracted. 

Activity data is replaced with readable labels.

Column labels modified to appropriate descriptives. 

From the data set in step 4, a second, independent tidy data set is created which contains the average of each variable for each activity and each subject.

This tidy data can then be used for later analysis.


## Contributing

Don't. It's just an assignment. :)

## License

None. However the data that is downloaded has it's own license. For more information see [this website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)





