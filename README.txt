There is one analysis file:   Run_Analysis.R
====================================================================================================================================================
It includes 5 stages to obtain the tidy data :   Tidydata.txt
====================================================================================================================================================
#1. Merge the training and the test data sets and create one dataset
#1.1 Merge test data together
#1.2 Merge train data together
#1.3 Merge the two datasets in 1.1 and 1.2 together



#2. Extract only means and stds for each measurement
This was done in the process in the step #1 above.  We have 66 of such variables as follows:
c(V1:V6, V41:V46, v81:V86, v121:V126, v161:V166, V201:V202, V214:V215, V227:V228, V240:V241, V253:V254, V266:V271, V345:V350, V424:V429, V503:V504,V516:V517,V529:V530,v542:V543)
The data has 10299 rows and 68 variables:  id,  Activity type,  etc.


#3. Use descriptive activity names to name the activity in the data set


#4. Appropriately label the data set with descriptive variable names.


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Note. The final dataset  "Tidydata.txt" has 180 rows and 68 variables
      Each row is dedicated for one subject id and one of his/her six body situations.

==================================================================================================================================================