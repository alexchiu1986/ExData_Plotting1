plot1 <- function() {
    data <- read.csv("household_power_consumption.txt", sep = ";",
                     colClasses = "character")
    
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
    
    data[, "Global_active_power"] <- as.numeric(data[, "Global_active_power"])
    hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",
         col = "red", main = "Global Active Power", breaks = 12)
    dev.copy(png, file = "plot1.png")
    dev.off()
}