##  Getting and Clearing Data Learning On Coursera
##  Coursera Project  
##  coded by Kaibin Liu in Nanjing, China, at 16th Jun, 2015
##

# Set  variables
feature.file            <- "./UCI HAR Dataset/features.txt"
activity.label.file     <- "./UCI HAR Dataset/activity_labels.txt"
subject.tr.file         <- "./UCI HAR Dataset/train/subject_train.txt"
X.tr.file               <- "./UCI HAR Dataset/train/X_train.txt"
Y.tr.file               <- "./UCI HAR Dataset/train/y_train.txt"

subject.ts.file         <- "./UCI HAR Dataset/test/subject_test.txt"
X.ts.file               <- "./UCI HAR Dataset/test/X_test.txt"
Y.ts.file               <- "./UCI HAR Dataset/test/y_test.txt"

# read data from txtfile
feature <- read.table(
    file       = feature.file, 
    header     = FALSE, 
    colClasses = "character"
)

# read train data
subject.tr <- read.table(
    file       = subject.tr.file, 
    header     = FALSE, 
    colClasses = "numeric"
)

X.tr <- read.table(
    file       = X.tr.file, 
    header     = FALSE, 
    colClasses = "numeric"
)

Y.tr <- read.table(
    file       = Y.tr.file, 
    header     = FALSE, 
    colClasses = "character"
)

# use Activity label to name the activities records in Y.tr
Y.tr$V1 <- gsub("1", "WALKING", Y.tr$V1)
Y.tr$V1 <- gsub("2", "WALKING_UPSTAIRS", Y.tr$V1)
Y.tr$V1 <- gsub("3", "WALKING_DOWNSTAIRS", Y.tr$V1)
Y.tr$V1 <- gsub("4", "SITTING", Y.tr$V1)
Y.tr$V1 <- gsub("5", "STANDING", Y.tr$V1)
Y.tr$V1 <- gsub("6", "LAYING", Y.tr$V1)

names(X.tr) <- feature$V2

# Extracts only the measurements on the mean and standard deviation for each measurement. 
X.tr <- X.tr[, c("tBodyAcc-mean()-X", 
                 "tBodyAcc-mean()-Y", 
                 "tBodyAcc-mean()-Z",
                 "tBodyAcc-std()-X",
                 "tBodyAcc-std()-Y",
                 "tBodyAcc-std()-Z")]

# add Subject and Activity columns in X.tr
X.tr$Subject <- subject.tr$V1
X.tr$Activity <- Y.tr$V1

# read train data
subject.ts <- read.table(
    file       = subject.ts.file, 
    header     = FALSE, 
    colClasses = "numeric"
)

X.ts <- read.table(
    file       = X.ts.file, 
    header     = FALSE, 
    colClasses = "numeric"
)

Y.ts <- read.table(
    file       = Y.ts.file, 
    header     = FALSE, 
    colClasses = "character"
)

# use Activity label to name the activities records in Y.ts
Y.ts$V1 <- gsub("1", "WALKING", Y.ts$V1)
Y.ts$V1 <- gsub("2", "WALKING_UPSTAIRS", Y.ts$V1)
Y.ts$V1 <- gsub("3", "WALKING_DOWNSTAIRS", Y.ts$V1)
Y.ts$V1 <- gsub("4", "SITTING", Y.ts$V1)
Y.ts$V1 <- gsub("5", "STANDING", Y.ts$V1)
Y.ts$V1 <- gsub("6", "LAYING", Y.ts$V1)

names(X.ts) <- feature$V2

# Extracts only the measurements on the mean and standard deviation for each measurement. 
X.ts <- X.ts[, c("tBodyAcc-mean()-X", 
                 "tBodyAcc-mean()-Y", 
                 "tBodyAcc-mean()-Z",
                 "tBodyAcc-std()-X",
                 "tBodyAcc-std()-Y",
                 "tBodyAcc-std()-Z")]

# add Subject and Activity columns in X.tr
X.ts$Subject <- subject.ts$V1
X.ts$Activity <- Y.ts$V1

# Merges the training and the test sets to create one data set.
X <- rbind(X.tr, X.ts)

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
aqm <- melt(X, id=c("Subject", "Activity"), na.rm=TRUE, measure.vars=c("tBodyAcc-mean()-X", 
                                                                         "tBodyAcc-mean()-Y", 
                                                                         "tBodyAcc-mean()-Z",
                                                                         "tBodyAcc-std()-X",
                                                                         "tBodyAcc-std()-Y",
                                                                         "tBodyAcc-std()-Z"))

a <- dcast(aqm, Subject + Activity ~ variable, mean)

# save the new dataset to the file "tX.txt"
write.table(a, file="tX.txt", row.name=False)
