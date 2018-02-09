# **UCI HAR DATASET**
* test: Contains the test data set
* train: Contains the training data set
* activity_labels.txt: Activity labels 
* features.txt: Variable names for test and training data set values
* features_info.txt: Information about the variables consisting of appropriate test and training values for each activity and subject.
* README.txt: Description about the Data set
---
# **ATTRIBUTES USED IN THE R SCRIPT** 
## TEST DATA SET
- *X_test:* Test data set containing values derived and calculated during the research/experiment.
- *Y_test:* Test activity Labels used for the experiment.
- *Subject_test:* Test subjects performing the activities for each window sample ranging from 1 to 30.
- *Merge_test:* Single data frame consisting of multiple data frames (X_test, Y_test & Subject_test) arranged in a proper way.

## TRAINING DATA SET
- *X_train:* Training data set containing the values derived and calculated during the research/experiment.
- *Y_train:* Training activity labels used for the experiment.
- *Subject_train:* Training subjects performing the activities for each window sample ranging from 1 to 30. 
- *Merge_train:* Single data frame consisting of multiple data frames (X_train, Y_train & Subject_train) arranged in a proper way 

**Y_test & Y_train**
* 1 – Walking
* 2 – Walking_Upstairs
* 3 – Walking_Downstairs
* 4 – Sitting
* 5 – Standing
* 6 – Laying

- *Features:* Variable names for both test and training data set values

**Common terms used in the experiment**
1. t: Time
2. f: Frequency domain signals
3. Acc: Accelerometer
4. Gyro: Gyroscope
5. Mag: Magnitude
6. mean (): Mean value
7. std (): Standard Deviation 
8. -XYZ: 3-axial signals in the X, Y & Z directions 

## SIGNALS USED TO ESTIMATE VARIABLES OF THE FEATURE VECTOR FOR EACH PATTERN

1. tBodyAcc-XYZ		: Time_Body_Accelerometer-XYZ
2. tGravityAcc-XYZ	: Time_Gravity_Accelerometer-XYZ
3. tBodyAccJerk-XYZ	: Time_Body_AccelerometerJerk-XYZ
4. tBodyGyro-XYZ	: Time_Body_Gyroscope-XYZ
5. tBodyGyroJerk-XYZ	: Time_Body_GyroscopeJerk-XYZ
6. tBodyAccMag		: Time_Body_Accelerometer_Magnitude
7. tGravityAccMag	: Time_Gravity_Accelerometer_Magnitude
8. tBodyAccJerkMag	: Time_Body_Accelerometer_Jerk_Magnitude
9. tBodyGyroMag		: Time_Body_Gyroscope_Magnitude
10. tBodyGyroJerkMag	: Time_Body_Gyroscope_Jerk_Magnitude
11. fBodyAcc-XYZ	: Frequency_Body_Accelerometer-XYZ
12. fBodyAccJerk-XYZ	: Frequency_Body_AccelerometerJerk-XYZ
13. fBodyGyro-XYZ	: Frequency_Body_Gyroscope-XYZ
14. fBodyAccMag		: Frequency_Body_Accelerometer_Magnitude
15. fBodyAccJerkMag	: Frequency_Body_Accelerometer_Jerk_Magnitude
16. fBodyGyroMag	: Frequency_Body_Gyroscope_Magnitude
17. fBodyGyroJerkMag	: Frequency_Body_Gyroscope_Jerk_Magnitude
18. tBodyAccMean	: Time_Body_Accelerometer_Mean
19. tBodyAccJerkMean	: Time_Body_Accelerometer_Jerk_Mean
20. tBodyGyroMean	: Time_Body_Gyroscope_Mean
21. tBodyGyroJerkMean	: Time_Body_Gyroscope_Jerk_Mean

## SET OF VARIABLES ESTIMATED FROM THE ABOVE SIGNALS

1. mad()		: Median absolute deviation
2. max()		: Largest value in array
3. min()		: Smallest value in array
4. sma()		: Signal magnitude area
5. energy()		: Energy measure. Sum of the squares divided by the number of values
6. iqr()		: Interquartile range
7. entropy()		: Signal entropy
8. arCoeff()		: Auto-regression coefficients with Burg order equal to 4
9. correlation()	: Correlation coefficient between two signals
10. maxInds()		: Index of the frequency component with largest magnitude
11. meanFreq()		: Weighted average of the frequency components to obtain a mean frequency 
12. skewness()		: Skewness of the frequency domain signal
13. kurtosis()		: Kurtosis of the frequency domain signal
14. bandsEnergy()	: Energy of a frequency interval within the 64 bins of the FFT of each window
15. angle()  		: Angle between two vectors

# DATA OPERATIONS THAT WERE PERFORMED ON THE DATA SET TO PRODUCE THE OUTPUT
## Step_1
1. Initially the Test and Training data sets were read into the R workspace using read.table
2. Column binding operations were performed using cbind to create a single data frame for test and training data values.

## Step_2 (MERGE OF TRAINING & TEST SETS TO CREATE A COMPLETE DATA SET
1. Training and Test data sets were merged to create one complete data set using rbind.
	- Complete_Data: Single data frame consisting of training and test data sets.

## Step_3 (EXTRACT ONLY THE MEASUREMENTS ON THE MEAN & STANDARD DEVIATION FOR EACH MEASUREMENT)
*REQUIRED PACKAGE: dplyr
1. To complete this, I used the concept of grep command to extract the index values related to the mean & standard deviation measurements of the feature variables stored in the workspace.
	- Mean: numeric vector containing the index values of mean ().
	- Std: numeric vector containing the index values of std ().
2. A temporary variable was created to store only the training and test feature values (exception is application to the column values of Window_samples and Activity_labels) of the merged data set
	- Window_samples: Contains the subject values for each window samples ranging from 1 to 30.
	- Activity _labels: labels for the activities performed during the experiment.
	- Temp_Data: Consists of training and test feature data values.
3. Using the derived index values measurements on the mean and standard deviation were extracted and merged with the column values of Window_samples and Activity_labels.
	- Complete_Data: Contains the extracted data set 

## Step_4 (USE DECRIPTIVE ACTIVITY LABELS TO NAME THE ACTIVITIES IN THE DATA SET)
1. Made use of loop condition to match the values mentioned in the Activity_labels and name the activities appropriately.

## Step_5 (LABEL THE DECRIPTIVE VARIABLE NAMES)
1. grep command was used to label the descriptive variable names.
	- Complete_Data: Contains the tidy data set

### From my perspective I think I have tried my level best to produce the tidy data because
- Each variable is in one column.
- Each different observation of that variable is in a different row.
- One table for each kind of variable.

## Step_6 (INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND SUBJECT)
*REQUIRED PACKAGE: reshape2
1. Firstly, Tidy data set was melted to create a molten data frame to calculate the average.
	- Tidy_Data: Molten data set.
2. Concept of casting in R was used to determine the average of each variable for each activity and subject separately.
	- Output_Data: Single Independent data set with the average of each feature variable for each activity and each subject.

