# Coursera - Exploratory Data Analysis - Week 1 Assignment
# by: Silvain de Munck
# File: plot1.R

# set working directory
setwd("~/Desktop/Data science/Exploratory Data Analysis/Week_1")

# read the data
EPC_data <- read.table("./data/household_power_consumption.txt", 
                       header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
subset_EPC <- subset(EPC_data, EPC_data$Date == "1/2/2007" | EPC_data$Date == "2/2/2007")

# Convert to numeric
globalActivePower <- as.numeric(subset_EPC$Global_active_power)

# Plot png
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()