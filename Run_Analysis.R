setwd("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 3. Getting and Cleaning Data/Week4/CourseAssignment/data")
if(! file.exists("./data1/")){dir.create("./data1")}
if(! file.exists("./data2/")){dir.create("./data2")}

################################################################################################




#1. Merge the training and the test data sets and create one dataset

#1.1 Merge test data together
###################
subjecttest<-read.table("./data1/subject_test.txt")   # 2947 obs of id variable
SubCat1<-unique(subjecttest$V1)
SubCat1
#[1]  2  4  9 10 12 13 18 20 24
colnames(subjecttest) <- "id"
str(subjecttest)

ytest<-read.table("./data1/y_test.txt") # 2947 obs. of  6 category variable
colnames(ytest)<-"ActivityType"
str(ytest)

Xtest<-read.table("./data1/X_test.txt") # 2947 obs of 561 variables: subset to 66 variables of mean and std
Xtests <- Xtest[c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504,516:517,529:530,542:543)] 


testdata<- cbind(cbind(subjecttest,ytest), Xtests   )

head(testdata)



#1.2 Merge train data together
###################

subjecttrain<-read.table("./data1/subject_train.txt")   #  7352 obs of id variable
SubCat2<-unique(subjecttrain$V1)
SubCat2
#[1]  1  3  5  6  7  8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30
colnames(subjecttrain) <- "id"
str(subjecttrain)

ytrain<-read.table("./data1/y_train.txt") # 7352 obs. of 6 category variable
colnames(ytrain)<-"ActivityType"
str(ytrain)


Xtrain<-read.table("./data1/X_train.txt") #   7352 obs of 561 variables: subset to 66 variables of mean and std
Xtrains <- Xtrain[c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504,516:517,529:530,542:543)] 


traindata<- cbind(cbind(subjecttrain,ytrain), Xtrains   )

head(traindata)


#1.3 Merge the two datasets in 1.1 and 1.2 together
###################


Mydata1<- rbind.data.frame(testdata,traindata)

head(Mydata1)
dim(Mydata1)

write.csv(Mydata1, "Mydata1.csv")

################################################################################################


#2. Extract only means and stds for each measurement

# This was done in the process in the step #1 above.  We have 66 of such variables as follows:

#c(V1:V6, V41:V46, v81:V86, v121:V126, v161:V166, V201:V202, V214:V215, V227:V228, V240:V241, V253:V254, V266:V271, V345:V350, V424:V429, V503:V504,V516:V517,V529:V530,v542:V543)

# The data has 10299 rows and 68 variables:  id,  Activity type,  etc.

################################################################################################


#3. Use descriptive activity names to name the activity in the data set

Mydata1<-read.csv("Mydata1.csv")

Mydata1$ActivityTypeD<-c()

for(i in 1:10299) {  
  if (Mydata1$ActivityType[i]==1)  {Mydata1$ActivityTypeD[i]<-"Walking"} 
  if (Mydata1$ActivityType[i]==2)  {Mydata1$ActivityTypeD[i]<-"WalkingU"}   
  if (Mydata1$ActivityType[i]==3)  {Mydata1$ActivityTypeD[i]<-"WalkingD"}   
  if (Mydata1$ActivityType[i]==4)  {Mydata1$ActivityTypeD[i]<-"sitting"} 
  if (Mydata1$ActivityType[i]==5)  {Mydata1$ActivityTypeD[i]<-"standing"} 
  if (Mydata1$ActivityType[i]==6)  {Mydata1$ActivityTypeD[i]<-"laying"} 
  }

Mydata2<-Mydata1

### Move new column next to the old column

Mydata2<-Mydata2[c(1:3,70,4:69)] 

write.csv(Mydata2, "Mydata2.csv")

################################################################################################

#4. Appropriately label the data set with descriptive variable names.


Mydata2<-read.csv("Mydata2.csv")



