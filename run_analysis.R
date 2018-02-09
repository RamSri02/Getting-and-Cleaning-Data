###READ THE SOURCE DATA FOR MANIPULATION

	##READ THE TEST & TRAINING DATA FILES IN TABLE FORMAT AND CREATES A DATAFRAME FROM IT
	#Test Data
		#X_test <- read.table("C:/Users/srira/OneDrive/Documents/UCI HAR DATASET/test/X_test.txt")
		#Y_test <- read.table("C:/Users/srira/OneDrive/Documents/UCI HAR DATASET/test/y_test.txt")
		#Subject_test <- read.table("C:/Users/srira/OneDrive/Documents/UCI HAR DATASET/test/subject_test.txt")

    X_test <- read.table("UCI HAR DATASET/test/X_test.txt")
    Y_test <- read.table("UCI HAR DATASET/test/y_test.txt")
    Subject_test <- read.table("UCI HAR DATASET/test/subject_test.txt")
    
	#Training Data
		#X_train <- read.table("C:/Users/srira/OneDrive/Documents/UCI HAR DATASET/train/X_train.txt")
		#Y_train <- read.table("C:/Users/srira/OneDrive/Documents/UCI HAR DATASET/train/y_train.txt")
		#Subject_train <- read.table("C:/Users/srira/OneDrive/Documents/UCI HAR DATASET/train/subject_train.txt")
    
		X_train <- read.table("UCI HAR DATASET/train/X_train.txt")
		Y_train <- read.table("UCI HAR DATASET/train/y_train.txt")
		Subject_train <- read.table("UCI HAR DATASET/train/subject_train.txt")
	
	##BINDING OF MULTIPLE DATA FRAMES
	#Test Data
		Initial_test <- cbind(Y_test, X_test)
		Merge_test <- cbind(Subject_test, Initial_test) 

	#Training Data 
		Initial_train <- cbind(Y_train, X_train)
		Merge_train <- cbind(Subject_train, Initial_train)

###STEP_1 - MERGE OF TRAINING & TEST SETS TO CREATE ONE COMPLETE DATA SET

	Complete_Data <- rbind(Merge_train, Merge_test) 

###STEP_2 - EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT
	
	##Read the Feature.txt file containing the descriptive variables
	  #Features <- read.table("C:/Users/srira/OneDrive/Documents/UCI HAR DATASET/features.txt")
	  Features <- read.table("UCI HAR DATASET/features.txt")
	  
	##Assign the value of Features to the Column names of X_test
		colnames(X_test) <- Features$V2

	##Select the mean and standard deviation measurements for final data set
		Mean <- grep("-mean()", colnames(X_test))
		Std <- grep("-std()", colnames(X_test))
		
		colnames(Complete_Data)[1:2] <- c("Window_samples", "Activity_labels")
		
		Temp_Data <- select(Complete_Data, -Window_samples, -Activity_labels)
		Temp_Data <- select(Temp_Data, Mean, Std)
		Complete_Data <- cbind(select(Complete_Data, Window_samples, Activity_labels), Temp_Data)
    		
###STEP_3 - USE DESCRIPTIVE ACTIVITY LABELS TO NAME THE ACTIVITIES IN THE DATA SET
		
		for(i in 1:nrow(Complete_Data))
		{
			if(Complete_Data[i, 2] == 1)
			{
				Complete_Data[i, 2] <- "Walking"
			}
			else if(Complete_Data[i, 2] == 2)
			{
				Complete_Data[i, 2] <- "Walking_Upstairs"
			}
			else if(Complete_Data[i, 2] == 3)
			{
				Complete_Data[i, 2] <- "Walking_Downstairs"
			}
			else if(Complete_Data[i, 2] == 4)
			{
				Complete_Data[i, 2] <- "Sitting"
			}
			else if(Complete_Data[i, 2] == 5)
			{
				Complete_Data[i, 2] <- "Standing"
			}
			else if(Complete_Data[i, 2] == 6)
			{
				Complete_Data[i, 2] <- "Laying"
			}
		}

###STEP_4 - LABEL THE DESCRIPTIVE VARIABLE NAMES
		
		colnames(Complete_Data)[3:81] <- c(grep("-mean()", colnames(X_test), value = TRUE), grep("-std()", colnames(X_test), value = TRUE))
		Complete_Data <- select(Complete_Data, -contains("-meanFreq()"))

	##Molten Data set
		Tidy_Data <- melt(Complete_Data, id = c("Window_samples", "Activity_labels"))

###STEP_5 - INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY & EACH SUBJECT

		Output_Data <- dcast(Tidy_Data, Window_samples + Activity_labels ~ variable, mean)
    write.csv(Output_Data, file = "Output_Data.txt", row.names = FALSE)