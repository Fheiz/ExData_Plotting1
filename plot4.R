

plot4 <- function(data_file) {
    
    # Read the data
    data <- read.csv(data_file, sep=";", na.strings = "?")
    
    # Subset the Data on dates 2007-02-01 and 2007-02-02
    sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    # Paste Date and Time in order to have an unique index (used for X index)
    sub <- cbind(sub, Datetime = strptime(paste(sub$Date, sub$Time, sep=" "),
                                          "%d/%m/%Y %H:%M:%S"))
    
    # Save as PNG
    png("plot4.png", bg="transparent")
    
    # We need 4 subplots : 2 rows, 2 columns
    par(mfcol = c(2, 2))
    
    # First plot
    plot(sub$Datetime, sub$Global_active_power,
         ylab = "Global Active Power",
         xlab = "",
         type="l"
    )
    
    # Plot 2
    plot(sub$Datetime, sub$Sub_metering_1,
         ylab = "Energy sub metering",
         xlab = "",
         type="l"
    )
    
    # Add the second line
    lines(sub$Datetime, sub$Sub_metering_2, col = "red")
    
    # Add the third line
    lines(sub$Datetime, sub$Sub_metering_3, col = "blue")
    
    # Add the legend
    
    legend("topright", col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lwd= 1,
           bty = "n"
    )
    
    # Plot 3
    plot(sub$Datetime, sub$Voltage,
         ylab="Voltage",
         xlab="datetime",
         type="l"
    )
    
    # Plot 4
    plot(sub$Datetime, sub$Global_reactive_power,
         ylab="Global_reactive_power",
         xlab="datetime",
         type="l"
    )
    
    # Close the PNG file
    dev.off()
}

plot4("household_power_consumption.txt")
