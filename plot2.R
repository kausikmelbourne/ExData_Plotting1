# Assignment 1 - Plot2
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

# Prepare Dataframe for the graph
plotData <- data.frame(TimeStamp = sRowsDtTm, Global_active_power = as.numeric(selectedRows$Global_active_power))

#Open the Graphic device
png(file = "plot2.png", width = 480, height = 480)

#Plot the graph
with(plotData, plot(TimeStamp,Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))
with(plotData,lines(TimeStamp,Global_active_power))

#Close device
dev.off()