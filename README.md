# This is a README File for describing the GACD Project
-------------------------------------------------------

## Project Summary
------------------
One we unzip the Smsung smart phone data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". We will have UCI HAR Dataset directory which has two sets of training and test data sets. The goal of the project is two merge these two data sets, and make a tidy data set by performing few additional operations as will be described below:

## Contents of GACD-Project Repo
--------------------------------
* Present README.md file 
* Script file "run_analysis.R" for describing all the tasks involved in preparing tidy data set
* Codebook.md file which describes all the variables in the final tidy data set
* UCI HAR Dataset Directory which has the original data sets

## "run_Analysis.R" Script description
--------------------------------------
Script reads different files "from UCI HAR Dataset" directory and stores the data sets as listed below:
* features <- "features.txt" file is read and stored in this data frame.\ \
Dimensions = 561 rows, 2 columns
( v1=1,2...561), (v2=variable names as described in "features_info.txt")
* alabels <- data from "activity_labels.txt" is stored here.
Dimensions = 6 rows, 2 columns, 
(v1=1,2..6), (v2 = Walking, Walking_upstairs...)
* subtrain <- "subject_train.txt" data is stored here. 
dimensions = 7352 rows, 1 column
(v1= 1 1 1....)  Basically training data set subject identifier from 1 to 30.
* Xtrain
