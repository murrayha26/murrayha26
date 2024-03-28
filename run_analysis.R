# Load required libraries
library(dplyr)
library(data.table)

# Check if the file exists, if not, download it
if (!file.exists("UCI HAR Dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip", method = "curl")
}

# Unzip the data files
unzip("UCI HAR Dataset.zip")

# Read in the X_test dataset
x.test <- read.csv("UCI HAR Dataset//test//X_test.txt", sep="",
                   header=FALSE)

# Read in the y_test data file (6 activities)
y.test <- read.csv("UCI HAR Dataset//test//y_test.txt", sep="",
                   header=FALSE)

# Read in the test subject dataset (30 Subjects)
subject.test <- read.csv("UCI HAR Dataset//test//subject_test.txt",
                         sep="", header=FALSE)

# Merge the test datasets into a single dataframe
test <- data.frame(subject.test, y.test, x.test)

# Read in the X_train dataset
x.train <- read.csv("UCI HAR Dataset//train//X_train.txt", sep="",
                    header=FALSE)

# Read in the y_train data
y.train <- read.csv("UCI HAR Dataset//train//y_train.txt", sep="",
                    header=FALSE)

# Read in the subject_train dataset
subject.train <- read.csv("UCI HAR Dataset//train//subject_train.txt",
                          sep="", header=FALSE)

# Merge test training datasets into a single dataframe
train <- data.frame(subject.train, y.train, x.train)

# Combine the training and test running datasets
run.data <- rbind(train, test)

# Remove the files we don't need anymore from
# the environment.
rm(subject.test, x.test, y.test, subject.train,
       x.train, y.train, test, train)

# Read in the features.txt dataset
features <- read.csv("UCI HAR Dataset//features.txt", sep="", header=FALSE)

# Convert the 2nd column into a vector
column.names <- as.vector(features[, 2])

# Replace subject and activity column names
colnames(run.data) <- c("subject_id", "activity_labels", column.names)

# Use the select function to gather just the columns that contain mean or std.
# Exclude columns with freq and angle in the name via -contains function.
run.data <- select(run.data, contains("subject"), contains("label"),
                   contains("mean"), contains("std"), -contains("freq"),
                   -contains("angle"))

# Read in the activity labels dataset
activity.labels <- read.csv("UCI HAR Dataset//activity_labels.txt", 
                            sep="", header=FALSE)

# convert the activity codes in the new combined dataset with the labels
#from the activity labels dataset.
run.data$activity_labels <- as.character(activity.labels[
  match(run.data$activity_labels, activity.labels$V1), 'V2'])

# Simplify the column names. Remove all parentheses and hyphens
# from column names. Correct the columns that show as BodyBody 
# sub with Body

setnames(run.data, colnames(run.data), gsub("\\(\\)", "", colnames(run.data)))
setnames(run.data, colnames(run.data), gsub("-", "", colnames(run.data)))
setnames(run.data, colnames(run.data), gsub("BodyBody", "Body", colnames(run.data)))


# Group the running data by subject and activity, then
# calculate the mean of every measurement.
run.data.summary <- run.data %>%
  group_by(subject_id, activity_labels) %>%
  summarise_each(funs(mean))

# ------------------ Write tidy data file -------------------------------
write.table(run.data.summary, "UCI HAR Dataset//tidy.txt", row.names = FALSE, quote = FALSE)