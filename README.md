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
Script reads different files "from UCI HAR Dataset" directory using read.table function and stores the data sets into objects as listed below:
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
* subtest <- "subject_test.txt" data. Dimensions = 2947 X 1

* Xtest <- "X_test.txt" data. Dimensions = 2947 X 561

* Ytest <- "Y_test.txt" data. Dimensions = 2947 X 1

#### Step1
We are asked to merge training and test data sets to create one data set. But first we need to combine subtrain, Xtrain, and Ytrain into one training data set, and also combine subtest, Xtest, and Ytest into one test data set. This can be achieved in a simple way by using cbind function as listed below. 

train <- cbind(subtrain,Ytrain,Xtrain). Dimensions of train: 7352 X 563<br>
test <- cbind(subtest,Ytest,Xtest). Dimensions of test: 2947 X 563 
Now we can combine train and test data frames by a simple rbind function.

st1data <- rbind(train,test). Dimensions of st1data: 10299 X 563<br>
Note: There migh be other ways to do this, but cbind and rbind seemed simpler

#### Step2
We need to extract only measurements on mean and sd from 561 variables. Now this is an open question, because mean() and sd() appear at the end of variables in 66 instance, meanFreq 13 times, and mean in angle variables 7 times. I have chosen to take only mean() and sd() giving me 66 variables. <br>
*Line 17 to Line 24* in the script file describe this using grep.<br>
mstd <- stores 66 column numbers of corresponding mean() and sd() variables <br>
mstdn <- stores the 66 variable names related to mean() and sd() <br>
step 2 data can be now easily subsetted as shown below:
st2data <- st1data[,c(1,2,mstd+2)]. Dimensions = 10299 X 68 <br>
First two columns are subject and activity variables, remaining 66 variables are related to mean() and sd(). 

