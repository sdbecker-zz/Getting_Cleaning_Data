#*************************************************************************************************************************
#The data in question is made up of training and testing data which includes

#X_train.txt      : contains records of 561 calculated fields from the 
#                   accelerometer and gyroscope data collected from an
#                   activity (of 6 activities) performed by a
#                   volunteer ( of 30 volunteers).
#y_train.txt      : contains records of 1 field indicating which activity is
#                   associated to each record in the X_train file.
#subject_train.txt: contains records of 1 field indicating which volunteer was
#                   performing the activity recorded in the y_train file.

#X_test.txt      :  contains records of 561 calculated fields from the 
#                   accelerometer and gyroscope data collected from an
#                   activity (of 6 activities) performed by a
#                   volunteer ( of 30 volunteers).
#y_test.txt      :  contains records of 1 field indicating which activity is
#                   associated to each record in the X_test file.
#subject_test.txt:  contains records of 1 field indicating which volunteer was
#                   performing the activity recorded in the y_test file.

#******************************************************************************
CreateOutput <- function(){
        # Load the packages to be used
        library(dplyr)
        
        # Step 1 combine the testing and training data, note this means to combine the
        # columns of the activity and volunteer together with the calculated fields.
        
        test.CalcFields <- read.table("./test/X_test.txt", stringsAsFactors = F)
        test.Activities <- read.table("./test/y_test.txt", stringsAsFactors =F)
        test.Volunteers <- read.table("./test/subject_test.txt", stringsAsFactors = F)
        
        train.CalcFields <- read.table("./train/X_train.txt", stringsAsFactors = F)
        train.Activities <- read.table("./train/y_train.txt", stringsAsFactors =F)
        train.Volunteers <- read.table("./train/subject_train.txt",
                                       stringsAsFactors = F)
        
        test.data <- cbind(test.Volunteers, test.Activities, test.CalcFields)
        train.data <- cbind(train.Volunteers, train.Activities, train.CalcFields)
        
        all.data <- rbind(train.data, test.data) # the complete data set combined
        
        # Step 2 extract mean and standard deviation based fields from the combined
        # data set. Which means the column names should be included.
        
        # Create column names using the features.txt file
        
        features.names <- read.table("features.txt", stringsAsFactors = FALSE)[,2]
        
        field.names <- c("Volunteer", "Activity", features.names)
        
        colnames(all.data) <- field.names # ** Step 4 setting descriptive names
        
        all.data <- tbl_df(all.data)
        
        # Step 2.1 the accelerometer and gyroscope bandsEnergy variables are duplicates
        # which need to be deleted. The columns are previously identified using the 
        # duplicated() function.
        
        all.data <- all.data[,!duplicated(features.names)]
        
        all.subdata <- select(all.data, Volunteer, Activity, contains("std()")
                              , contains("mean()"))
        
        # Step 3 use descriptive activity names in the data set
        # Create a factor of activity labels from the activity_labels.txt file
        # and use it to replace the Activity column
        
        act.labels <- read.table("activity_labels.txt", stringsAsFactors = TRUE)[,2]
        
        all.subdata$Activity <- act.labels[all.subdata$Activity]
        
        # replace volunteer numbers with labels
        
        volunteer.labels <- factor(paste("Volunteer_", 1:30, sep =""))
        
        all.subdata$Volunteer <- volunteer.labels[all.subdata$Volunteer]
        
        
        # Step 4 appropriately name the data set labels with descriptive names
        # refer to the above ** as it has already been done.
        
        # Step 5, create a second data set, with the average of each variable for each
        # activity and each subject.
        
        
        # Start with finding the average for the Volunteers, which mean summarizing
        # the data without the Activity variable. Then do the same for the Activity
        # variable without the Volunteer variable.
        
        by_Volunteer <- group_by(all.subdata[,-2], Volunteer) # Activity is column 2
        by_Activity <- group_by(all.subdata[,-1], Activity) # Volunteer is column 1
        
        # Create an avg.byVolunteer variable that will hold 30 rows corresponding to 
        # the 30 volunteers with an average calculated for each variable.
        avg.byVolunteer <- summarise_each(by_Volunteer, funs(mean))
        
        # Create an avg.byActivity variable that will hold 6 rows corresponding to 
        # the 6 activities with an average calculated for each variable.
        
        avg.byActivity <- summarise_each(by_Activity, funs(mean))
        
        # Combine the two data sets avg.byVolunteer and avg.byActivity into one
        # data set call avg.byGroup
        
        colnames(avg.byVolunteer)[1] <- "Group"
        colnames(avg.byActivity)[1] <- "Group"
        
        avg.byGroup <- rbind(avg.byVolunteer, avg.byActivity)
        
        #Write the combined data set ou to file.
        write.table(avg.byGroup, "run_analysis_output.txt", row.names = FALSE)
        
}        