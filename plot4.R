# Assignment 1 - Plot4
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

# Pepare Data Frame for graph
plotData <- data.frame(TimeStamp = sRowsDtTm, 
                       Global_active_power = as.numeric(selectedRows$Global_active_power),
                       Sub_metering_1 = as.numeric(selectedRows$Sub_metering_1),
                       Sub_metering_2 = as.numeric(selectedRows$Sub_metering_2),
                       Sub_metering_3 = as.numeric(selectedRows$Sub_metering_3),
                       Voltage = as.numeric(selectedRows$Voltage),
                       Global_reactive_power = as.numeric(selectedRows$Global_reactive_power))

#Open the Graphic device
png(file = "plot4.png", width = 480, height = 480)

#Plot the graph
par(mfrow = c(2,2))

with(plotData, plot(TimeStamp,Global_active_power, type = "n", ylab = "Global Active Power", xlab = ""))
with(plotData,lines(TimeStamp,Global_active_power))

with(plotData, plot(TimeStamp,Voltage, type = "n", ylab = "Voltage", xlab = "datetime"))
with(plotData,lines(TimeStamp,Voltage))

with(plotData, plot(TimeStamp,Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(plotData,lines(TimeStamp,Sub_metering_1, col = "black"))
with(plotData,lines(TimeStamp,Sub_metering_2, col = "red"))
with(plotData,lines(TimeStamp,Sub_metering_3, col = "blue"))
legend("topright", pch = 45, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(plotData, plot(TimeStamp,Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime"))
with(plotData,lines(TimeStamp,Global_reactive_power))

#Close device
dev.off()