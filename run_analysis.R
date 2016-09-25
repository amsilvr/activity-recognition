library(dplyr)
# read HAR dataset from URL into "data" directory
if(!file.exists("data")){dir.create("data")}
fileURL <- "URL"
download.file(fileURL, destfile = "./data",
              method = "curl")

# read files into R 
trainsubject <- read.table("./data/UCIHARDataset/train/subject_train.txt")
trainactivity <- read.table("./data/UCIHARDataset/train/y_train.txt")
trainrawdata <- read.table("./data/UCIHARDataset/train/X_train.txt")
elements <- read.table("./data/UCIHARDataset/features.txt")
testsubject <- read.table("./data/UCIHARDataset/test/subject_test.txt")
testactivity <- read.table("./data/UCIHARDataset/test/y_test.txt")
testrawdata <- read.table("./data/UCIHARDataset/test/X_test.txt")

# convert variable names to character vector
elemchar <- c(as.character(elements$V2)) 
# add missing X, Y, Z designators so variable names are unique
elemchar[303:316] <- gsub("Energy", "EnergyX", elemchar[303:316], fixed = TRUE)
elemchar[317:330] <- gsub("Energy", "EnergyY", elemchar[317:330], fixed = TRUE)
elemchar[331:344] <- gsub("Energy", "EnergyZ", elemchar[331:344], fixed = TRUE)
elemchar[382:395] <- gsub("Energy", "EnergyX", elemchar[382:395], fixed = TRUE)
elemchar[396:409] <- gsub("Energy", "EnergyY", elemchar[396:409], fixed = TRUE)
elemchar[410:423] <- gsub("Energy", "EnergyZ", elemchar[410:423], fixed = TRUE)
elemchar[461:474] <- gsub("Energy", "EnergyX", elemchar[461:474], fixed = TRUE)
elemchar[475:488] <- gsub("Energy", "EnergyY", elemchar[475:488], fixed = TRUE)
elemchar[489:502] <- gsub("Energy", "EnergyZ", elemchar[489:502], fixed = TRUE)

  # Reshape "training" data set
  # attach feature names to variable names for train data set
  names(trainrawdata) <- elemchar   

  # extract relevant columns needed for data set (mean and std values)
  trainmin <- select(trainrawdata, contains("mean()"), contains("std()"))

    # binds activity to each train observation
    names(trainactivity) <- "activity"
    traindata <- cbind(trainactivity, trainmin)
    # binds subject to each train observation
    names(trainsubject) <- "subject"
    trainset <- cbind(trainsubject, traindata)

  # Reshape "test" data set
  # attach feature names to variable names for test data
  names(testrawdata) <- elemchar

  # extract relevant columns needed for data set (mean and std values)
  testmin <- select(testrawdata, contains("mean()"), contains("std()"))

    # binds activity to each obs
    names(testactivity) <- "activity"
    testdata <- cbind(testactivity, testmin)
    # binds subject to each obs
    names(testsubject) <- "subject"
    testset <- cbind(testsubject, testdata)
    
    # Combine the the training and test sets to create one data set (task 1)
    finalset <- rbind(trainset, testset)
    # Arrange merged data set in order of subject and activity 
    finalsort <- finalset[order(finalset$subject, finalset$activity),]
    
    # Apply descriptive activity names to activites in the data set (task 3)
    finalsort$activity[finalsort$activity == 1] <- "walking"
    finalsort$activity[finalsort$activity == 2] <- "walking upstairs"
    finalsort$activity[finalsort$activity == 3] <- "walking downstairs"
    finalsort$activity[finalsort$activity == 4] <- "sitting"
    finalsort$activity[finalsort$activity == 5] <- "standing"
    finalsort$activity[finalsort$activity == 6] <- "laying"
    
    # Label the data set with descriptive variable names (task 4)
    modtitles <- c("subject", "activity", 
                   "mean-x-axis-body-acceleration",
                   "mean-y-axis-body-acceleration",
                   "mean-z-axis-body-acceleration",
                   "mean-x-axis-gravity-acceleration",   
                   "mean-y-axis-gravity-acceleration",  
                   "mean-z-axis-gravity-acceleration",  
                   "mean-x-axis-body-jerk-acceleration", 
                   "mean-y-axis-body-jerk-acceleration", 
                   "mean-z-axis-body-jerk-acceleration", 
                   "mean-x-axis-gyro-signal",           
                   "mean-y-axis-gyro-signal",           
                   "mean-z-axis-gyro-signal",           
                   "mean-x-axis-gyro-jerk",             
                   "mean-y-axis-gyro-jerk",             
                   "mean-z-axis-gyro-jerk",             
                   "mean-body-acceleration-magnitude",  
                   "mean-gravity-acceleration-magnitude", 
                   "mean-body-jerk-acceleration-magnitude", 
                   "mean-gyro-magnitude",               
                   "mean-gyro-jerk-magnitude",          
                   "mean-x-axis-fourier-acceleration",    
                   "mean-y-axis-fourier-acceleration",   
                   "mean-z-axis-fourier-acceleration",  
                   "mean-x-axis-fourier-jerk-acceleration", 
                   "mean-y-axis-fourier-jerk-acceleration", 
                   "mean-z-axis-fourier-jerk-acceleration", 
                   "mean-x-axis-fourier-gyro-signal", 
                   "mean-y-axis-fourier-gyro-signal",   
                   "mean-z-axis-fourier-gyro-signal",   
                   "mean-fourier-acceleration-magnitude", 
                   "mean-fourier-jerk-acceleration-magnitude", 
                   "mean-fourier-gyro-magnitude", 
                   "mean-fourier-gyro-jerk-magnitude", 
                   "stddev-x-axis-body-acceleration", 
                   "stddev-y-axis-body-acceleration", 
                   "stddev-z-axis-body-acceleration", 
                   "stddev-x-axis-gravity-acceleration", 
                   "stddev-y-axis-gravity-acceleration", 
                   "stddev-z-axis-gravity-acceleration", 
                   "stddev-x-axis-body-jerk-acceleration", 
                   "stddev-y-axis-body-jerk-acceleration", 
                   "stddev-z-axis-body-jerk-acceleration", 
                   "stddev-x-axis-gyro-signal", 
                   "stddev-y-axis-gyro-signal", 
                   "stddev-z-axis-gyro-signal", 
                   "stddev-x-axis-gyro-jerk", 
                   "stddev-y-axis-gyro-jerk", 
                   "stddev-z-axis-gyro-jerk", 
                   "stddev-body-acceleration-magnitude", 
                   "stddev-gravity-acceleration-magnitude", 
                   "stddev-body-jerk-acceleration-magnitude", 
                   "stddev-gyro-magnitude", 
                   "stddev-gyro-jerk-magnitude", 
                   "stddev-x-axis-fourier-acceleration", 
                   "stddev-y-axis-fourier-acceleration", 
                   "stddev-z-axis-fourier-acceleration", 
                   "stddev-x-axis-fourier-jerk-acceleration", 
                   "stddev-y-axis-fourier-jerk-acceleration", 
                   "stddev-z-axis-fourier-jerk-acceleration", 
                   "stddev-x-axis-fourier-gyro-signal", 
                   "stddev-y-axis-fourier-gyro-signal", 
                   "stddev-z-axis-fourier-gyro-signal", 
                   "stddev-fourier-acceleration-magnitude", 
                   "stddev-fourier-jerk-acceleration-magnitude", 
                   "stddev-fourier-gyro-magnitude", 
                   "stddev-fourier-gyro-jerk-magnitude")
    names(finalsort) <- modtitles
    
    # Calculate the average of each variable for each activity and each 
    # subject (task 5)
    prepsort <- group_by(finalsort, subject, activity)
    finaldata <- summarize_each(prepsort, funs(mean))
    finaldata
    
    
    