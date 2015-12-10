grabData <- function() {
      curdir=getwd()
      
      # Check if directory exists, if not create it
      if (!file.exists("projectData")) {
            dir.create("projectData")
      }
      
      # Project file data 
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      
      if (!file.exists("./projectData/projectData.zip")) {
            # I am on linux, the method = "curl" does not work for me or in my version of R. It is Ok when I omit it  
            download.file(fileUrl, destfile = "./projectData/projectData.zip")
      }
      
      # enter
      setwd("./projectData")
      
      # This is my data file name
      datafilename <- "household_power_consumption.txt"
      
      if (!file.exists(datafilename)) {
            # Decompress the file (unzip is part of the utils package, loaded per default)
            unzip("./projectData/projectData.zip", exdir="./projectData")
      }

      # After looking at the data, read enough to contain the two interesting days without consuming too much RAM
      pwrcnsdata <- read.table(datafilename, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?", nrows = 200000)     
      
      # Convert the two character based date and time to a time 
      pwrcnsdata$Time <- strptime(paste(pwrcnsdata$Date, pwrcnsdata$Time), "%d/%m/%Y %H:%M:%S")
      
      # Convert the two character based date date 
      pwrcnsdata$Date <- as.Date(pwrcnsdata$Date, "%d/%m/%Y")
      
      # subsetting on strings do not seem work... that is why I use dates. It was twodays <- c("02/02/2007", "01/02/2007")
      
      # The two interesting dates 
      twodays <- as.Date(c("2007-02-02", "2007-02-01"), "%Y-%m-%d")
      
      # subset 
      pwrcnsdata <- subset(pwrcnsdata, Date %in% twodays) 
      # Get back to where I was
      setwd(curdir)
      
      return(pwrcnsdata)     
}