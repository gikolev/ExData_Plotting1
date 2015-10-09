## Read full data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Assign "date" class to variable Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
                          
## Subset data frame for the two dates in question
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## Open the PNG graphics device
png(filename = "plot3.png")

## Generate variable datetime with class "as.POSIXct"
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## Generate Plot
with(data, {
        plot(Sub_metering_1 ~ datetime, type = "l", 
             ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ datetime, col = 'Red')
        lines(Sub_metering_3 ~ datetime, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close PNG graphics device
dev.off()

