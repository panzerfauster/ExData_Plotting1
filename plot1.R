# Data Science Specialization
# Course 4: Exploratory Data Analysis
# Course Project 1: Consumption Plots
# Fausto Martín López

### This code generates the plots required for Course Project 1 in the current Working Directory.

## Read and process the source file
colClasses=c("character", "character", rep("numeric", 7))
file <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", quote="", na.strings="?", colClasses=colClasses)
# Filter the dates as instructed
file <- file[as.Date(file$Date, "%d/%m/%Y")=="2007-02-01"|as.Date(file$Date, "%d/%m/%Y")=="2007-02-02",]
# Merge the Date and Time columns into a timestamp
file$DateTime <- strptime(paste(file$Date, file$Time), "%d/%m/%Y %T")
file <- file[,c(10,3:9)]

## Create the plot
# Plot 1
png("plot1.png")
hist(file$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
