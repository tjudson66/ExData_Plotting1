## coursera: Exploratory Data Analysis
## 4th in the Data Specialization Series
## plot4.R - Download and plot a line graph 


## This script will:
##    - download data from the UC Irvine Machine Learning Repository for  
##      the dates of 2007-02-01 and 2007-02-02.
##    - clean the data
##    - create 4 graphs and plot the 2 x 2 in a png file



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

png("plot4.png", 
    width=480, height=480, units="px")  



par(mfcol = c(2, 2), mar = c(4, 5, 2, 1), oma = c(0, 0, 2, 0))

plot(epc$DatePOS, epc$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

plot(epc$DatePOS, epc$Sub_metering_1, type = "l", col = "black",
               xlab = "", ylab = "Energy sub metering")

lines(epc$DatePOS, epc$Sub_metering_2, type = "l", col = "red")
lines(epc$DatePOS, epc$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = c(1,1), lwd = c(2.5, 2.5), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.45)


plot(epc$DatePOS, epc$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")


plot(epc$DatePOS, epc$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")


dev.off() ## close the device
