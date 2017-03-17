plot2 <- function() {
    data <- read.csv("household_power_consumption.txt", sep = ";",
                     colClasses = "character")
    
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
    
    data[, "Global_active_power"] <- as.numeric(data[, "Global_active_power"])
    
    datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")
    
    plot(datetime, data$Global_active_power, type = "n", xlab = "",
         ylab="Global Active Power (kilowatts)")
    lines(datetime, data$Global_active_power, type = "l")
    
    dev.copy(png, file = "plot2.png")
    dev.off()
}