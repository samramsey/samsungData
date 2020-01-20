---
title: "run_Analysis ReadMe"
author: "Sam Ramsey"
date: "January 20, 2020"
output: rmarkdown::github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

runAnalysis.R takes data from local files that details measurements taken from Samsung activity trackers. The function of the code is to aggregate, clean, and summarize the data. Specifically, the code is broken into five principal components:

*1.0 extract and assign data*

This section extracts the measurements, subject identifiers, and activity codes for both the test data set and train data set. The code then merges these three components for each set, producing two data tables that detail the subject, activity, and measurement information. Finally, the information stored in the features.txt file is extracted and applied as the column headers to the measurement variables in the data tables.

*2.0 extract data pertaining to mean and standard deviation & adjust activity labels*

This section takes the data tables produced in step 1, test_data and train_data, and binds them by row to one table. The data is then reduced to unqieu variables, and then further to only variable relating to mean and standard deviation measurements. Finally, the numerical activity identifiers are replaced with the string class name, drawn frmo the activity_labels.txt file. The final table from step 2 is the mean_std_data data table.

*3.0 create a new tidy set that summarizes each variables mean by subject and activity*

The final section of code takes the mean_std_data data table and mutates it, producing a data table that summarizes the information, producing the mean of each variable by subject and activity. The final tidy set is the mean_data data table.