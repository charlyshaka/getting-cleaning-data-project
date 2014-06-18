# Introduction

This repository contains R scripts to merge and tidy data collected from an experiment that was collecting data from the accelerometers Samsung Galaxy S smartphones.

It was a project done during the "Getting and cleaning data" coursera course (started June 2nd, 2014).

# Instructions

## Steps

1. Clone this repository
2. change the working directory to getting-cleaning-data-project/ folder
3. Download the data source zip file
4. Unzip the source zip file: `unzip getdata-projectfiles-UCI\ HAR\ Dataset.zip`
5. Run run_analysis.R

## Steps as commands

Corresponding commands are:

```
git clone https://github.com/saadtazi/getting-cleaning-data-project
cd getting-cleaning-data-project
wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
unzip getdata-projectfiles-UCI\ HAR\ Dataset.zip
R run_analysis.R
```

***These commands have been tested on Mac OSX and might have to be adapted for other operating systems.***

# Output

run_analysis.R generates 2 files:
* tidy_data.txt: a space-delimited value file that contains mean and standard deviation for each measurements from the train and test data,
* average_data.txt: a space-delimited value file that contains tidy data set with the average of each variable for each activity and each subject

I used default params for write.table() so space-delimited, with column names, ... To read those files, use:

```
read.table('tidy_data.txt')
read.table('average_data')
```

## Code Book

# Data source

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For a description of the data source, check features_info.txt contained in the data source zip file.

For information about the experiment and the way data was collected, please read README.txt contained in the data source zip file.

# Variables

All the column names are described in README.txt data source zip file, except for the following columns that were added:

* subjectnumber: the string that corresponds to the subject of the experiment
* activity: a string that represent the activity of the subject while collecting data points

Because run_analysis was coded without hardcoding any column names, here are the rules applied by run_analysis.R in order to get tiday column names: it removes "(" and ")" and lowercase original feature names.