library(Hmisc)
label(Mydata2$id) <- "subject id number"
label(Mydata2$ActivityType) <-  "an integer between 1-6 showing type of activity"
label(Mydata2$ActivityTypeD) <-  "description of activitytype:  1:walking, 2: walkingdownward, 3: walkingupward, 4: sitting
                                              5:standing, 6: laying"
label(Mydata2$V1) <-  "tBodyAccmeanX"
label(Mydata2$V2) <-  "tBodyAccmeanY"
label(Mydata2$V3) <-  "tBodyAccmeanZ"
label(Mydata2$V4) <-  "tBodyAccstdX"
label(Mydata2$V5) <-  "tBodyAccstdY"
label(Mydata2$V6) <-  "tBodyAccstdZ"
label(Mydata2$V41) <-  "tGravityAccmeanX"
label(Mydata2$V42) <-  "tGravityAccmeanY"
label(Mydata2$V43) <-  "tGravityAccmeanZ"
label(Mydata2$V44) <-  "tGravityAccstdX"
label(Mydata2$V45) <-  "tGravityAccstdY"
label(Mydata2$V46) <-  "tGravityAccstdZ"
label(Mydata2$V81) <-  "tBodyAccJerkmeanX"
label(Mydata2$V82) <-  "tBodyAccJerkmeanY"
label(Mydata2$V83) <-  "tBodyAccJerkmeanZ"
label(Mydata2$V84) <-  "tBodyAccJerkstdX"
label(Mydata2$V85) <-  "tBodyAccJerkstdY"
label(Mydata2$V86) <-  "tBodyAccJerkstdZ"
label(Mydata2$V121) <-  "tBodyGyromeanX"
label(Mydata2$V122) <-  "tBodyGyromeanY"
label(Mydata2$V123) <-  "tBodyGyromeanZ"
label(Mydata2$V124) <-  "tBodyGyrostdX"
label(Mydata2$V125) <-  "tBodyGyrostdY"
label(Mydata2$V126) <-  "tBodyGyrostdZ"
label(Mydata2$V161) <-  "tBodyGyroJerkmeanX"
label(Mydata2$V162) <-  "tBodyGyroJerkmeanY"
label(Mydata2$V163) <-  "tBodyGyroJerkmeanZ"
label(Mydata2$V164) <-  "tBodyGyroJerkstdX"
label(Mydata2$V165) <-  "tBodyGyroJerkstdY"
label(Mydata2$V166) <-  "tBodyGyroJerkstdZ"
label(Mydata2$V201) <-  "tBodyAccMagmean"
label(Mydata2$V202) <-  "tBodyAccMagstd"
label(Mydata2$V214) <-  "tGravityAccMagmean"
label(Mydata2$V215) <-  "tGravityAccMagstd"
label(Mydata2$V227) <-  "tBodyAccJerkMagmean"
label(Mydata2$V228) <-  "tBodyAccJerkMagstd"
label(Mydata2$V240) <-  "tBodyGyroMagmean"
label(Mydata2$V241) <-  "tBodyGyroMagstd"
label(Mydata2$V253) <-  "tBodyGyroJerkMagmean"
label(Mydata2$V254) <-  "tBodyGyroJerkMagstd"
label(Mydata2$V266) <-  "fBodyAccMeanX"
label(Mydata2$V267) <-  "fBodyAccMeanY"
label(Mydata2$V268) <-  "fBodyAccMeanZ"
label(Mydata2$V269) <-  "fBodyAccstdX"
label(Mydata2$V270) <-  "fBodyAccstdY"
label(Mydata2$V271) <-  "fBodyAccstdZ"
label(Mydata2$V345) <-  "fbodyAccJerkmeanX"
label(Mydata2$V346) <-  "fbodyAccJerkmeanY"
label(Mydata2$V347) <-  "fbodyAccJerkmeanZ"
label(Mydata2$V348) <-  "fbodyAccJerkstdX"
label(Mydata2$V349) <-  "fbodyAccJerkstdY"
label(Mydata2$V350) <-  "fbodyAccJerkstdZ"
label(Mydata2$V424) <-  "fBodyGyromeanX"
label(Mydata2$V425) <-  "fBodyGyromeanY"
label(Mydata2$V426) <-  "fBodyGyromeanZ"
label(Mydata2$V427) <-  "fBodyGyrostdX"
label(Mydata2$V428) <-  "fBodyGyrostdY"
label(Mydata2$V429) <-  "fBodyGyrostdZ"
label(Mydata2$V503) <-  "fBodyAccMagmean"
label(Mydata2$V504) <-  "fBodyAccMadstd"
label(Mydata2$V516) <-  "fBodyBodyAccJerkMagmean"
label(Mydata2$V517) <-  "fBodyBodyAccJerkMagstd"
label(Mydata2$V529) <-  "fBodyBodyGyroMagmean"
label(Mydata2$V530) <-  "fBodybodyGyroMagstd"
label(Mydata2$V542) <-  "fBodyBodyGyroJerkMagmean"
label(Mydata2$V543) <-  "fBodyBodyGyroJerkMagstd"
 

