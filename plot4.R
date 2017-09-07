# Coursera - Exploratory Data Analysis - Week 1 Assignment
# by: Silvain de Munck
# File: plot4.R
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
globalReactivePower <- as.numeric(subset_EPC$Global_reactive_power)
voltage <- as.numeric(subset_EPC$Voltage)
subMetering1 <- as.numeric(subset_EPC$Sub_metering_1)
subMetering2 <- as.numeric(subset_EPC$Sub_metering_2)
subMetering3 <- as.numeric(subset_EPC$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(date_time, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", 
     cex = 0.2)

plot(date_time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(date_time, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(date_time, subMetering2, type = "l", col = "red")
lines(date_time, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =, 
       lwd = 2.5, col = c("black", "red", "blue"), bty = "n")

plot(date_time, globalReactivePower, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()