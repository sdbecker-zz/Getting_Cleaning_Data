#A guide for the 'run_analysis.R' script

## 1. About the script and function.

The script requires that the 'dplyr' package be installed.

The script contains one function, _'CreateOutput'_, it takes no input arguments
and has a single output. The output is a data set that is written to file. The
file is a text file ('.txt') and the file's name is _run\_analysis\_output.txt_. 

The function requires the working directory to be set to wherever the __UCI HAR
Dataset__("./UCI HAR Dataset") folder is located in order to work appropriately.

## 2. Running the function.

Simply download the file and save it into the __UCI HAR Dataset__ folder, then
source the file and type _CreateOutput()_. This will produce the data set and
write it to the abovementioned text file within the __UCI HAR Dataset__ folder.

## 3 .Viewing the file

It is suggested that to view the contents of the file you run (type, don't copy
paste - some reason it doesn't work):

* output_variable <- read.table("run_analysis_output.txt", header = TRUE)
* View(output_variable)

from your interactive prompt. Please note that it is __View__, with a capital
__V__, I kept getting errors because I missed that.
