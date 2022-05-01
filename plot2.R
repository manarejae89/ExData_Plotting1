# Load "dplyr" library
library(dplyr)

# Download Data Set if necessary
zipname <- "exdata_data_household_power_consumption.zip"
filename<- "household_power_consumption.txt"
# Checking if data set file already exists
if (!file.exists(zipname)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, destfile = zipname, method="curl")
}  
# Checking if data set exists
if (!file.exists(filename)) { 
  unzip(zipname) 
}

# Import data with dates 2007-02-01 and 2007-02-02
headers = read.csv(filename, header = FALSE, nrows = 1, sep=";") 
elepowdata <- read.csv("~/Coursera/Data Science/04_Exploratory Data Analysis/Week 1/household_power_consumption.txt", header=FALSE, sep=";", skip=66638, nrows=(69518-66639))
colnames(elepowdata)= headers

# Create Date/Time column
elepowdata <- mutate(elepowdata,DateTime=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))

#PLOT2
png(filename = "plot2.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(elepowdata$DateTime, elepowdata$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()