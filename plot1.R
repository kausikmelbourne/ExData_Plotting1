# Assignment 1 - Plot1
# This program read the file - household_power_consumption.txt from the
# current working directory and display the hustogram chart
# for Global_active_power with date 01/02/2007 - 02/02/2007

# Load data from File
powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Filter for the seletced dates
selectedRows <- powerConsumption[((powerConsumption$Date == "1/2/2007") | (powerConsumption$Date == "2/2/2007")),]

# Convert the Data Type
GlobalActivePower <- as.numeric(selectedRows$Global_active_power)

#Open the Graphic device
png(file = "plot1.png", width = 480, height = 480)

#Plot the graph
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close device
dev.off()
