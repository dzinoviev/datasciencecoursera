## Analysing the Samsung Data Set

There is only one script in the project (run_analysis.R). The script assumes that the raw data are in the current working directory and in the *test* and *train* subdirectories.

### Data processing steps

- Read the files *X_test.txt*, *y_text.txt*, *subject_text.txt*, *X_train.txt*, *y_train.txt*, *subject_train.txt*, *features.txt*, and *activity_labels.txt* into R data frames.
- Concatenate the rows of the training and testing sets
- Add descriptive column names (taken from *features.txt*)
- Select the columns the contain *mean()* or *std()* substrings
- Concatenate the subject column, activity column, and the mean/stddev variables
- Replace the activity codes with activity descriptions (taken from *activity_labels.txt*)
- Tidy up the column names by removing duplicate *Body* fragments, and replacing dahses with dots and *max()* and *std()* with *Max* and *DtdDev*, respectively.

### Summarization
- Create a summary table by aggregating the original data by subject and activity; the table is in the *wide* format
- Remove the columns used for aggregation, as they have duplicates
- Save the results into a text file *summary.txt*.