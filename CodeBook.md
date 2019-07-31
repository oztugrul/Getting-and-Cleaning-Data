---
title: "CodeBook"
author: "Ozge Tugrul Sonmez"

---



## Getting and Cleaning Data CodeBook

###The Data


The dataset used for run_analysis.R file includes the following files:

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training (features) set.

'train/y_train.txt': Training (activities) labels.

'test/X_test.txt': Test (features) set.

'test/y_test.txt': Test (activities) labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The activity labels are given:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

###The Variables

The complete variables in the data set are subject, activities and the 561 features in features.txt file.The total number of variables is 563 and the total observations are 10299.

The number of measurements extracted according to including mean and std in their names is 86 and with the variables subject and activities, the total number of extracted variables is 88 with the number of observations 10299.


###The Data Transformation and The Functions Used
####Operations used to transform data

1- Merges the training and the test sets to create one data set.

2- Extracts only the measurements on the mean and standard deviation for each measurement.

3- Uses descriptive activity names to name the activities in the data set

4- Appropriately labels the data set with descriptive variable names.

5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


####The explanations of functions

The function **download.file()** is used to download UCI HAR Dataset zip file.

The function **read.table()** is used to read .txt files.

The function **write.table()** is used to write .txt file of the tidy data set.

The function **rbind()** combine the rows of training and testing data.

The function **cbind()** combine the columns of sunject, activities and features variable.

The variables are extracted on the mean and standard deviation for each measurement by the **grep()** function. 
The variables are selected from the complete data set by **select()** function.

The names of the variables are changed and simplified by **gsub()** function and also, the punctuation "..." and the punctuation ".." is replaced with the punctuation ".".

The activity codes are replaced with activity names by **mutate()** and **recode()**functions.
Te summarized tidy data including the means of the measurements grouped by subjects and activities is obtained by using both **dplyr** and **reshape2** libraries. For the **dplyr** package **group_by()** and **summarise_all()** functions are used and for the **reshape2** package **melt()** and **dcast()** functions are used.The same tidy data is obtained by using two different packages.

The features including Mean and Standard deviation with appropriate and simplified labels are given below.

