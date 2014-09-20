# This script cleans up the Samsung smartphone data 
features <- read.table("UCI HAR Dataset/features.txt")
alabels <- read.table("UCI HAR Dataset/activity_labels.txt")

subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")

subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")

train <- cbind(subtrain,Ytrain,Xtrain)
test <- cbind(subtest,Ytest,Xtest)

st1data <- rbind(train,test)
mstd <- grep("mean()|std()", features[,2])
mstdn <- grep("mean()|std()", features[,2], value=TRUE)

mfreq <- grep("meanFreq", features[,2])
mfreqn <- grep("meanFreq", features[,2], value=TRUE)

mstd <- mstd[!mstd %in% mfreq]
mstdn <- mstdn[!mstdn %in% mfreqn]

st2data <- st1data[,c(1,2,mstd+2)]
st3data <- st2data

nr <- nrow(st3data)
for (i in 1:nr) {
  
  for (j in 1:6) {
    if(st3data[i,2] == alabels[j,1]) {st3data[i,2] <- as.character(alabels[j,2])}
  }
}
st4data <- st3data
names(st4data) <- c("Subject", "Activity", mstdn)

st5data <- aggregate(st4data[,3:68],list(Activity = st4data$Activity, Subject = st4data$Subject),mean)
st5data <- st5data[,c("Subject", "Activity", mstdn)]


names(st5data) <- gsub("BodyBody", "Body", names(st5data), fixed=TRUE)
names(st5data) <- gsub("mean()", "M", names(st5data), fixed=TRUE)
names(st5data) <- gsub("std()", "SD", names(st5data), fixed=TRUE)
names(st5data) <- gsub("M-X", "X-M", names(st5data), fixed=TRUE)
names(st5data) <- gsub("M-Y", "Y-M", names(st5data), fixed=TRUE)
names(st5data) <- gsub("M-Z", "Z-M", names(st5data), fixed=TRUE)
names(st5data) <- gsub("SD-X", "X-SD", names(st5data), fixed=TRUE)
names(st5data) <- gsub("SD-Y", "Y-SD", names(st5data), fixed=TRUE)
names(st5data) <- gsub("SD-Z", "Z-SD", names(st5data), fixed=TRUE)

write.table(st5data, file="tidydata.txt", row.names=FALSE)