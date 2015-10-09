## Read full data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Assign "date" class to variable Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset data frame for the two dates in question
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## Open the PNG graphics device
png(filename = "plot1.png")

## Generate Plot
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

## Close PNG graphics device
dev.off()