# setup working directory
working_dir <- "F://Work"
prev_dir <- getwd()
setwd(working_dir)

# download zip file containing data if it hasn't already been downloaded
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

# unzip zip file containing data if data directory doesn't already exist
dataPath <- "UCI HAR Dataset"

if (!file.exists(dataPath)) {
  unzip(zipFile)
}

setwd(prev_dir)
