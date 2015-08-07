#
# Coursera Course: Exploratory Data Analysis
#
# Week 1 Project
#

#
# Use sqldf to efficiently read only the rows and columns
# we need from a large file
#
library(sqldf)

#
# Read from household_power_consumption.txt
# Filter to dates 1/2/2007 - 2/2/2007
#
datafile <- file ( "household_power_consumption.txt" )
hpc_data <- sqldf ( "select * from datafile where Date = '1/2/2007' or Date = '2/2/2007'", file.format = list ( sep = ";" ) )

#
# Plot a histogram, red fill, with X label and title
# Save as PNG 480 x 480 pixels
#
png ( filename = "plot1.png", width = 480, height = 480, units = "px" )

hpc_hist <- hist ( hpc_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power" )

dev.off ()