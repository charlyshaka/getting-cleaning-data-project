# make sure you have plyr installed. You can run the following command if not: 
# install.packages("plyr")
library(plyr)

# change me if needed - this folder is created when unzipping data source into the repo
dataFolder = "UCI HAR Dataset/"

getFilePath <- function(filepath) {
  paste(dataFolder, filepath, sep="")
  
}

# First: Merge training and the test files: 
# - X
# - Y
# - subject

XTrain <- read.table(getFilePath("train/X_train.txt"))
XTest <- read.table(getFilePath("test/X_test.txt"))
XData <- rbind(XTrain, XTest)
# be a good citizen and clean vars that are no longer required
rm(XTrain, XTest)

YTrain <- read.table(getFilePath("train/y_train.txt"))
YTest <- read.table(getFilePath("test/y_test.txt"))
YData <- rbind(YTrain, YTest)
# ... good citizen...
rm(YTrain, YTest)

subjectTrain <- read.table(getFilePath("train/subject_train.txt"))
subjectTest <- read.table(getFilePath("test/subject_test.txt"))
SubjectData <- rbind(subjectTrain, subjectTest)
# ... still a good citizen
rm(subjectTrain, subjectTest)

# #2: We should only keep mean and standard deviation for each measurement.

features <- read.table(getFilePath("features.txt"))
keptMesurePositions <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
XData <- XData[, keptMesurePositions]

# we set and clean column names
names(XData) <- features[keptMesurePositions, 2]
# we remove unwanted characters from column names
names(XData) <- gsub("\\(|\\)", "", names(XData))
names(XData) <- tolower(names(XData))
# time to cleanup no longer required variables
rm(keptMesurePositions, features)

# #3: have a descriptive activity column, based on activity_labels.txt
activityLabels <- read.table(getFilePath("activity_labels.txt"))
# clean activity names (one line this time!)
activityLabels[, 2] = gsub("_", "", tolower(as.character(activityLabels[, 2])))
YData[,1] = activityLabels[YData[,1], 2]
# name that new column
names(YData) <- "activity"

# label SubjectData
names(SubjectData) <- "subjectnumber"

# Then: Time to merge everthing together and save into a file: XData, YData, SubjectData

merged <- cbind(SubjectData, YData, XData)
write.table(merged, "tidy_data.txt")

# #5: "Creates a 2nd data set with the average of each variable for each activity and each subject."
# if we decide to move or add non-numeric column
excludedColumns = which(names(merged) %in% c("subjectnumber", "activity"))
result <- ddply(merged, .(subjectnumber, activity), .fun=function(x){ colMeans(x[,-excludedColumns]) })

write.table(result, "average_data.txt")
