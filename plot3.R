# Assignment 1 - Plot3
# This program read the file - household_power_consumption.txt from the
# current working directory and display the chart
# for Global_active_power with date 01/02/2007 - 02/02/2007

# Load data from File
powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Filter for the seletced dates
selectedRows <- powerConsumption[((powerConsumption$Date == "1/2/2007") | (powerConsumption$Date == "2/2/2007")),]

#Concatenate Date & Time for timestamp
sRowsDtTm <- paste(selectedRows$Date, selectedRows$Time)
sRowsDtTm <- strptime(sRowsDtTm, "%d/%m/%Y %H:%M:%S")

#Open the Graphic device
png(file = "plot3.png", width = 480, height = 480)


# Pepare Data Frame for graph
plotData <- data.frame(TimeStamp = sRowsDtTm, 
                       Sub_metering_1 = as.numeric(selectedRows$Sub_metering_1),
                       Sub_metering_2 = as.numeric(selectedRows$Sub_metering_2),
                       Sub_metering_3 = as.numeric(selectedRows$Sub_metering_3))
#Plot the graph

with(plotData, plot(TimeStamp,Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(plotData,lines(TimeStamp,Sub_metering_1, col = "black"))
with(plotData,lines(TimeStamp,Sub_metering_2, col = "red"))
with(plotData,lines(TimeStamp,Sub_metering_3, col = "blue"))
legend("topright", pch = 45, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close device
dev.off()