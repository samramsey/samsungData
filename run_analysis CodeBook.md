---
title: "run_Analysis.R CodeBook"
author: "Sam Ramsey"
date: "January 19, 2020"
output: rmarkdown::github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Getting & Cleaning Data Week 4 Course Project | Samsung Data

This CodeBook details the data and variables used in the analysis of Samsung Wearable Data for Getting & Cleaning Data Week 4 Course Project.

# Data

The data is stored locally in a variety of text files, as detailed below:

*ativity labels.txt*
This is a simple data set that details the activity and its numerical identifier, used in the data sets.

*features.txt*
This is a data file that lists all of the variables recorded and listed in the data sets.

*subject text.txt*
This data file contains a numerical identifier for each test performed, that indicates which individual performed the test.

*x_test.txt*
This is a data file containing the test data.

*y_test.txt*
This is a data file that contains the labels for the test set.

*subject_train.txt*
This is a data file containing the data from training.

*x_training.txt*
This is the data file containing the training data.

*y_training.txt*
This is a data file containing the labels relating to the training data.

# Variables

The code contained in run_Analysis.R makes use of the following variables:

*activity_labels:* A table of string activity identifiers with an associated numerical value.

*features:* A table of measurements taken in both the test and train data sets.

*subject_test:* A table of values drawn from subject_test.txt identifying the subject number for the test data set.

*test_data: *A data table binding the information from subject_test, x_test, and y_test. This data table details all recoreded information from the test test with the subject and activity for each data vector.

*subject_train: *A table of values drawn from subject_train.txt identifying the subject number for the training data set.

*train_data: *A data table binding the information frmo subject_train, x_train, and y_train. This data table binds the subject identifier with the activity class and the training data set.

*merged_data: *A data table binding the test_data and train_data sets.

*mean_std_data: *A data table containing unique measurement recordings pertaining to mean and standard deviation, with activity labels replacing their numeric counterparts.

*mean_data: *A data table summarizing the mean of each measurement in mean_std_data by activity and class.