[1] "subject"                             
[2] "activities"                          
[3] "tBodyAcc.Mean.X"                     
[4] "tBodyAcc.Mean.Y"                     
[5] "tBodyAcc.Mean.Z"                     
[6] "tBodyAcc.Std.X"                      
[7] "tBodyAcc.Std.Y"                      
[8] "tBodyAcc.Std.Z"                      
[9] "tGravityAcc.Mean.X"                  
[10] "tGravityAcc.Mean.Y"                  
[11] "tGravityAcc.Mean.Z"                  
[12] "tGravityAcc.Std.X"                   
[13] "tGravityAcc.Std.Y"                   
[14] "tGravityAcc.Std.Z"                   
[15] "tBodyAccJerk.Mean.X"                 
[16] "tBodyAccJerk.Mean.Y"                 
[17] "tBodyAccJerk.Mean.Z"                 
[18] "tBodyAccJerk.Std.X"                  
[19] "tBodyAccJerk.Std.Y"                  
[20] "tBodyAccJerk.Std.Z"                  
[21] "tBodyGyro.Mean.X"                    
[22] "tBodyGyro.Mean.Y"                    
[23] "tBodyGyro.Mean.Z"                    
[24] "tBodyGyro.Std.X"                     
[25] "tBodyGyro.Std.Y"                     
[26] "tBodyGyro.Std.Z"                     
[27] "tBodyGyroJerk.Mean.X"                
[28] "tBodyGyroJerk.Mean.Y"                
[29] "tBodyGyroJerk.Mean.Z"                
[30] "tBodyGyroJerk.Std.X"                 
[31] "tBodyGyroJerk.Std.Y"                 
[32] "tBodyGyroJerk.Std.Z"                 
[33] "tBodyAccMag.Mean."                   
[34] "tBodyAccMag.Std."                    
[35] "tGravityAccMag.Mean."                
[36] "tGravityAccMag.Std."                 
[37] "tBodyAccJerkMag.Mean."               
[38] "tBodyAccJerkMag.Std."                
[39] "tBodyGyroMag.Mean."                  
[40] "tBodyGyroMag.Std."                   
[41] "tBodyGyroJerkMag.Mean."              
[42] "tBodyGyroJerkMag.Std."               
[43] "fBodyAcc.Mean.X"                     
[44] "fBodyAcc.Mean.Y"                     
[45] "fBodyAcc.Mean.Z"                     
[46] "fBodyAcc.Std.X"                      
[47] "fBodyAcc.Std.Y"                      
[48] "fBodyAcc.Std.Z"                      
[49] "fBodyAcc.MeanFreq.X"                 
[50] "fBodyAcc.MeanFreq.Y"                 
[51] "fBodyAcc.MeanFreq.Z"                 
[52] "fBodyAccJerk.Mean.X"                 
[53] "fBodyAccJerk.Mean.Y"                 
[54] "fBodyAccJerk.Mean.Z"                 
[55] "fBodyAccJerk.Std.X"                  
[56] "fBodyAccJerk.Std.Y"                  
[57] "fBodyAccJerk.Std.Z"                  
[58] "fBodyAccJerk.MeanFreq.X"             
[59] "fBodyAccJerk.MeanFreq.Y"             
[60] "fBodyAccJerk.MeanFreq.Z"             
[61] "fBodyGyro.Mean.X"                    
[62] "fBodyGyro.Mean.Y"                    
[63] "fBodyGyro.Mean.Z"                    
[64] "fBodyGyro.Std.X"                     
[65] "fBodyGyro.Std.Y"                     
[66] "fBodyGyro.Std.Z"                     
[67] "fBodyGyro.MeanFreq.X"                
[68] "fBodyGyro.MeanFreq.Y"                
[69] "fBodyGyro.MeanFreq.Z"                
[70] "fBodyAccMag.Mean."                   
[71] "fBodyAccMag.Std."                    
[72] "fBodyAccMag.MeanFreq."               
[73] "fBodyAccJerkMag.Mean."               
[74] "fBodyAccJerkMag.Std."                
[75] "fBodyAccJerkMag.MeanFreq."           
[76] "fBodyGyroMag.Mean."                  
[77] "fBodyGyroMag.Std."                   
[78] "fBodyGyroMag.MeanFreq."              
[79] "fBodyGyroJerkMag.Mean."              
[80] "fBodyGyroJerkMag.Std."               
[81] "fBodyGyroJerkMag.MeanFreq."          
[82] "Angle.tBodyAccMean.Gravity."         
[83] "Angle.tBodyAccJerkMean.GravityMean." 
[84] "Angle.tBodyGyroMean.GravityMean."    
[85] "Angle.tBodyGyroJerkMean.GravityMean."
[86] "Angle.X.GravityMean."                
[87] "Angle.Y.GravityMean."                
[88] "Angle.Z.GravityMean."


The tidy data set with the average of each variable for each activity and each subject is given below

