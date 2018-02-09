# Getting-and-Cleaning-Data
Peer Graded Assignment - Creating a Tidy Dataset

##UCI HAR DATASET 
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### The Repo contains the following 

- CodeBook.md : Containing the variables and summaries calculated and transformations performed to clean up the data.
- run_analysis.R : R script for performing the analysis
- Output_Data.txt : Text file containing the Independent Tidy Dataset

### REQUIRED PACKAGES (Should be installed and loaded before running the R script)

- dplyr
- reshape2

##ALGORITHM

1. Read the test and training dataset values.
2. Merge the training and test dataset to create a complete dataset for analysis.
3. Extract the mean and standard deviation feature varibles.
4. Name the activities using the descriptive acitivity labels.
5. Label the dataset with descriptive variable names.
6. Create an independent tidy dataset

### The R script directly writes the resultant dataset to the working directory. 

## Thank You  