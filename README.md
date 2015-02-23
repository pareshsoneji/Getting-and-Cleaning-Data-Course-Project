# Getting-and-Cleaning-Data-Course-Project

The run_analysis.R file merges the test & train data sets collected from the accelerometers from the Samsung Galaxy S smartphone. For more information about the data sets, see here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

## Steps to run the analysis
* Download the data files here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Place the unzipped folder in your working directory.
* Place the run_analysis.R file in your working directory.
* Source run_analysis.R using `source('run_analysis.R')`. This will create a function `merge_and_analyze()` in the environment.
* Call the function `merge_and_analyze` & assign the result to new variable like this: `result <- merge_and_analyze()`.
* The variable `result` contains a data frame with average of each 'feature' variable for each activity for each subject. 

###### Acknowledgements
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
