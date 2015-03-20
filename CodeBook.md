#Code Book

## 1. Introduction

This code book is made up of two parts, the first is a description of the 
data set and variables output to the file _run\_analysis\_output.txt_, the 
second is a description of how the script __run\_analysis.R__ works.

## 2. Data set and column fields description

The data set is made up of 36 records and 67 fields or variables.

The first column or field is composed of the required grouping of volunteers and 
activities.The remaining 66 columns or fields are the requested averaged
values of each variable for each of the grouped items.

The averages are calculated over requested variables in the study that were 
already averaged or a standard deviation was calculated.
In short the remaining 66 columns are averages of averaged values or averages
of standard deviations. Meaning that for each volunteer, an average over all 
averages calculated (and average over all standard deviations) on each activitiy
is calculted for each variable. Likewise for each activity an average is taken
over all the averages (and average over all standard deviations) calculated on
each volunteer. I know its a mouthfull.

Of the 36 records, the first 30 correspond to the 30 subjects or volunteers
in the study.The volunteers are named _Volunteer\_1_,_Volunteer\_2_...
_Volunteer\_30_.

The next 6 records correspond to the type of activity that was recorded in the
study. The activities are named _LAYING_, _SITTING_, _STANDING_, _WALKING_,
 _WALKING\_DOWNSTAIRS_, _WALKING\_UPSTAIRS_.
 
The above 36 records fall under the first field _Group_. Therefore the data set
relates 67 averaged values to either a volunteer or an activity.

### Column fields:

* Group:[Columns 1] character field, contain the volunteer number of activity 
to which the remaining calculated fields relate.

#### The following are averages of the given field

For instance _tBodyAcc.std (X,Y,Z): [Columns 2-4]_ are averages of tBodyAcc.std
taken over the three axials X,Y and Z and shown in columns 2,3 and 4.

The units are all normalised time values if the variable starts with 't', or
it is a normalised frequency value if the variable starts with 'f'. Note the
values are normalized between (-1,1).

* tBodyAcc.std (X,Y,Z): [Columns 2-4]
* tGravityAcc.std (X,Y,Z) : [Columns 5-7]
* tBodyAccJerk.std (X,Y,Z) : [Columns 8-10]
* tBodyGyro.std (X,Y,Z) : [Columns 11-13]
* tBodyGyroJerk.std (X,Y,Z) : [Columns 14-16]
* tBodyAccMag.std : [Column 17]
* tGravityAccMag.std : [Column 18]
* tBodyAccJerkMag.std : [Column 19]
* tBodyGyroMag.std : [Column 20]
* tBodyGyroJerkMag.std : [Column 21]
* fBodyAcc.std (X,Y,Z) : [Columns 22-24]
* fBodyAccJerk.std (X,Y,Z): [Columns 25-27]
* fBodyGyro.std (X,Y,Z): [Columns 28-30]
* fBodyAccMag.std : [Column 31]
* fBodyBodyAccJerkMag.std : [Column 32]
* fBodyBodyGyroMag.std : [Column 33]
* fBodyBodyGyroJerkMag.std : [Column 34]
* tBodyAcc.mean (X,Y,Z) : [Columns 35-37]
* tGravityAcc.mean (X,Y,Z) : [Columns 38-40]
* tBodyAccJerk.mean (X,Y,Z) : [Columns 41-43]
* tBodyGyro.mean (X,Y,Z) : [Columns 44-46]
* tBodyGyroJerk.mean (X,Y,Z) : [Columns 47-49]
* tBodyAccMag.mean : [Column 50]
* tGravityAccMag.mean : [Column 51]
* tBodyAccJerkMag.mean : [Column 52]
* tBodyGyroMag.mean : [Column 53]
* tBodyGyroJerkMag.mean : [Column 54]
* fBodyAcc.mean : [Columns 55-57]
* fBodyAccJerk.mean : [Columns 58-60]
* fBodyGyro.mean : [Columns 61-63]
* fBodyAccMag.mean : [Column 64]
* fBodyBodyAccJerkMag.mean : [Column 65]
* fBodyBodyGyroMag.mean : [Column 66]
* fBodyBodyGyroJerkMag.mean : [Column 67]

## 3. Explanation of the script

The first step is combining the testing and training data, this means one must
combine the files of the activities and volunteers together with the calculated
fields. 

The second step is to extract all the fields with standard deviation or mean 
calculations. Thus extract fields containing _'mean'_ or _'std'_ in the name.
Note that the fields containing _'bandenergy'_ are duplicates and not required
for the project so they are identified and deleted from the data set first.

The third step is to use factors to rename the activities field from numbers 
to descriptive names. Over and above that the names for the subjects were 
replaced with names such as _'Volunteer\_1'_.

The fourth step which was inherently done in step two was to give the remaining
fields back their descriptive names.

The fifth step was to created the second tidy data set with the averaged values
for each variable with respect to each volunteer/subject and each activity.
This was done separately first and then combined and written out to the file,
__run\_analysis\_output.txt__.










