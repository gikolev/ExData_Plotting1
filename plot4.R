## Read full data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Assign "date" class to variable Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
                          
## Subset data frame for the two dates in question
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## Generate variable datetime with class "as.POSIXct"
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## Open the PNG graphics device
png(filename = "plot4.png")

## Parce plot areea to accomodate 4 plots (two by two)
par(mfrow = c(2,2))

## Generate Plots
## plot 1
plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power", xlab = "")

## plot 2
plot(data$Voltage ~ data$datetime, type = "l", ylab = "Voltage", xlab = "datetime")

## plot 3
with(data, {
        plot(Sub_metering_1 ~ datetime, type = "l", 
             ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ datetime, col = 'Red')
        lines(Sub_metering_3 ~ datetime, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## plot 4
plot(data$Global_reactive_power ~ data$datetime, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

## Close PNG graphics device
dev.off()