A tibble: 180 x 88
Groups:   subject [?]
subject activities tBodyAcc.Mean.X tBodyAcc.Mean.Y tBodyAcc.Mean.Z
      <int> <fct>                <dbl>           <dbl>           <dbl>
  1       1 LAYING               0.222        -0.0405          -0.113 
  2       1 SITTING              0.261        -0.00131         -0.105 
  3       1 STANDING             0.279        -0.0161          -0.111 
  4       1 WALKING              0.277        -0.0174          -0.111 
  5       1 "WALKING_~           0.289        -0.00992         -0.108 
  6       1 WALKING_U~           0.255        -0.0240          -0.0973
  7       2 LAYING               0.281        -0.0182          -0.107 
  8       2 SITTING              0.277        -0.0157          -0.109 
  9       2 STANDING             0.278        -0.0184          -0.106 
 10       2 WALKING              0.276        -0.0186          -0.106 
 ... with 170 more rows, and 83 more variables: tBodyAcc.Std.X <dbl>,
   tBodyAcc.Std.Y <dbl>, tBodyAcc.Std.Z <dbl>, tGravityAcc.Mean.X <dbl>,
   tGravityAcc.Mean.Y <dbl>, tGravityAcc.Mean.Z <dbl>,
   tGravityAcc.Std.X <dbl>, tGravityAcc.Std.Y <dbl>,
   tGravityAcc.Std.Z <dbl>, tBodyAccJerk.Mean.X <dbl>,
   tBodyAccJerk.Mean.Y <dbl>, tBodyAccJerk.Mean.Z <dbl>,
   tBodyAccJerk.Std.X <dbl>, tBodyAccJerk.Std.Y <dbl>,
   tBodyAccJerk.Std.Z <dbl>, tBodyGyro.Mean.X <dbl>,
   tBodyGyro.Mean.Y <dbl>, tBodyGyro.Mean.Z <dbl>, tBodyGyro.Std.X <dbl>,
   tBodyGyro.Std.Y <dbl>, tBodyGyro.Std.Z <dbl>,
   tBodyGyroJerk.Mean.X <dbl>, tBodyGyroJerk.Mean.Y <dbl>,
   tBodyGyroJerk.Mean.Z <dbl>, tBodyGyroJerk.Std.X <dbl>,
   tBodyGyroJerk.Std.Y <dbl>, tBodyGyroJerk.Std.Z <dbl>,
   tBodyAccMag.Mean. <dbl>, tBodyAccMag.Std. <dbl>,
   tGravityAccMag.Mean. <dbl>, tGravityAccMag.Std. <dbl>,
   tBodyAccJerkMag.Mean. <dbl>, tBodyAccJerkMag.Std. <dbl>,
   tBodyGyroMag.Mean. <dbl>, tBodyGyroMag.Std. <dbl>,
   tBodyGyroJerkMag.Mean. <dbl>, tBodyGyroJerkMag.Std. <dbl>,
   fBodyAcc.Mean.X <dbl>, fBodyAcc.Mean.Y <dbl>, fBodyAcc.Mean.Z <dbl>,
   fBodyAcc.Std.X <dbl>, fBodyAcc.Std.Y <dbl>, fBodyAcc.Std.Z <dbl>,
   fBodyAcc.MeanFreq.X <dbl>, fBodyAcc.MeanFreq.Y <dbl>,
   fBodyAcc.MeanFreq.Z <dbl>, fBodyAccJerk.Mean.X <dbl>,
   fBodyAccJerk.Mean.Y <dbl>, fBodyAccJerk.Mean.Z <dbl>,
   fBodyAccJerk.Std.X <dbl>, fBodyAccJerk.Std.Y <dbl>,
   fBodyAccJerk.Std.Z <dbl>, fBodyAccJerk.MeanFreq.X <dbl>,
   fBodyAccJerk.MeanFreq.Y <dbl>, fBodyAccJerk.MeanFreq.Z <dbl>,
   fBodyGyro.Mean.X <dbl>, fBodyGyro.Mean.Y <dbl>,
   fBodyGyro.Mean.Z <dbl>, fBodyGyro.Std.X <dbl>, fBodyGyro.Std.Y <dbl>,
   fBodyGyro.Std.Z <dbl>, fBodyGyro.MeanFreq.X <dbl>,
   fBodyGyro.MeanFreq.Y <dbl>, fBodyGyro.MeanFreq.Z <dbl>,
   fBodyAccMag.Mean. <dbl>, fBodyAccMag.Std. <dbl>,
   fBodyAccMag.MeanFreq. <dbl>, fBodyAccJerkMag.Mean. <dbl>,
   fBodyAccJerkMag.Std. <dbl>, fBodyAccJerkMag.MeanFreq. <dbl>,
   fBodyGyroMag.Mean. <dbl>, fBodyGyroMag.Std. <dbl>,
   fBodyGyroMag.MeanFreq. <dbl>, fBodyGyroJerkMag.Mean. <dbl>,
   fBodyGyroJerkMag.Std. <dbl>, fBodyGyroJerkMag.MeanFreq. <dbl>,
   Angle.tBodyAccMean.Gravity. <dbl>,
   Angle.tBodyAccJerkMean.GravityMean. <dbl>,
   Angle.tBodyGyroMean.GravityMean. <dbl>,
   Angle.tBodyGyroJerkMean.GravityMean. <dbl>,
   Angle.X.GravityMean. <dbl>, Angle.Y.GravityMean. <dbl>,
   Angle.Z.GravityMean. <dbl>

