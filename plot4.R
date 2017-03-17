plot4 <- function() {
    data <- read.csv("household_power_consumption.txt", sep = ";",
                     colClasses = "character")
    
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
    
    data[, "Global_active_power"] <- as.numeric(data[, "Global_active_power"])
    data[, "Voltage"] <- as.numeric(data[, "Voltage"])
    data[, "Global_reactive_power"] <- as.numeric(data[, "Global_reactive_power"])
    
    datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")
    
    
    
    par(mfcol = c(2,2), mar = c(4, 4, 3, 2))
    
    
    
    #plot 1
    plot(datetime, data$Global_active_power, type = "n", xlab = "",
         ylab="Global Active Power")
    lines(datetime, data$Global_active_power, type = "l")
    
    
    
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
    
    
    #plot 2
    plot(datetime, ydata, type = "n", xlab = "",
         ylab="Energy sub metering")
    lines(datetime, data$Sub_metering_1, type = "l")
    lines(datetime, data$Sub_metering_2, type = "l", col = "red")
    lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty=1, col = c("black", "red", "blue"),cex = 0.8, 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    
    #plot 3
    plot(datetime, data$Voltage, type = "n",xlab = "",
         ylab="Voltage")
    lines(datetime, data$Voltage, type = "l")
    
    #plot 4
    plot(datetime, data$Global_reactive_power, type = "n",xlab = "",
         ylab="Global_reactive_power")
    lines(datetime, data$Global_reactive_power, type = "l")
    
    
    dev.copy(png, file = "plot4.png")
    dev.off()
}