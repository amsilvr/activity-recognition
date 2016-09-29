CODEBOOK 
supporting the script “run_analysis.R” 
written for the course project in Getting and Cleaning Data

submitted by Hal Barge
(on Github as “Alessandro-G”)

============================================================
VARIABLE DESCRIPTIONS

"subject" 
	The identifier for the subject person in the observation.
	Value is an integer from 1 to 30.

"activity"
	The identifier for the activity performed by the subject.
	Value was an integer from 1 to 6 in the raw data, converted as follows in the 	data analysis:
	1 walking
	2 walking upstairs
	3 walking downstairs
	4 sitting
	5 standing
	6 laying


THE NEXT GROUP OF VARIABLES REFER TO THE “MEAN” VALUES OF RAW EXPERIMENTAL DATA OVER SHORT TIME INTERVALS. 
ALL VALUES RANGE FROM -1 TO 1. 

"mean-x-axis-body-acceleration"
"mean-y-axis-body-acceleration"
"mean-z-axis-body-acceleration"
	Mean acceleration due to body movements in the X Y and Z directions.

"mean-x-axis-gravity-acceleration"
"mean-y-axis-gravity-acceleration"
"mean-z-axis-gravity-acceleration"
 	Mean acceleration due to gravity in the X Y and Z directions.

"mean-x-axis-body-jerk-acceleration"
"mean-y-axis-body-jerk-acceleration"
"mean-z-axis-body-jerk-acceleration"
	Mean jerk acceleration due to body movements in the X Y and Z directions.

"mean-x-axis-gyro-signal"       
"mean-y-axis-gyro-signal"
"mean-z-axis-gyro-signal"
	Mean gyro signal in the X Y and Z directions.        

"mean-x-axis-gyro-jerk"             
"mean-y-axis-gyro-jerk"             
"mean-z-axis-gyro-jerk"   
	Mean jerk gyro signal in the X Y and Z directions.          

"mean-body-acceleration-magnitude" 
	Mean magnitude of the acceleration due to body movements.
 
"mean-gravity-acceleration-magnitude”
	Mean magnitude of acceleration due to gravity.

"mean-body-jerk-acceleration-magnitude”
	Mean magnitude of jerk acceleration due to body movements.

"mean-gyro-magnitude”
	Mean magnitude of the gyro signal.
               
"mean-gyro-jerk-magnitude" 
	Mean magnitude of the jerk gyro signal.
         

THE NEXT GROUP OF VARIABLES REFER TO THE “MEAN” VALUES OF FOURIER TRANSFORMS BASED ON THE EXPERIMENTAL DATA. NO GRAVITY VARIABLES ARE INCLUDED IN THE FOURIER VARIABLES.
ALL VALUES RANGE FROM -1 TO 1. 

"mean-x-axis-fourier-acceleration" 
"mean-y-axis-fourier-acceleration"   
"mean-z-axis-fourier-acceleration"
	Mean fourier transform value of body acceleration. 

"mean-x-axis-fourier-jerk-acceleration" 
"mean-y-axis-fourier-jerk-acceleration" 
"mean-z-axis-fourier-jerk-acceleration" 
	Mean fourier transform value of jerk acceleration.

"mean-x-axis-fourier-gyro-signal" 
"mean-y-axis-fourier-gyro-signal"   
"mean-z-axis-fourier-gyro-signal"
	Mean fourier transform value of the gyro signal.   

"mean-fourier-acceleration-magnitude"
	Mean fourier transform value of the magnitude of body acceleration.

"mean-fourier-jerk-acceleration-magnitude"
	Mean fourier transform value of the magnitude of jerk acceleration. 

"mean-fourier-gyro-magnitude" 
	Mean fourier transform value of the magnitude of the gyro signal.

"mean-fourier-gyro-jerk-magnitude" 
	Mean fourier transform value of the magnitude of jerk gyro signal.

	
