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

