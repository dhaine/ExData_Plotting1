## Downloading data if necessary.

filename <- "household_power_consumption.zip"

if (!file.exists(filename)){
  fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileurl, filename)
}  
if (!file.exists("household_power_consumption")) { 
  unzip(filename) 
}

## Reading data

library(data.table)
library(lubridate)
power_all <- fread("./household_power_consumption.txt",
                   sep = ";",
                   na.strings = "?")
power <- power_all[Date == "1/2/2007" | Date == "2/2/2007"]
power$Date <- dmy(power$Date)
power$Time <- as.ITime(strptime(power$Time, "%H:%M:%S"))
