#Code book 
####Analysis of data collected from the accelerometers from the Samsung Galaxy S smartphone

######Steps involved in the analysis:
  1. There are multiple data sets describing the data
    - Reference Data
      * activity_labels.txt: This file contains the 6 activities & their equivalent ids.
      * features.txt: This file contains the list of 561 features or measures for which observations have been gathered.
    - Observations (The same applies to the train data set)
      * test/X_test.txt: This file contains the observations for the test data set. 
       Each row corresponds to the readings collected for a subject doing a given activity.
      * test/Y_test.txt: This file contains the activity id for each row of observations in *X_test.txt*.
      * test/subject_test.txt: This file contains the subject number (1 - 30) for each row of observations in *X_test.txt*.
  2. The first step is to load the reference data *(activities & features)* into local variables. 
     These will be used later to merge with the feature observations to get one consolidated data set.
  3. Load *X_test.txt* and subset the columns to only the means & standard deviations of the signal observations.
  4. Read *Y_test.txt* & *subject_test.txt* containing activity & subject information related to observations in *X_test.txt*.  
  5. Add activity ids & subject number from *step 4* to the result of *step 3*.
  6. Repeat *steps 3 - 5* for the train data set.
  7. Use `rbind` to concatenate the test & train data sets.
  8. Merge the result of *step 7* with reference data from *step 2* to add activity names against each row of observation.
  9. To calcuate the mean of each feature for each activity & each subject:
    i. Melt the merged result of *step 8*, with id columns as *Activity* & *Subject* & measures as all the mean & std features.
    ii. Use `dcast` to calculate the mean of each variable across *Activity* & *Subject*.

####Data Dictionary
No. of rows: 180
No. of columns: 50

**ActivityName**  
`factor`  
Name of activity corresponding the observations  
range:  WALKING   
        WALKING_UPSTAIRS  
        WALKING_DOWNSTAIRS  
        SITTING  
        STANDING  
        LAYING  

**Subject**  
`int`  
The number indicating the subject from which observations are gathered.  
range: [1, 30]  

The following columns are calculated as mean of their values for each combination of ActivityName & Subject.
  
**tBodyAcc.mean...X**  
`numeric`  
Mean of the time domain acceleration caused by the body in the X direction.  
range: [-1, 1]  

**tBodyAcc.mean...Y**   
`numeric`  
Mean of the time domain acceleration caused by the body in the Y direction.  
range: [-1, 1]  

**tBodyAcc.mean...Z**  
`numeric`  
Mean of the time domain acceleration caused by the body in the Z direction.  
range: [-1, 1]  

**tGravityAcc.mean...X**  
`numeric`  
Mean of the time domain acceleration caused by gravity in the X direction.  
range: [-1, 1]  

**tGravityAcc.mean...Y**  
`numeric`  
Mean of the time domain acceleration caused by gravity in the Y direction.  
range: [-1, 1]  

**tGravityAcc.mean...Z**  
`numeric`  
Mean of the time domain acceleration caused by gravity in the Z direction.  
range: [-1, 1]  

**tBodyAccJerk.mean...X**  
`numeric`  
Mean of the time domain acceleration jerk signal caused by the body in the X direction.  
range: [-1, 1]  

**tBodyAccJerk.mean...Y**  
`numeric`  
Mean of the time domain acceleration jerk signal caused by the body in the Y direction.  
range: [-1, 1]  

**tBodyAccJerk.mean...Z**  
`numeric`   
Mean of the time domain acceleration jerk signal caused by the body in the Z direction.  
range: [-1, 1]  

**tBodyGyro.mean...X**  
`numeric`  
Mean of the time domain angular velocity caused by the body in the X direction.  
range: [-1, 1]  

**tBodyGyro.mean...Y**  
`numeric`  
Mean of the time domain angular velocity caused by the body in the Y direction.  
range: [-1, 1]  

**tBodyGyro.mean...Z**  
`numeric`  
Mean of the time domain angular velocity caused by the body in the Z direction.  
range: [-1, 1]  

**tBodyGyroJerk.mean...X**  
`numeric`  
Mean of the time domain angular velocity jerk caused by the body in the X direction.  
range: [-1, 1]  

**tBodyGyroJerk.mean...Y**  
`numeric`  
Mean of the time domain angular velocity jerk caused by the body in the Y direction.  
range: [-1, 1]  

**tBodyGyroJerk.mean...Z**  
`numeric`  
Mean of the time domain angular velocity jerk caused by the body in the Z direction.  
range: [-1, 1]  

**fBodyAcc.mean...X**  
`numeric`  
Mean of the frequency domain acceleration caused by the body in the X direction.  
range: [-1, 1]  

**fBodyAcc.mean...Y**  
`numeric`  
Mean of the frequency domain acceleration caused by the body in the Y direction.  
range: [-1, 1]  

**fBodyAcc.mean...Z**  
`numeric`  
Mean of the frequency domain acceleration caused by the body in the Z direction.  
range: [-1, 1]  

