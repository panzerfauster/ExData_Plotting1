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
# Plot 3
png("plot3.png")
plot(file$DateTime, file$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(file$DateTime, file$Sub_metering_2, type="l", col="red")
lines(file$DateTime, file$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