describe(Mydata2)

 
Mydata3<-within(Mydata2,rm(X,X.1))

write.csv(Mydata3, "Mydata3.csv" )

################################################################################################

#5. From the data set in step 4, creates a second, independent tidy data set with the average 
    #of each variable for each activity and each subject.

Mydata3<-read.csv("Mydata3.csv")


Tidydata <- Mydata3 %>%
group_by(id, ActivityTypeD) %>%
summarise(Ave_V1=mean(V1), Ave_V2=mean(V2), Ave_V3=mean(V3), Ave_V4=mean(V4), Ave_V5=mean(V5), Ave_V6=mean(V6),
          Ave_V41=mean(V41), Ave_V42=mean(V42), Ave_V43=mean(V43), Ave_V44=mean(V44), Ave_V45=mean(V45), Ave_V46=mean(V46),
          Ave_V81=mean(V81), Ave_V82=mean(V82), Ave_V83=mean(V83), Ave_V84=mean(V84), Ave_V85=mean(V85), Ave_V86=mean(V86),
          Ave_V121=mean(V121), Ave_V122=mean(V122), Ave_V123=mean(V123), Ave_V124=mean(V124), Ave_V125=mean(V125), Ave_V126=mean(V126),
          Ave_V161=mean(V161), Ave_V162=mean(V162), Ave_V163=mean(V163), Ave_V164=mean(V164), Ave_V165=mean(V165), Ave_V166=mean(V166),
          Ave_V201=mean(V201), Ave_V202=mean(V202), Ave_V214=mean(V214), Ave_V215=mean(V215), Ave_V227=mean(V227), Ave_V228=mean(V228),
          Ave_V240=mean(V240), Ave_V241=mean(V241), Ave_V253=mean(V253), Ave_V254=mean(V254),
          Ave_V266=mean(V266), Ave_V267=mean(V267), Ave_V268=mean(V268), Ave_V269=mean(V269), Ave_V270=mean(V270), Ave_V271=mean(V271),
          Ave_V345=mean(V345), Ave_V346=mean(V346), Ave_V347=mean(V347), Ave_V348=mean(V348), Ave_V349=mean(V349), Ave_V350=mean(V350),
          Ave_V424=mean(V424), Ave_V425=mean(V425), Ave_V426=mean(V426), Ave_V427=mean(V427), Ave_V428=mean(V428), Ave_V429=mean(V429),
          Ave_V503=mean(V503), Ave_V504=mean(V504), Ave_V516=mean(V516), Ave_V517=mean(V517), Ave_V529=mean(V529), Ave_V530=mean(V530),
          Ave_V542=mean(V542), Ave_V543=mean(V543))

dim(Tidydata)
#[1] 180  68

write.csv(Tidydata, "Tidydata.csv" )
write.table(Tidydata, file = "Tidydata.txt", sep =  "")

################################################################################################



