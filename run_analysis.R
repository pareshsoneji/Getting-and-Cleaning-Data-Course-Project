merge_and_analyze <- function()
{
  #Load reference data files
  activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityId", "ActivityName"))
  features <- read.table("./UCI HAR Dataset/features.txt", col.names=c("FeatureId", "FeatureName"))
  
  #Load test feature observations
  testX <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$FeatureName)
  #Subset test data columns to mean & standard deviation only
  testX <- testX[ , c(grep(".+\\.mean\\.\\.\\..+", names(testX)), grep(".+\\.std\\.\\.\\..+", names(testX)))]
  #Read activity & subject columns
  testY <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = c("ActivityId"))
  testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))
  
  #Load train feature observations
  trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$FeatureName)
  #Subset train data columns to mean & standard deviation only
  trainX <- trainX[ , c(grep(".+\\.mean\\.\\.\\..+", names(trainX)), grep(".+\\.std\\.\\.\\..+", names(trainX)))]
  #Read activity & subject columns
  trainY <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names=c("ActivityId"))
  trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))
  
  #Add reading type, activity id & subject to both test & train data sets
  testX$ReadingType <- "Test"
  testX$ActivityId <- testY$ActivityId
  testX$Subject <- testSubject$Subject
  
  trainX$ReadingType <- "Train"
  trainX$ActivityId <- trainY$ActivityId
  trainX$Subject <- trainSubject$Subject
  
  #Row bind train data set to test data set to get one complete data set
  mergedReadings <- rbind(testX, trainX)
  #Add activiity names from activities data set
  mergedReadings <- merge(mergedReadings, activities, by = "ActivityId", all = FALSE)
  mergedReadings$ReadingType <- as.factor(mergedReadings$ReadingType)
  mergedReadings$ActivityName <- as.factor(mergedReadings$ActivityName)
  
  #Calculate mean for each factor for each activity for each subject
  meltIds <- c("ActivityId","ActivityName","ReadingType","Subject")
  allCols <- data.frame(names(mergedReadings))
  meltMeasures <- allCols[!(allCols$names.mergedReadings. %in% meltIds),]
  meltedReadings <- melt(mergedReadings, id = meltIds, measure.vars = meltMeasures)
  
  dcast(meltedReadings, ActivityName + Subject ~ variable, mean)
}
