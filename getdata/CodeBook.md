---
title: "Samsung Project Code Book"
author: "D.Zinoviev"
date: "06/17/2015"
output:
  html_document:
    keep_md: yes
---
## Project Description
The data set was obtained by recording the acceleration and angular velocity of 30 subjects wearing a smartphone on the waist and performing different activities.

###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The raw dataset contains 561 variables that are described in the original file *features_info.txt*.

###Notes on the original (raw) data 
The original dataset has been randomly partitioned into two sets, where 70% of the subjects was selected for generating the training data and 30% the test data.

##Creating the tidy datasets
There are two tidy data sets produced in the project.

The first dataset has been formed by merging the training and testing datasets, and adding subject IDs, activity descriptions, and descriptive variable names.

The second dataset has been formed from the first dataset by calculating the mean value of each variable (except for the activity and subject ID) grouped by the activity type and subjectID.

No transformations have been applied to the original variables, except for those explicitly mentioned above.

##Description of the variables in the tidy datasets
Both tidy datasets have the same 70 variables.

The rows in the first tidy dataset are individual observations recorded for random combinations of 30 subjects and 6 activities. The rows in the second dataset are aggregated (mean) observations, one per each combination of a subject and an activity, the total of 180 observations.

Variable 1: The subject ID, an integer number in the range 1-30.

Variable 2: Activity, a factor, possible values *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*.

Variables 3-70: Sensor data are real numbers captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. All variables have been normalized and bounded within [-1,1].

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals.

All sensor variable names have the following structure (the *?* denotes an optional name component):

*(domain)(object)(source)(type)?.form(.dimension)?*

| Field | Meaning 
| ----- | ------- 
| domain | t - time, f - frequency (after FFT)
| object | Body - body acceleration signals; Gravity - gravity acceleration signals
| source | Gyro - gyroscope, Acc - accelerometer
| type | Jerk - Jerk signals, JerkMag - Euclidian norms of Jerk signals
| form | Mean - the mean value; StdDev  - the standard deviation
| dimension | X, Y, Z components

### Complete List of Variables
1. Subject
2. Activity
3. tBodyAcc.Mean.X
4. tBodyAcc.Mean.Y
1. tBodyAcc.Mean.Z
1. tBodyAcc.StdDev.X
1. tBodyAcc.StdDev.Y
1. tBodyAcc.StdDev.Z
1. tGravityAcc.Mean.X
1. tGravityAcc.Mean.Y
1. tGravityAcc.Mean.Z
1. tGravityAcc.StdDev.X   
1. tGravityAcc.StdDev.Y
1. tGravityAcc.StdDev.Z
1. tBodyAccJerk.Mean.X    
1. tBodyAccJerk.Mean.Y
1. tBodyAccJerk.Mean.Z
1. tBodyAccJerk.StdDev.X  
1. tBodyAccJerk.StdDev.Y  
1. tBodyAccJerk.StdDev.Z  
1. tBodyGyro.Mean.X       
1. tBodyGyro.Mean.Y  
1. tBodyGyro.Mean.Z  
1. tBodyGyro.StdDev.X     
1. tBodyGyro.StdDev.Y  
1. tBodyGyro.StdDev.Z  
1. tBodyGyroJerk.Mean.X   
1. tBodyGyroJerk.Mean.Y  
1. tBodyGyroJerk.Mean.Z  
1. tBodyGyroJerk.StdDev.X
1. tBodyGyroJerk.StdDev.Y  
1. tBodyGyroJerk.StdDev.Z  
1. tBodyAccMag.Mean       
1. tBodyAccMag.StdDev  
1. tGravityAccMag.Mean  
1. tGravityAccMag.StdDev  
1. tBodyAccJerkMag.Mean  
1. tBodyAccJerkMag.StdDev  
1. tBodyGyroMag.Mean      
1. tBodyGyroMag.StdDev  
1. tBodyGyroJerkMag.Mean  
1. tBodyGyroJerkMag.StdDev
1. fBodyAcc.Mean.X  
1. fBodyAcc.Mean.Y 
1. fBodyAcc.Mean.Z       
1. fBodyAcc.StdDev.X  
1. fBodyAcc.StdDev.Y  
1. fBodyAcc.StdDev.Z      
1. fBodyAccJerk.Mean.X  
1. fBodyAccJerk.Mean.Y  
1. fBodyAccJerk.Mean.Z    
1. fBodyAccJerk.StdDev.X  
1. fBodyAccJerk.StdDev.Y  
1. fBodyAccJerk.StdDev.Z  
1. fBodyGyro.Mean.X  
1. fBodyGyro.Mean.Y  
1. fBodyGyro.Mean.Z       
1. fBodyGyro.StdDev.X  
1. fBodyGyro.StdDev.Y  
1. fBodyGyro.StdDev.Z    
1. fBodyAccMag.Mean  
1. fBodyAccMag.StdDev  
1. fBodyAccJerkMag.Mean 
1. fBodyAccJerkMag.StdDev  
1. fBodyGyroMag.Mean  
1. fBodyGyroMag.StdDev    
1. fBodyGyroJerkMag.Mean  
1. fBodyGyroJerkMag.StdDev

## Note
I have used the Code Book template developed by JorisSchut and available on GitHub: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41.