THE NEXT GROUP OF VARIABLES REFER TO THE “STANDARD DEVIATION” VALUES OF RAW EXPERIMENTAL DATA OVER SHORT TIME INTERVALS. 
ALL VALUES RANGE FROM -1 TO 1. 

"stddev-x-axis-body-acceleration" 
"stddev-y-axis-body-acceleration" 
"stddev-z-axis-body-acceleration" 
	Standard deviation of acceleration due to body movements in the X Y and Z 		directions.

"stddev-x-axis-gravity-acceleration" 
"stddev-y-axis-gravity-acceleration" 
"stddev-z-axis-gravity-acceleration" 
	Standard deviation of acceleration due to gravity in the X Y and Z 			directions.

"stddev-x-axis-body-jerk-acceleration" 
"stddev-y-axis-body-jerk-acceleration" 
"stddev-z-axis-body-jerk-acceleration"
	Standard deviation of jerk acceleration due to body movements in the X Y and 	Z directions.
 
"stddev-x-axis-gyro-signal" 
"stddev-y-axis-gyro-signal" 
"stddev-z-axis-gyro-signal"
	Standard deviation of gyro signal in the X Y and Z directions.

"stddev-x-axis-gyro-jerk" 
"stddev-y-axis-gyro-jerk" 
"stddev-z-axis-gyro-jerk"
	 Standard deviation of jerk gyro signal in the X Y and Z directions.

"stddev-body-acceleration-magnitude"
	Standard deviation of the magnitude of the acceleration due to body 			movements.

"stddev-gravity-acceleration-magnitude"
	Standard deviation of the magnitude of acceleration due to gravity.
 
"stddev-body-jerk-acceleration-magnitude" 
	Standard deviation of the magnitude of jerk acceleration due to body 		movements.

"stddev-gyro-magnitude"
	Standard deviation of the magnitude of the gyro signal.
 
"stddev-gyro-jerk-magnitude" 
	Standard deviation of the magnitude of the jerk gyro signal.


THE NEXT GROUP OF VARIABLES REFER TO THE “STANDARD DEVIATION” VALUES OF FOURIER TRANSFORMS BASED ON THE EXPERIMENTAL DATA. NO GRAVITY VARIABLES ARE INCLUDED IN THE FOURIER VARIABLES.
ALL VALUES RANGE FROM -1 TO 1.

"stddev-x-axis-fourier-acceleration" 
"stddev-y-axis-fourier-acceleration" 
"stddev-z-axis-fourier-acceleration" 
	Standard deviation of the fourier transform value of body acceleration.

"stddev-x-axis-fourier-jerk-acceleration" 
"stddev-y-axis-fourier-jerk-acceleration" 
"stddev-z-axis-fourier-jerk-acceleration" 
	Standard deviation of the fourier transform value of jerk acceleration.

"stddev-x-axis-fourier-gyro-signal" 
"stddev-y-axis-fourier-gyro-signal" 
"stddev-z-axis-fourier-gyro-signal"
	Standard deviation of the fourier transform value of the gyro signal. 

"stddev-fourier-acceleration-magnitude"
	Standard deviation of the fourier transform value of the magnitude of body 		acceleration. 

"stddev-fourier-jerk-acceleration-magnitude"
	Standard deviation of the fourier transform value of the magnitude of jerk 		acceleration.
 
"stddev-fourier-gyro-magnitude" 
	Standard deviation of the magnitude of the gyro signal.

"stddev-fourier-gyro-jerk-magnitude"
	Standard deviation of the magnitude of the jerk gyro signal.



CODEBOOK FROM RAW DATA SET IS QUOTED BELOW.
This explains how the raw experimental signals were transformed into the data presented in the raw data set. 
The raw data set has 10,299 observations on 561 variables. Only the variables related to “mean” values and “standard deviation” values were used in the project data analysis.


QUOTE

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyGyroJerk-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
