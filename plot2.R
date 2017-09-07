# Coursera - Exploratory Data Analysis - Week 1 Assignment
# by: Silvain de Munck
# File: plot2.R
# Note that the abbreviations for days (x-axis) are generated in Dutch 
#       (I live in The Netherlands)

# set working directory
setwd("~/Desktop/Data science/Exploratory Data Analysis/Week_1")

# read the data
EPC_data <- read.table("./data/household_power_consumption.txt", 
                       header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
subset_EPC <- subset(EPC_data, EPC_data$Date == "1/2/2007" | EPC_data$Date == "2/2/2007")

# Convert Date & Time
date_time <- strptime(paste(subset_EPC$Date, subset_EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert to numeric
globalActivePower <- as.numeric(subset_EPC$Global_active_power)

# Plot png
png("plot2.png", width = 480, height = 480)
plot(date_time, globalActivePower, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()