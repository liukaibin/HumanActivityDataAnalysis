## Introduction


This File describes how the script code in the run_analysis.R works and the code book describing the variables in the tX.txt.


## How the script work

* Step 1: Set the file and path variables

* Step 2: Use the read.table function to read the dataset and label vector to the variables. the main variables are X.tr and X.ts, which indicate the the X_train.txt and X_test.txt respectively.


* Step 3: use gsub function to instead the Activities numbers with the Activity name, and use the names in the feature file to replace the names of columns of X.tr and X.ts.

* Step 4: extracts only the measurements variables on the mean and standard deviation for each measurement.
* Step 5: bing the Subject and Activity columns to the master datasets.

* Step 6: use the rbing function to merges the training and the test sets to create one data set.
* Step 7: use the melt and dcast function to creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Step 8: use the write.table function to save the new dataset to the file "tX.txt"


## Code book

The following descriptions of the 8 variables in the new dataset.

* Subject: the element identifies the subject who performed the activity for each window sample.
* Activity: the class labels with their activity name.
* tBodyAcc-mean()-X: the average of the mean value of the body accelerometer X axis for each activity and each subject.
* tBodyAcc-mean()-Y: the average of the mean value of the body accelerometer Y axis for each activity and each subject.
* tBodyAcc-mean()-Z: the average of the mean value of the body accelerometer Z axis for each activity and each subject.
* tBodyAcc-std()-X: the average of the standard deviation value of the body accelerometer X axis for each activity and each subject.
* tBodyAcc-std()-Y: the average of the standard deviation value of the body accelerometer Y axis for each activity and each subject.
* tBodyAcc-std()-Z: the average of the standard deviation value of the body accelerometer Z axis for each activity and each subject.
