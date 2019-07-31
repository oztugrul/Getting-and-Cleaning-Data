library(reshape2)
library(dplyr)

setwd("C:/Users/asus/Desktop/Getting_and_Cleaning_Data")

#Downloading Files

if(!file.exists("Dataset.zip")){
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,destfile="./Dataset.zip")
}

if(!file.exists("Dataset")){
  unzip("Dataset.zip")
}

#Getting all of the Data

activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt",col.names=c("feature_code","feature_name"))

subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names=c("subject"))
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features$feature_name)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names=c("subject"))
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features$feature_name)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")


#1- Merges the training and the test sets to create one data set.

x<-rbind(x_train,x_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
complete_data<-cbind(subject,y,x)


#2-Extracts only the measurements on the mean and standard deviation for each measurement.

names(complete_data)

#Extract the column names that contains words mean or std starting with uppercase letter or lowercase letter 
#and might have any character or punctuation before and after the words.The extracted measurement variables can be obtained
#as below.

extracted_measurements<-names(complete_data[,grep(".*[Mm]ean.*|.*[Ss]td.*",names(complete_data))])

#Add the first two columns which come from the subject and y variables and select them from the complete data.

extracted_data<-complete_data%>%select(subject,V1,extracted_measurements)


#3.Uses descriptive activity names to name the activities in the data set

names(extracted_data)[2]<-"activities"

extracted_data<-extracted_data%>%mutate(activities=recode(activities,'1'="WALKING",'2'="WALKING_UPSTAIRS",
'3'="WALKING_DOWNSTAIRS",'4'="SITTING",'5'="STANDING",'6'="LAYING"))

extracted_data$activities<-factor(extracted_data$activities)


#4.Appropriately labels the data set with descriptive variable names.

names(extracted_data)<-gsub("BodyBody","Body",names(extracted_data))
names(extracted_data)<-gsub("mean","Mean",names(extracted_data))
names(extracted_data)<-gsub("std","Std",names(extracted_data))
names(extracted_data)<-gsub("gravity","Gravity",names(extracted_data))
names(extracted_data)<-gsub("angle","Angle",names(extracted_data))
names(extracted_data)<-gsub("\\.\\.\\.","\\.",names(extracted_data))
names(extracted_data)<-gsub("\\.\\.","\\.",names(extracted_data))

names(extracted_data)
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Using dplyr package
tidy_data_set<- extracted_data %>%group_by(subject, activities) %>%summarise_all(funs(mean))
write.table(tidy_data_set, "TidyDataSet.txt", row.name=FALSE)

#Using reshape2 package
melted_data<- melt(extracted_data, id.vars = c("subject", "activities"),variable.name="measures")
average<-dcast(melted_data, subject + activities ~ measures, mean)
write.table(average, "average.txt", row.name=FALSE)

#The same results are obtained by two packages
str(tidy_data_set)
str(average)
