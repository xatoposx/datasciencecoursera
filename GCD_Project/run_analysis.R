# ==============================================================
# ----- R script to get tidy data from the upstream data -------
# ==============================================================

# --------------------------------------------------------------
# TODO:
#
# - Adapt with libraries 'data.table' and 'dplyr' for better 
#   performance.
# ---------------------------------------------------------------

#### Initial working environment
# A new working directory is created to extract the archive.
# This is for convenience. If different versions of the upstream
# data are going to be processed, we need to keep different working
# directories for each one. This is the case when different releases
# are downloaded and multiple directories must have a unique
# name. Uniqueness is guaranteed adding a sys.time numeric value.
upstream <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip"
srcfile  <- "UHD.zip"
date     <- Sys.time()

# FOR PEERS!!!
# For peer reviewing we have commented the following line and provided
# a simpler version instead. Please, change the wkdir assignment if
# you have already a working directory with a different name.

# wkdir   <- file.path("." , paste("UHD", unclass(date), sep=""))
wkdir    <- "UHD"
# ---------------------------------------------------------------

#### Download and decompress dataset
# FOR PEERS!!!
# Uncomment the following two lines if you want to downlaod the data 
# by yourself. If not, this script, as it is, assumes that it resides 
# in the same directory as the zip file, and that the zip file is 
# named UHD.zip. See comment below.
#message("Downloading upstream data...")
#download.file(upstream, dest=srcfile, method="curl") 
# Create directory for decompressing files if it does not exist
if (!file.exists(wkdir)) dir.create(wkdir)

# Decompress
# FOR PEERS!!!
# Uncomment the following lines if you want to unzip the file.
# See also the comment below if you need to adapt things.
#message("Decompressing...")
#!!! unzip(srcfile, exdir=wkdir)

# Change working directory
setwd(wkdir)
# ---------------------------------------------------------------

#### Load data files as data.frames into the working directory
## Get names of files of interest 
# (Data files of interest are .txt files within the datadir
# and within its subdirectoires test and train, excluding 
# the files README.txt and features_info.txt (merely informative)
# Low level data files in subdirs called Inertial Signals/ are
# also uneeded. More info in CodeBook.md)
alldirs <- list.dirs()
dirs    <- alldirs[ grep("Inertial|^[[:punct:]]$", alldirs, invert=TRUE) ]
files   <- dir(dirs, pattern="[[:lower:]].+txt$", full.names=TRUE)
files   <- files[ grep("info", files, invert=TRUE) ] 

# data.frame's names (same as file names without the extension) 
dfnames <- lapply(basename(files), sub, patt="(\\w).txt$", repl="\\1")

# Load files into data.frames, hiding printed output (This may take time!!)
# WARNING:
# We read as character all the data! This is more secure since it avoids
# weird behavior if some observations are not numbers as we expect. For
# instance, automatic conversion to factor (the default read.table
# behavior) would be at work in such cases, causing that further explicit
# conversion to numeric fails or produces meaningless output. (See ?read.table
# for more information).
message("Loading data...")
invisible(mapply(assign, 
		 dfnames, 
		 lapply(files, read.table, colClasses="character"), 
		 pos=".GlobalEnv"))
# ----------------------------------------------------------------

#### Rename things
## Rename feature names 
# 1. No abbrevs
# 2. No weird chars: '-', '(', ')'
# 3. Double 'Body' fixed

# Patterns and replacements
patts  <- c("^t", "^f", "Acc", "Gyro", 
	    "Mag", "\\(|\\)", "-(.)?", "BodyBody")
repls  <- c("time", "frequency", "Acceleration", "Gyroscope", 
	    "Magnitude", "", "\\U\\1", "Body")

# Feature names in the upstream data set
feature_names  <- features[[2]]

# We will only care about mean and std variables. It is easier to find this
# variables by filtering over upstream names
target_features <- feature_names[ grep("mean\\(\\)|std\\(\\)", 
				       feature_names, 
				       ignore.case=TRUE) ]

for (i in 1:length(patts)) {
    feature_names   <- gsub(patts[i], repls[i], feature_names,   perl=TRUE)
    target_features <- gsub(patts[i], repls[i], target_features, perl=TRUE)
}

# If you prefer variable names in lowercase, and spaces (or underscores) 
# separating word instead of camelCase style, exectue, respectively, 
# two of the following commands
#feature_names   <- gsub("([[:upper:]])", " \\L\\1", feature_names, perl=TRUE)
#target_features <- gsub("([[:upper:]])", " \\L\\1", target_features, perl=TRUE)
#feature_names   <- gsub("([[:upper:]])", "_\\L\\1", feature_names, perl=TRUE)
#target_features <- gsub("([[:upper:]])", "_\\L\\1", target_features, perl=TRUE)

## Name columns in data.frames
names(subject_train) <- "subject"
names(subject_test)  <- "subject"
names(y_train)       <- "activity"
names(y_test)        <- "activity"
names(X_train)       <- feature_names 
names(X_test)        <- feature_names
# ----------------------------------------------------------------

#### Construct a single data set
# We want to get a set of this shape
# subject       |  activity  |   [features_data]
# -------------------------------------------
# subject_train |  y_train   |   X_train
# subject_test  |  y_test    |   X_test

# Merge train and test data.frames. ['merge' (or 'join' from dplyr)
# could also be used instead of basic 'rbind', 'cbind']
message("Merging...")
subject       <- rbind(subject_train, subject_test)
activity      <- rbind(y_train,       y_test)
features_data <- rbind(X_train,       X_test)

# Join columns
data <- cbind(subject, activity, features_data[, target_features])

#### Recode activities with human readable labels
# Original codes and corresponding labels 
acodes  <- activity_labels[[1]]
alabels <- activity_labels[[2]]

for (i in as.integer(acodes)) data$activity <- gsub(acodes[i], 
						    alabels[i], 
						    data$activity)
# ----------------------------------------------------------------

#### Convert variables for features to numeric
data[, target_features] <- (lapply(data[, target_features], as.numeric))

# Uncomment the following for viewing the first rows in the final set
# head(data)

#### Create an independent dataset from the previous one
# with the average of each variable for each activity and each subject
message("Generating data_avgs dataset...")
data_avgs <- aggregate(data[, target_features],
		       by=list(subject=data$subject, activity=data$activity), 
		       mean, na.rm=TRUE)
# ----------------------------------------------------------------

#### Produce deliverable data sets
# We want the best possible precision for numeric data
options(digits=15)
write.table(data, file=file.path("..", "data.txt"))
write.table(data_avgs, file=file.path("..", "data_avgs.txt"))

#### ---------------- END OF FILE --------------------------------
