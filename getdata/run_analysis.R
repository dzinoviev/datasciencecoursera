library (dplyr)

# The location of the UCI data
PREFIX <- "." # UCI HAR Dataset"

# Read in the raw data
x.test <- read.table(paste(PREFIX,"/test/X_test.txt",sep=""))
y.test <- read.table(paste(PREFIX,"/test/y_test.txt",sep=""))
subject.test <- read.table(paste(PREFIX,"/test/subject_test.txt",sep=""))
x.train <- read.table(paste(PREFIX,"/train/X_train.txt",sep=""))
y.train <- read.table(paste(PREFIX,"/train/y_train.txt",sep=""))
subject.train <- read.table(paste(PREFIX,"/train/subject_train.txt",sep=""))
features <- read.table(paste(PREFIX,"/features.txt",sep=""))[,2]
activity <- read.table(paste(PREFIX,"/activity_labels.txt",sep=""))

# Combine the training and testing sets
x <- rbind (x.test, x.train)
y <- rbind (y.test, y.train)
subject <- rbind (subject.test, subject.train)

# Extract the mean and stddev columns
names(x) <- features
x <- x[,grep ("mean\\(\\)|std\\(\\)", features)]

# Add meaningful names to the new columns
names(y) <- "activity"
names(subject) <- "subject.id"

# Combine the columns into one data frame
data <- cbind(subject,y,x)

# Add descriptive activity names
names (activity) <- c("id","name")
data$activity <- activity$name[data$activity]

# Tidy up the column names
names(data) <- lapply(names(data),
                      function(x) {
                        gsub("-",".",
                             gsub("mean\\(\\)","Mean",
                                  gsub("std\\(\\)","StdDev",
                                       gsub("BodyBody","Body",x))))
                        })

# Create a summary table
summary <- aggregate (x=data,by=list(data$subject,data$activity),FUN="mean")
# Remove the redundant duplicate columns used for aggregation
summary[3:4] <- list(NULL)
# Rename the new columns used for aggregation
names(summary)[1:2] <- c("subject","activity")

# Save the results
write.table (summary, file = "summary.txt", row.name=FALSE)
