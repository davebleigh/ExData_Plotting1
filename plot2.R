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
# Plot a regular line chart of Global Active Power against time (omit x axis label)
# Save as PNG 480 x 480 pixels
#
png ( filename = "plot2.png", width = 480, height = 480, units = "px" )

plot ( hms(hpc_data$Time) + dmy(hpc_data$Date), hpc_data$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)" )

dev.off ()