**fBodyAccJerk.mean...X**  
`numeric`  
Mean of the frequency domain acceleration jerk signal caused by the body in the X direction.  
range: [-1, 1]  

**fBodyAccJerk.mean...Y**  
`numeric`  
Mean of the frequency domain acceleration jerk signal caused by the body in the Y direction.  
range: [-1, 1]  

**fBodyAccJerk.mean...Z**  
`numeric`  
Mean of the frequency domain acceleration jerk signal caused by the body in the Z direction.    
range: [-1, 1]  

**fBodyGyro.mean...X**  
`numeric`  
Mean of the frequency domain angular velocity caused by the body in the X direction.  
range: [-1, 1]  

**fBodyGyro.mean...Y**  
`numeric`  
Mean of the frequency domain angular velocity caused by the body in the Y direction.  
range: [-1, 1]  

**fBodyGyro.mean...Z**  
`numeric`  
Mean of the frequency domain angular velocity caused by the body in the Z direction.  
range: [-1, 1]  

**tBodyAcc.std...X**  
`numeric`  
Standard deviation of the time domain acceleration caused by the body in the X direction.  
range: [-1, 1]  

**tBodyAcc.std...Y**  
`numeric`  
Standard deviation of the time domain acceleration caused by the body in the Y direction.  
range: [-1, 1]  

**tBodyAcc.std...Z**  
`numeric`  
Standard deviation of the time domain acceleration caused by the body in the Z direction.  
range: [-1, 1]  

**tGravityAcc.std...X**  
`numeric`  
Standard deviation of the time domain acceleration caused by gravity in the X direction.  
range: [-1, 1]  

**tGravityAcc.std...Y**  
`numeric`  
Standard deviation of the time domain acceleration caused by gravity in the Y direction.  
range: [-1, 1]  

**tGravityAcc.std...Z**  
`numeric`  
Standard deviation of the time domain acceleration caused by gravity in the Z direction.  
range: [-1, 1]  

**tBodyAccJerk.std...X**  
`numeric`  
Standard deviation of the time domain acceleration jerk signal caused by the body in the X direction.  
range: [-1, 1]  

**tBodyAccJerk.std...Y**  
`numeric`  
Standard deviation of the time domain acceleration jerk signal caused by the body in the Y direction.  
range: [-1, 1]  

**tBodyAccJerk.std...Z**  
`numeric`  
Standard deviation of the time domain acceleration jerk signal caused by the body in the Z direction.  
range: [-1, 1]  

**tBodyGyro.std...X**  
`numeric`  
Standard deviation of the time domain angular velocity caused by the body in the X direction.  
range: [-1, 1]  

**tBodyGyro.std...Y**  
`numeric`  
Standard deviation of the time domain angular velocity caused by the body in the Y direction.  
range: [-1, 1]  

**tBodyGyro.std...Z**  
`numeric`  
Standard deviation of the time domain angular velocity caused by the body in the Z direction.  
range: [-1, 1]  

**tBodyGyroJerk.std...X**  
`numeric`  
Standard deviation the time domain angular velocity jerk caused by the body in the X direction.  
range: [-1, 1]  

**tBodyGyroJerk.std...Y**  
`numeric`  
Standard deviation of the time domain angular velocity jerk caused by the body in the Y direction.  
range: [-1, 1]  

**tBodyGyroJerk.std...Z**  
`numeric`  
Standard deviation of the time domain angular velocity jerk caused by the body in the Z direction.  
range: [-1, 1]  

**fBodyAcc.std...X**  
`numeric`  
Standard deviation of the frequency domain acceleration caused by the body in the X direction.  
range: [-1, 1]  

**fBodyAcc.std...Y**  
`numeric`  
Standard deviation of the frequency domain acceleration caused by the body in the Y direction.  
range: [-1, 1]  

**fBodyAcc.std...Z**  
`numeric`  
Standard deviation of the frequency domain acceleration caused by the body in the Z direction.  
range: [-1, 1]  

**fBodyAccJerk.std...X**  
`numeric`  
Standard deviation of the frequency domain acceleration jerk signal caused by the body in the X direction.  
range: [-1, 1]  

**fBodyAccJerk.std...Y**  
`numeric`  
Standard deviation of the frequency domain acceleration jerk signal caused by the body in the Y direction.  
range: [-1, 1]  

**fBodyAccJerk.std...Z**  
`numeric`  
Standard deviation of the frequency domain acceleration jerk signal caused by the body in the Z direction.  
range: [-1, 1]  

**fBodyGyro.std...X**  
`numeric`  
Standard deviation of the frequency domain angular velocity caused by the body in the X direction.  
range: [-1, 1]  

**fBodyGyro.std...Y**  
`numeric`  
Standard deviation of the frequency domain angular velocity caused by the body in the Y direction.  
range: [-1, 1]  

**fBodyGyro.std...Z**  
`numeric`  
Standard deviation of the frequency domain angular velocity caused by the body in the Z direction.  
range: [-1, 1]
