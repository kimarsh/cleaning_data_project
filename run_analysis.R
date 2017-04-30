library(plyr)
library(dplyr)
library(reshape2)

# this script assumes the folder "UCI HAR Dataset" is in the working directory
# and that it has been unzipped, but otherwise unmodified

# start with the test file ----
# read in the "test" file with all the measurements
test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

# read in the variable names
# these correspond to the columns of the dataset we just read in
testnames <- read.table("UCI HAR Dataset/features.txt", header=FALSE)


# now we'll assign the variable names, which are in column "V2" of "testnames, 
# to be column names of the test dataset
names(test) <- testnames$V2

# read in the "subject_test" file
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
# this corresponds to the subjects from which the measurements originated
# this will come in handy later
# first i'll extract the mean() and std() variables so the dataset is smaller
# then i'll assign the subject ids to another column in that dataset


# now read in the "Y_test" file
ytest <- read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE)
dim(ytest)  # 2947 rows of 1 variable
summary(ytest)  # min 1, max 6:
# so this corresponds to the activities detailed in the "activity labels" file
# will need to append this to the test dataset as well

## make the dataset smaller
# find variables that contain mean() or std() and put their positions in a vector
# named "postokeep"
postokeep <- grep("mean\\()|std\\()", testnames$V2)

# then subset the dataframe based on that
test <- test[ , postokeep]
dim(test)  # 2947 obs of 66 variables

# time to add in the columns for subject and activity
test_all <- bind_cols(subject_test, ytest, test)
# name them appropriately
names(test_all)[1:2] <- c("subject", "activity")

# test file is in good shape
# on to the training file! ----

# read in the "training" file
training <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

# assign the same names as above
names(training) <- testnames$V2

# read in the "subject_train" file
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)

# read in the activity file
ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE)

# then subset the training data frame based on the same "postokeep" vector from earlier
training <- training[ , postokeep]

# add in subject and activity columns, same as before
train_all <- bind_cols(subject_train, ytrain, training)
# name them appropriately
names(train_all)[1:2] <- c("subject", "activity")


# now we have both data sets formatted the same way
# combine them into one dataset ----
combined <- bind_rows(test_all, train_all)

# remove the excess stuff in the workspace
rm(list = c("postokeep", "subject_test", "subject_train", "test",
            "test_all", "testnames", "train_all", "training",
            "ytest", "ytrain"))

# time to assign descriptive names to the activities ----
# 1 = walking
# 2 = walking_upstairs
# 3 = walking_downstairs
# 4 = sitting
# 5 = standing
# 6 = laying

combined$activity <- factor(combined$activity,
                        levels = c("1", "2", "3", "4", "5", "6"),
                        labels = c("walking", "walking_upstairs",
                                   "walking_downstairs", "sitting",
                                   "standing", "laying"))

## and that's the data table!

# now to make the summary table required in step 5 ----
# average of each variable for each activity and each subject

# melt it
comb_melted <- melt(combined, id.vars=c("subject", "activity"),
                    variable.name = "variable",
                    value.name = "value")

# use dcast to spit out a data frame where summarized variables are column headings
# and the identifiers are the first two columns, subject and activity
# this results in 180 rows, which is all the combinations of
# subject x activity
# and 68 variables, which are "subject", "activity", and each of the 66 vars that
# contained "mean()" or "std()"
comb_avgs <- dcast(comb_melted, subject + activity ~ variable, mean)

# clean up the workspace to only keep "comb_avgs"
rm(list=c("combined", "comb_melted"))

# write this to a text file
write.table(comb_avgs, file="variable_averages.txt", row.names=FALSE)
