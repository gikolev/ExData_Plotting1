## Read full data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Assign "date" class to variable Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
                          
## Subset data frame for the two dates in question
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## Open the PNG graphics device
png(filename = "plot2.png")

## Generate variable datetime with class "as.POSIXct"
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## Generate Plot
plot(data$Global_active_power ~ data$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Close PNG graphics device
dev.off()
