# Code Book

## Data source

The data has been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For information about the experiment and the way data was collected, please read README.txt contained in the data source zip file.

## Variables

All the column names are described in README.txt data source zip file, except for the following columns that were added:

* subjectnumber: the string that corresponds to the subject of the experiment
* activity: a string that represent the activity of the subject while collecting data points

Because run_analysis was coded without hardcoding any column names or positions, here are the rules applied by run_analysis.R in order to get clean column names: it removes "(" and ")" and lowercase original feature names.

For example, tBodyAcc-mean()-X` becomes tbodyacc-mean-x`.

# Output

* tidy_data.txt: a space-delimited value file that contains mean and standard deviation for each measurements from the train and test data,
* average_data.txt: a space-delimited value file that contains tidy data set with the average of each variable for each activity and each subject

If you want to load those files using R, use the following commands:

```
read.table('tidy_data.txt')
read.table('average_data')
```