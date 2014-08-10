## coursera: Exploratory Data Analysis
## 4th in the Data Specialization Series
## plot1.R - Download and plot a histogram


## This script will:
##    - download data from the UC Irvine Machine Learning Repository for  
##      the dates of 2007-02-01 and 2007-02-02.
##    - clean up this data
##    - plot this data in a histogram showing the frequency of Global Active Power
##      in kilowatts


## Environmental Setup
## Note: This script requires the "sqldf" package

library("sqldf")
setwd("C:/Users/Tim Judson/Desktop/R")


## Download the data (NOTE: Assumes that the source txt file is unzipped
## and in the directory "/data" in the working directory)

filename <- "./data/household_power_consumption.txt"
epc <- read.csv.sql(filename, sep=";", sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
closeAllConnections()

## Paste Date and Time fields together and then convert to POSIXlt format

epc$DatePOS <- strptime(paste(epc$Date,epc$Time), "%d/%m/%Y %H:%M:%S")



## Open the PNG device, create the plot and then close the device

png("plot1.png", 
    width=480, height=480, units="px")  

hist(epc$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")

dev.off() ## close the device