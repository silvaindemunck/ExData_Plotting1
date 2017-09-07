# Coursera - Exploratory Data Analysis - Week 1 Assignment
# by: Silvain de Munck
# File: plot3.R
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
subMetering1 <- as.numeric(subset_EPC$Sub_metering_1)
subMetering2 <- as.numeric(subset_EPC$Sub_metering_2)
subMetering3 <- as.numeric(subset_EPC$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(date_time, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(date_time, subMetering2, type = "l", col = "red")
lines(date_time, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
