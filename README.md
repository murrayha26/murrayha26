# murrayha26
 Coursera Getting and Cleaning Data Programming Assignment

 The script, `run_analysis.R` reads in the processed experiment data and performs a number of steps to get it into summary form.

 - The script begins by locating and unzipping the data files based on the provided URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 - The test and training datasets are read in and merged into one data frame.
 - The test and training files contain Subject info, Activity labels and the actual measurement data collected from the various accellerometers and gyroscopes.
 - The measurement data in the columns are then given names based on the `features.txt` file.
 - Mean and standard deviation measurements are selected from the dataset, while the other measurement columns are excluded from the rest of the analysis.
 - The activity identifiers are replaced with the activity labels based on the `activity_labels.txt` file.
 - The characters (`()` and `-`) are removed from the column names.
 - Duplicate `BodyBody` phrases in column names are replaced with `Body`.
 - The data is then grouped by subject and activity, and the mean is calculated for every measurement column.
 - The summary dataset `run.data.summary` is now tidy and written to a .TXT file: 'tidy.txt'.

### Output File Column Names

The columns included in the output file are listed below:

  - subject_id - The unique ID number of the subject wearing the device being monitored (1 - 30).
  - activity_labels - Descriptive name of the activity being done while measurement is being recoreded. Codes 1 - 6 correspond to Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying.

The remainings 66 columns are the mean means for a particular subject doing a certain activity. The 'features_info.txt' file contains descriptions of the various measures collected in the data files.

  - tBodyAccmeanX
  - tBodyAccmeanY
  - tBodyAccmeanZ
  - tGravityAccmeanX
  - tGravityAccmeanY
  - tGravityAccmeanZ
  - tBodyAccJerkmeanX
  - tBodyAccJerkmeanY
  - tBodyAccJerkmeanZ
  - tBodyGyromeanX
  - tBodyGyromeanY
  - tBodyGyromeanZ
  - tBodyGyroJerkmeanX
  - tBodyGyroJerkmeanY
  - tBodyGyroJerkmeanZ
  - tBodyAccMagmean
  - tGravityAccMagmean
  - tBodyAccJerkMagmean
  - tBodyGyroMagmean
  - tBodyGyroJerkMagmean
  - fBodyAccmeanX
  - fBodyAccmeanY
  - fBodyAccmeanZ
  - fBodyAccJerkmeanX
  - fBodyAccJerkmeanY
  - fBodyAccJerkmeanZ
  - fBodyGyromeanX
  - fBodyGyromeanY
  - fBodyGyromeanZ
  - fBodyAccMagmean
  - fBodyAccJerkMagmean
  - fBodyGyroMagmean
  - fBodyGyroJerkMagmean
  - tBodyAccstdX
  - tBodyAccstdY
  - tBodyAccstdZ
  - tGravityAccstdX
  - tGravityAccstdY
  - tGravityAccstdZ
  - tBodyAccJerkstdX
  - tBodyAccJerkstdY
  - tBodyAccJerkstdZ
  - tBodyGyrostdX
  - tBodyGyrostdY
  - tBodyGyrostdZ
  - tBodyGyroJerkstdX
  - tBodyGyroJerkstdY
  - tBodyGyroJerkstdZ
  - tBodyAccMagstd
  - tGravityAccMagstd
  - tBodyAccJerkMagstd
  - tBodyGyroMagstd
  - tBodyGyroJerkMagstd
  - fBodyAccstdX
  - fBodyAccstdY
  - fBodyAccstdZ
  - fBodyAccJerkstdX
  - fBodyAccJerk_stdY
  - fBodyAccJerkstdZ
  - fBodyGyrostdX
  - fBodyGyrostdY
  - fBodyGyrostdZ
  - fBodyAccMagstd
  - fBodyAccJerkMagstd
  - fBodyGyroMagstd
  - fBodyGyroJerkMagstd
