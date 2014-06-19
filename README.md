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

Check [here](codeBook.md).
