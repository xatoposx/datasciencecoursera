# Project for *Getting and Cleaning Data* JHU MOOC Course (May 2014)

The purpose of this project is to get two tidy data sets from the raw data provided under the name *Human Activity Recognition Using Smartphones Dataset* [1]. Fundamental decisions to get the tidy data sets are commented below.

## Files included in this set 

`README.txt`

`CodeBook.md` 
:    Shows information about tidy data sets and decisions to produce them.

`run_analysis.R`
:    R script to completely reproduce the steps to obtain the tidy datasets from the URL that provides the upstream (raw) data.

`data.txt`
:    Main tidy dataset.

`data_avgs.txt`
:    Tidy dataset from the above main set with the average of each variable for each activity and each subject.


## Basic decisions to get the main tidy data set

This section summarizes the basic decisions made to get the final datasets. See `CodeBook.md` for more details. 

### Upstream files of interest

Upstream data, as it is delivered by JHU via a compressed archive (see URL below [2]), includes multiple datasets and documentation texts scattered across multiple files. See upstream `README.txt` for more information about these files.

From these files we discard all of those under `Inertial Signals` directories, since they consist of datasets that collect low level measures used in the other datasets within the archive where more appropriate measures for further analysis are provided. Also, most of the documentations texts are discarded. Therefore, the upstream files we are going to work on are the following:

`UCI HAR Dataset/activity_labels.txt`
:    Links the class labels with their activity name.

`UCI HAR Dataset/features.txt`
:    List of all features.

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

### Final dataset shape

Our goal is to produce a single data set from the upstream data recorded in the files commented above. This is done by merging train and test sets, and binding the three resulting sets as columns of a single set. Consequently, he final `data` set has this shape:

    "subject"       |  "activity"  |   [features_data]
    ==================================================
    subject_train   |  y_train     |   X_train
    --------------------------------------------------
    subject_test    |  y_test      |   X_test

Another set `data_avgs` is provided as commented in the first section.

### Subsetting

From the features included in the upstream data we select only those containing information about mean and standard deviation. We have decided to keep these measures in pair (for further pairwise analysis). Consequently, we haven't include means recorded under features called `meanFreq` by upstream, as they the corresponding std measure is not provided.

### Other cleaning

Over these sets more cleaning is applied, particularly:

* Variables are recoded as numeric for all feature variables, and as categorical ("character" type) for subject and activity.

* Names for the filtered feature variables are recoded without abbreviations and punctuation signs. Also, a typo in the original data is fixed.

* Numerical codes for activities in upstream datasets are replaced with human readable labels.

### Footnotes

[1] Upstream data citation:

    Human Activity Recognition Using Smartphones Dataset
    Version 1.0

    Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
    Smartlab - Non Linear Complex Systems Laboratory
    DITEN - Universita degli Studi di Genova.
    Via Opera Pia 11A, I-16145, Genoa, Italy.
    activityrecognition@smartlab.ws
    www.smartlab.ws

[2] JHU compressed tarball URL:

https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip



