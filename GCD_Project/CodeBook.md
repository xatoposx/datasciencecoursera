# CodeBook

## Data collection

### Upstream data collection description 
This summary reproduces the description presented in the upstream `README.txt` and `features_info.txt` files. 

> [Data come from] experiments [...] carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. [These raw data are provided under the `Inertial Signals` subdirectories in the upstream archive under the names `tAcc-XYZ` and `tGyro-XYZ`].

> [...] Then [resulting measures] were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`timeBodyAcceleration-XYZ` and `timeGravityAcceleration-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`timeBodyAccelerationJerk-XYZ` and `timeBodyGyroscopeJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`timeBodyAccelerationMagnitude`, `timeGravityAccelerationMagnitude`, `timeBodyAccelerationJerkMagnitude`, `timeBodyGyroscopeMagnitude`, `timeBodyGyroscopeJerkMagnitude`). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing [frequency domain signals:] `frequencyBodyAcceleration-XYZ`, `frequencyBodyAccelerationJerk-XYZ`, `frequencyBodyGyroscope-XYZ`, [`frequencyBodyAccelerationMagnitude`], `frequencyBodyAccelerationJerkMagnitude`, `frequencyBodyGyroscopeMagnitude`, `frequencyBodyGyroscopeJerkMagnitude`.

> The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Variables selected for our tidy sets
We discard for our data sets all the low level data under `Inertial Signals` directories. We are only interested in the results that upstream researches have produced after pre-processing the initial data. 

Furthermore, we are only interested in the estimated mean and standard deviation measures that upstream researches have computed. Also, we have decided to keep these measures in pair (for further pairwise analysis). For this reason we have not included estimated means recorded under features called `meanFreq` by upstream nor those related to averaged signal measures used on the `angle()` variable.

## Summary of final variables
`subject`
:    subject for which the observation is made (categorical variable)

