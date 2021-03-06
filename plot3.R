#
# Coursera Course: Exploratory Data Analysis
#
# Week 1 Project
#

#
# Use sqldf to efficiently read only the rows and columns
# we need from a large file
# Use lubridate to convert date and time columns into R timestamps
#
library(sqldf)
library(lubridate)

#
# Read from household_power_consumption.txt
# Filter to dates 1/2/2007 - 2/2/2007
#
datafile <- file ( "household_power_consumption.txt" )
hpc_data <- sqldf ( "select * from datafile where Date = '1/2/2007' or Date = '2/2/2007'", file.format = list ( sep = ";" ) )

#
# Pull out date/time data as we will use it multiple times
#
datetimes <- hms(hpc_data$Time) + dmy(hpc_data$Date)

#
# Plot a regular line chart of Global Active Power against time (omit x axis label)
# Save as PNG 480 x 480 pixels
#
png ( filename = "plot3.png", width = 480, height = 480, units = "px" )

plot ( datetimes, hpc_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab="Energy sub metering" )
lines ( datetimes, hpc_data$Sub_metering_2, type = "l", col = "red" )
lines ( datetimes, hpc_data$Sub_metering_3, type = "l", col = "blue" )
legend ( "topright", lty = c( 1, 1, 1 ), col = c( "black", "red", "blue" ), legend = c( "Sub_metering_1","Sub_metering_2","Sub_metering_3" ) )

dev.off ()
