# Getting and Cleaning Data Course Project
---
author: "Erica Trinh"
date: "August 28, 2017"
---

## Summary
This respository contains a script that reads data collected from the accelerometers from the Samsung Galaxy S smartphone and returns a tidy table with the average mean and standard deviation for each category measured.
1. Reads in features to get column names
2. Read in data from test and training files
3. Merge data from test and train files into one dataset
4. Extract columns that contain the mean and standard deviation
5. Replace activity label
6. Reformat label so to fit tidy table requirements
7. Create and save tidy table

## Data
Data is found in the UCI HAR Dataset folder.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Output
The tidyTable.csv provides a tidy table of the average means and standard deviation from each measurement in the dataset.

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

