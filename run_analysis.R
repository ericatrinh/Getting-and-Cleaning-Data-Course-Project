run_analysis <- function(){
    # read data and makes a table
    columnNames <- read.table("./UCI HAR Dataset/features.txt") 
    
    #creates table from files in test directory
    xtest <- read.table( "./UCI HAR Dataset/test/X_test.txt")
    colnames( xtest ) <-columnNames[,2]
    ytest <- read.table( "./UCI HAR Dataset/test/y_test.txt")
    colnames( ytest ) <- "activitylabel" 
    subjecttest <- read.table( "./UCI HAR Dataset/test/subject_test.txt")
    colnames( subjecttest ) <- "subjectID"
    bindTest <- cbind ( subjecttest, ytest, xtest )
    
    #creates table from files in train directory
    xtrain <- read.table( "./UCI HAR Dataset/train/X_train.txt")
    colnames( xtrain ) <-columnNames[,2]
    ytrain <- read.table( "./UCI HAR Dataset/train/y_train.txt")
    colnames( ytrain ) <- "activitylabel"
    subjecttrain <- read.table( "./UCI HAR Dataset/train/subject_train.txt")
    colnames( subjecttrain ) <- "subjectID"
    bindTrain <- cbind( subjecttrain, ytrain, xtrain )
    
    #Create one merged dataset
    mergeData <- rbind( bindTest, bindTrain )
    
    #Extracted mean & STD values
    index<- grep("mean()|std()", colnames(mergeData))
    table <- cbind( mergeData[ ,1:2], mergeData[ ,index] )
    
    #Gets activity labels
    actLabel <- c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING" )

    for( i in 1:6 ){
        index <- grep( i , table$activitylabel )
        table$activitylabel[ index ] <- actLabel[i]
    }
    
    #Renames labels
    colnames(table) <- sub( "^t", "time", names(table) )
    colnames(table) <- sub( "^f", "freq", names(table) )
    colnames(table) <- gsub( "-", "", names(table) )
    colnames(table) <- sub( "\\()", "", names(table) )
    colnames(table) <- sub( "mean", "Mean", names(table) )
    colnames(table) <- sub( "std", "Std", names(table) )
    
    #Create Tidy Table
    len <- length(table)
    tidy <- data.frame( matrix(0,180,len) )
    obs <- split( table, list(table$subjectID, table$activitylabel) ) 
   
     for( i in 1:length(obs) ){
        sub <- obs[[i]][1,1]
        act <- obs[[i]][1,2]
        avg <- colMeans( obs[[i]][ ,3:len] ) 
        row <- c( sub , act , avg )
        tidy[i, ] <- row 
     }

    colnames(tidy) <- colnames(table)
    colnames(tidy) <- sub( "^time", "avgTime", names(tidy) )
    colnames(tidy) <- sub( "^freq", "avgFreq", names(tidy) )
    tidy <- tidy[ order(as.numeric(tidy$subjectID), tidy$activitylabel), ]
    write.csv(tidy, "tidyTable.csv")
}
