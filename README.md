# This is a README File for describing the GACD Project
-------------------------------------------------------

## Project Objective
------------------
After we Unzip the Smsung smart phone data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", we will have UCI HAR Dataset directory which has training and test data sets. The goal of the project is two merge these two data sets, and make a tidy data set by performing few additional operations as described below:

## Contents of GACD-Project Repo
--------------------------------
* README.md file 
* Script file "run_analysis.R" for describing all the tasks involved in preparing tidy data set
* Codebook.md file which describes all the variables in the final tidy data set
* "tidydata.txt" file

## "run_Analysis.R" Script description
--------------------------------------
*Note: Script file is completely described here. So didn't put any additional comments in the script file*

Script reads different files from "UCI HAR Dataset" directory using read.table function and stores the data sets into objects as listed below:
* features <- "features.txt" file data is stored here. Dimensions = 561 X 2 <br>
Variable names as described in "features_info.txt" are stored here.

* alabels <- "activity_labels.txt" data is stored here. Dimensions = 6 X 2 <br> 
Activity labels such as (1,2..6), and activity description such as Walking, Walking_upstairs... are stored here.

* subtrain <- "subject_train.txt" data is stored here. Dimensions = 7352 X 1<br>
Training data set subject id's ranging from 1 to 30 are stored here.

* Xtrain <- "X_train.txt" data is stored here. Dimensions = 7352 x 561 <br>
Stores the actual training data for all the 561 feature variables.

* Ytrain <- "Y_train.txt", data is stored here. Dimensions = 7352 X 1<br>
This data set stores activity labels from 1 to 6 

Similar to the training data sets, we have test data sets as listed below:
* subtest <- "subject_test.txt" data. Dimensions = 2947 X 1

* Xtest <- "X_test.txt" data. Dimensions = 2947 X 561

* Ytest <- "Y_test.txt" data. Dimensions = 2947 X 1

#### Step1
We are asked to merge training and test data sets to create one data set. But first we need to combine subtrain, Xtrain, and Ytrain into one training data set, and also combine subtest, Xtest, and Ytest into one test data set. This can be achieved in a simple way by using cbind function as listed below. 

train <- cbind(subtrain,Ytrain,Xtrain). Dimensions of train: 7352 X 563<br>
test <- cbind(subtest,Ytest,Xtest). Dimensions of test: 2947 X 563 <br>
Now we can combine train and test data frames by a simple rbind function.

st1data <- rbind(train,test). Dimensions of st1data: 10299 X 563<br>
*Note: There migh be other ways to do this, but cbind and rbind seemed simpler*

#### Step2
We need to extract only measurements on mean and sd from 561 variables. Now thiscan be interpreted in different ways, because mean() and sd() appear at the end of variables in 66 instances, meanFreq 13 times, and mean in angle variables 7 times. I have chosen to take only mean() and sd() resulting in 66 variables. <br>
Line 17 to Line 24 in the script file describe this using grep< resulting in mstd and mstdn objects. <br>
mstd <- stores 66 column numbers of corresponding mean() and sd() variables <br>
mstdn <- stores the 66 variable names related to mean() and sd() <br>
step 2 data can be now easily subsetted as shown below: <br>
st2data <- st1data[,c(1,2,mstd+2)]. Dimensions of st2data 10299 X 68

#### Step3
st3data <- st2data; renamed just to denote step3. <br>
Activity labels in st3data needs to be given descriptive names such as WALKING etc. While there are many ways to do this, a simple for loop did the job as shown from Line 29 to Line 35 in script file. <br>
st3data  now has descriptive activity names in all rows of second column. <br>
st3data still has Dimensions of 10299 X 68

#### Step4
st4data <- st3data. renamed just to to denote step4.<br>
Until now variable names are still v1, v2..etc. they have not been given descriptive names. Line 37 takes care of this as shown below:<br>
names(st4data) <- c("Subject", "Activity", mstdn) <br>
st4data now has descriptive variable names for all 68 columns <br>
Dimensions of st4data 10299 X 68

#### Step5
Now we need to create a tidy data set with average of each feature variable for each activity and each subject. Again several ways to do this. Line 39, 40 in script file show the process using aggregate function resulting in st5data. <br>
*Note: tested this seperately using melt and got same output*

st5data dimensions are 180 X 68. <br>

Data is tidy, but there are some typos in some of 66 variable names like "BodyBody". So did little cleaning up of variable names using gsub function as shown from Lines 43 to 51 in script file. <<br>
Finally the data is written to a file called "tidydata.txt" using write.table function.  <br>
Best way to read this file is using the read.table function as described below: <br>

read.table("tidydata.txt", header=TRUE, check.names=FALSE)