`activity`
:    activity on which the observation is recorded (categorical variable, with levels:  "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

The following variables are the remaining numerical variables in our final sets:

`timeBodyAccelerationMeanX`, `timeBodyAccelerationMeanY`, `timeBodyAccelerationMeanZ`, `timeBodyAccelerationStdX`, `timeBodyAccelerationStdY`, `timeBodyAccelerationStdZ`
:    estimated mean and standard deviation of time domain 
     body acceleration signals for x, y and z axis respectively.

`timeGravityAccelerationMeanX`, `timeGravityAccelerationMeanY`, `timeGravityAccelerationMeanZ`, `timeGravityAccelerationStdX`, `timeGravityAccelerationStdY`, `timeGravityAccelerationStdZ`
:    estimated mean and standard deviation of time domain gravity acceleration signals for x, y and z axis respectively.

`timeBodyAccelerationJerkMeanX`, `timeBodyAccelerationJerkMeanY`, `timeBodyAccelerationJerkMeanZ`, `timeBodyAccelerationJerkStdX`, `timeBodyAccelerationJerkStdY`, `timeBodyAccelerationJerkStdZ`
:    estimated mean and standard deviation of Jerk signals from time domain body linear acceleration for x, y and z axis respectively.

`timeBodyGyroscopeMeanX`, `timeBodyGyroscopeMeanY`, `timeBodyGyroscopeMeanZ`, `timeBodyGyroscopeStdX`, `timeBodyGyroscopeStdY`, `timeBodyGyroscopeStdZ`
:    estimated mean and standard deviation of time domain body gyroscope signals for x, y and z axis respectively.

`timeBodyGyroscopeJerkMeanX`, `timeBodyGyroscopeJerkMeanY`, `timeBodyGyroscopeJerkMeanZ`, `timeBodyGyroscopeJerkStdX`, `timeBodyGyroscopeJerkStdY`, `timeBodyGyroscopeJerkStdZ`
:    estimated mean and standard deviation of Jerk signals from time domain angular velocity for x, y and z axis.

`timeBodyAccelerationMagnitudeMean`, `timeBodyAccelerationMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of time domain body acceleration signals.

`timeGravityAccelerationMagnitudeMean`, `timeGravityAccelerationMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of time domain gravity acceleration signals.

`timeBodyAccelerationJerkMagnitudeMean`, `timeBodyAccelerationJerkMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of Jerk signals from time domain body linear acceleration.

`timeBodyGyroscopeMagnitudeMean`, `timeBodyGyroscopeMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of time domain body gyroscope signals.

`timeBodyGyroscopeJerkMagnitudeMean`, `timeBodyGyroscopeJerkMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of Jerk signals from time domain angular velocity.

`frequencyBodyAccelerationMeanX`, `frequencyBodyAccelerationMeanY`, `frequencyBodyAccelerationMeanZ`, `frequencyBodyAccelerationStdX`, `frequencyBodyAccelerationStdY`, `frequencyBodyAccelerationStdZ`
:    estimated mean and standard deviation of frequency domain body acceleration signals for x, y and z axis respectively.

`frequencyBodyAccelerationJerkMeanX`, `frequencyBodyAccelerationJerkMeanY`, `frequencyBodyAccelerationJerkMeanZ`, `frequencyBodyAccelerationJerkStdX`, `frequencyBodyAccelerationJerkStdY`, `frequencyBodyAccelerationJerkStdZ`
:    estimated mean and standard deviation of Jerk signals from frequency domain body linear acceleration for x, y and z axis respectively.

`frequencyBodyGyroscopeMeanX`, `frequencyBodyGyroscopeMeanY`, `frequencyBodyGyroscopeMeanZ`, `frequencyBodyGyroscopeStdX`, `frequencyBodyGyroscopeStdY`, `frequencyBodyGyroscopeStdZ`
:    estimated mean and standard deviation of frequency domain body gyroscope signals for x, y and z axis respectively.

`frequencyBodyAccelerationMagnitudeMean`, `frequencyBodyAccelerationMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of frequency domain body acceleration signals.

`frequencyBodyAccelerationJerkMagnitudeMean`, `frequencyBodyAccelerationJerkMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of Jerk signals from frequency domain body linear acceleration.

`frequencyBodyGyroscopeMagnitudeMean`, `frequencyBodyGyroscopeMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of frequency domain body gyroscope signals.

`frequencyBodyGyroscopeJerkMagnitudeMean`, `frequencyBodyGyroscopeJerkMagnitudeStd`
:    estimated mean and standard deviation of the magnitude of Jerk signals from frequency domain angular velocity.

## Tidy data 
We have performed the following further transformations over the upstream data set
to produce our tidy set (`tidy_data.txt`):

### 1. Merging partial datasets in a single dataset

The upstream actual data includes multiple datasets scattered across multiple files (See README.md for a list of these files). 

From these data files we discard, as commented, all of those under `Inertial Signals` directories. The resulting data files we select are following:

`UCI HAR Dataset/test/subject_test.txt`
:    Subjects in the test set who performed the activity (each row is an observation on a subject, where each subject is identified via an unique integer).

`UCI HAR Dataset/train/subject_train.txt`
:    Same as above for subjects in the train set. 

`UCI HAR Dataset/test/X_test.txt`
:    Test set. Each row is an observation. Each column is the record for a feature in the feature list.

`UCI HAR Dataset/train/X_train.txt`
:    Same as above for the train set.

`UCI HAR Dataset/test/y_test.txt`
:    Test set. Each row records the activity from which the observation is made.

`UCI HAR Dataset/train/y_train.txt`
:    Same as above for the train set.

A single data set is obtained by merging train and test sets, and binding the three resulting subsets as columns of a single set. Therefore, the final `tidy_data` set has this shape:

    "subject"       |  "activity"  |   [features_data]
    ==================================================
    subject_train   |  y_train     |   X_train
    --------------------------------------------------
    subject_test    |  y_test      |   X_test

### 2. Naming variables

Categorical variables are named appropriately as in the previous table. For numerical variables we use the names provided by upstream researches in the file `features.txt` as point of departure. These names are further processed according to the following criteria:

* Punctuation signs are removed.
* Full names are used instead of abbreviations. 
* camelCase convention is used to generate these long names.
* A typo in features 516-554, where the word "Body" appears duplicated, is fixed.

### 3. Recoding activity records

Numerical codes in the upstream data for activities are replaced with human readable labels according to the key given in the upstream file `activity_labels.txt`.

## Data sets included

We include two data sets:

`data`
:    The final data cleaned as commented above.

`data_avgs`
:    Tidy dataset generated from the above main set with the average of each variable for each activity and each subject.

## Citations

* Upstream data citation:

        Human Activity Recognition Using Smartphones Dataset
        Version 1.0

        Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
        Smartlab - Non Linear Complex Systems Laboratory
        DITEN - Universita degli Studi di Genova.
        Via Opera Pia 11A, I-16145, Genoa, Italy.
        activityrecognition@smartlab.ws
        www.smartlab.ws

* JHU URL from which upstream data was downloaded:

    https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip



