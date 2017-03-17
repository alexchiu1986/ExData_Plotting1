plot3 <- function() {
    data <- read.csv("household_power_consumption.txt", sep = ";",
                     colClasses = "character")
    
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
    
    data[, "Sub_metering_1"] <- as.numeric(data[, "Sub_metering_1"])
    data[, "Sub_metering_2"] <- as.numeric(data[, "Sub_metering_2"])
    data[, "Sub_metering_3"] <- as.numeric(data[, "Sub_metering_3"])
    
    ydata <- data$Sub_metering_1
    if (max(ydata) < max(data$Sub_metering_2)) {
        ydata <- data$Sub_metering_2
    }
    if (max(ydata) < max(data$Sub_metering_3)) {
        ydata <- data$Sub_metering_3
    }
    
    
    datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")
    
    plot(datetime, ydata, type = "n", xlab = "",
         ylab="Energy sub metering")
    lines(datetime, data$Sub_metering_1, type = "l")
    lines(datetime, data$Sub_metering_2, type = "l", col = "red")
    lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty=1, col = c("black", "red", "blue"),cex = 0.8, 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    
    dev.copy(png, file = "plot3.png")
    dev.off()
}