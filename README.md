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
Script reads different files "from UCI HAR Dataset" directory and stores the data sets into objects as listed below:
* features <- "features.txt" file data is stored here. Dimensions = 561 X 2 <br>
( v1=1,2...561), (v2=variable names as described in "features_info.txt")

* alabels <- "activity_labels.txt" data is stored here. Dimensions = 6 X 2 <br> 
(v1=1,2..6), (v2 = Walking, Walking_upstairs...)

* subtrain <- "subject_train.txt" data is stored here. Dimensions = 7352 X 1<br>
(v1= 1 1 1....)  Basically training data set subject id from 1 to 30.

* Xtrain <- "X_train.txt" data is stored here. Dimensions = 7352 x 561 <br>
Stores the actual training data for all the 561 feature variables.

* Ytrain <- "Y_train.txt", data is stored here. Dimensions = 7352 X 1<br>
This data set stores activity labels from 1 to 6 which correspond to whether the subject was WALKING, STANDING etc..

Similar to the training data sets, we have test data sets as listed below:
* subtest <- "subject_test.txt" data. Dimensions = 7352 X 1

* Xtest <- "X_test.txt" data. Dimensions = 7352 X 561

* Ytest <- "Y_test.txt" data. Dimensions = 7352 X 1


