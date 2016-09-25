==================================================================
Course Project for “Getting and Cleaning Data” - 
Human Activity Recognition (HAR) Using Smartphones Dataset
==================================================================
Submitted by Hal Barge 
(on Github as “Alessandro-G”)

==================================================================
This repo contains my submission for the final project for course 3 - Getting and Cleaning Data.
It includes this README file; an R script called run_analysis.R; the data frame produced in step 5 of the project (called finalHARdata.txt); and a codebook describing the variables in the data frame. 

==================================================================
GUIDE for those reviewing for grading: this section describes how my submissions meet the grading criteria.

(1) The submitted data set is tidy.
The data set is tidy because:
(a) Each variable occupies one column. The variables include the subject identifier, the activity performed, the 33 “mean” features, and the 33 “standard deviation” features for the data provided in the data set.
(b) Each row represents one observation. Each row is a unique subject / activity observation set of the means of all the data provided, as described in step 5. 
(c) The data frame represents only one kind of data observations.

(2) The Github repo contains the required scripts.
The required R script is contained in the file named “run_analysis.R”.  

(3) GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
The codebook includes some explanation of the experiment provided by the data set itself, and further elaborates on how the variable in the data set (called “features”) were modified by me during the data analysis. This includes specifying which feature data was deleted (not needed), which was retained, and how I renamed the variables to make them more understandable. There is more on naming in the codebook, but basically I assigned variable names which included real words (instead of abbreviations) that are descriptive of the data in this smartphone experiment.

(4) The README that explains the analysis files is clear and understandable.
You are reading it now - I hope it’s clear and understandable. 

(5) The work submitted for this project is the work of the student who submitted it.
I did all of this myself.

DATA COLLECTION
The data was collected by downloading it from the HAR website referred to in the assignment (URL = 
“https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”.
I stored it in a local directory and then read it into R-Studio for analysis.

DATA ANALYSIS
First, I read all of the documentation provided with the data to understand both the data and the intent of the assignment. I examined several of the files in R in order to understand how the data was collected, stored, and expressed, and how it would need to go together. The data provided was larger than needed for the assignment and fragmented into several different files.  

I created the design for the final data frame that would satisfy the assignment, and then figured out how to reshape the existing data into that format. The final data frame is 180 rows x 68 columns, because it lists the mean of all data for each of 30 subjects doing 6 activities (30 x 6 = 180); there is one variable for the subject identifier, one for the activity identifier, and 66 data rows (33 for means and 33 for std-deviations). 

The sequence of data shaping to go from raw data to final data frame is as follows:
* read all files into R as data frames.
* convert the vector with variable (feature) names to a character vector so it can be searched for sorting by means and std-deviations.
* correct some variable names that were lacking the identifier for X Y or Z axis data (this was necessary because the “select” function was stopping on an error since several variable names were identical).
* use the corrected feature vector to name the variable in the training data set.
* extract only the variables related to mean and std-dev.
* bind the training set activity designators (form the 'train/y_train.txt' and 'test/y_test.txt' files in the data set) to the training set data using cbind.
* bind the training set subject ID (provided by the 'train/subject_train.txt' and 'test/subject_test.txt' files in the data set) to the training set data using cbind.
* Repeat and do the same for the “test” data set.
* Merge the two data frames together to create a full data set (10,299 rows x 68 columns).
* arrange the data frame, first by subject, then by activity.
* rename activities with descriptive names (provided by the 'activity_labels.txt' file in the data set).
* create a vector with descriptive variable names.
* use the new vector to rename the data set with descriptive variable names. 
* use “group_by” to group the data for step 5.
* use “summarize_each” to perform a mean calculation on each column (variable) for each subject / activity combination.
* display the data frame for step 5 (called “final data” in the script, called “finalHARdata.txt” in the repo.


EXPERIMENT DESIGN INFO
The following section quotes from the README.txt file provided with the data set and describes how the experiment was designed and how the raw data was collected.


Quote:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
