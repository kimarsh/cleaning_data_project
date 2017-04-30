# Getting and Cleaning Data Class Project
Data for the project were downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The "UCI HAR Dataset" folder was extracted into the working directory.

The script "run_analysis.R" pulls out the data files needed to complete the course project. It:
1. imports several tables

	a. from the "test" folder:

		i. X_test.txt: contains all measurements recorded by subjects' phones

		ii. subject_test.txt: contains the list of subjects in the test dataset. Each row in this file corresponds to one row in the X_test file. Subjects in the research project were assigned numeric IDs from 1-30.
		
		iii. y_test.txt: contains the list of activities in the test dataset. Each row in this file corresponds to one row in the X_test file. Activities are numbered from 1-6 and stand for: 1-walking; 2-walking_upstairs; 3-walking_downstairs; 4-sitting; 5-standing; 6-laying.
	
	b. from the "training" folder:
		
		i. X_train.txt: contains all measurements recorded by subjects' phones
		
		ii. subject_train.txt: contains the list of subjects in the test dataset. Each row in this file corresponds to one row in the X_train file. Subjects in the research project were assigned numeric IDs from 1-30.
		
		iii. y_train.txt: contains the list of activities in the test dataset. Each row in this file corresponds to one row in the X_train file. Activities are numbered from 1-6 and stand for: 1-walking; 2-walking_upstairs; 3-walking_downstairs; 4-sitting; 5-standing; 6-laying.
	
	c. from the main "UCI HAR Dataset" folder:
		
		i. features.txt: contains the list of variable names measured during the original research. There are 561 rows in this file, which correspond to the 561 columns in each of the X_test and X_train files. This file was used to assign variable names to the imported datasets.
		
		ii. activity_labels.txt: not actually used inside the script; but this file provides descriptive variable names for the activities in the datasets.

2. assigns variable names to each column based on the researchers' original variable names ("features.txt");
3. appends rows containing subject ID and activity ID based on other files in the original zip download ("subject_test.txt" and "subject_train.txt" for subject IDs; "y_test.txt" and "y_train.txt" for activity IDs);
4. selects only columns that contain "mean()" or "std()" in the variable name, resulting in 66 columns containing measurement data (the "subject" and "activity" columns bring the total number of columns to 68);
5. combines the "test" and "training" datasets into one dataset named "combined";
6. calculates a mean of every measurement type for each subject/activity combination;
and 
7. writes a text file named "variable_averages.txt", which contains a tidy dataset of those averages in a wide data format (two ID columns: subject and activity, plus 66 columns: one of each measured variable), to the working directory. 

The text file can be read into R with the following code:
variable_averages <- read.table("variable_averages.txt", header=TRUE)

More details on variables are available in the Codebook for this project.
