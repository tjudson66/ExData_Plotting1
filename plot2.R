## coursera: Exploratory Data Analysis
## 4th in the Data Specialization Series
## plot2.R - Download and plot a line graph


## This script will:
##    - download data from the UC Irvine Machine Learning Repository for  
##      the dates of 2007-02-01 and 2007-02-02.
##    - clean the data
##    - plot the data in a line graph showing the Global Active Power
##      in kilowatts across the two days of data


## Environmental Setup
## Note: This script requires the "sqldf" package

library("sqldf")
setwd("C:/Users/Tim Judson/Desktop/R")


## Download the data (Note: Assumes that the source txt file is 
## unzipped and in the directory "/data" in the working directory)

filename <- "./data/household_power_consumption.txt"
epc <- read.csv.sql(filename, sep=";", sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
closeAllConnections()


## Paste Date and Time fields together and then convert to POSIXlt format
epc$DatePOS <- strptime(paste(epc$Date,epc$Time), "%d/%m/%Y %H:%M:%S")


## Open the PNG device, create the plot and then close the device

png("plot2.png", 
     width=480, height=480, units="px")  

plot(epc$DatePOS, epc$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off() ## close the device