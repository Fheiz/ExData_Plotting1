

plot3 <- function(data_file) {
    
    # Read the data
    data <- read.csv(data_file, sep=";", na.strings = "?")
    
    # Subset the Data on dates 2007-02-01 and 2007-02-02
    sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    # Paste Date and Time in order to have an unique index (used for X index)
    sub <- cbind(sub, Datetime = strptime(paste(sub$Date, sub$Time, sep=" "),
                                          "%d/%m/%Y %H:%M:%S"))
    
    # Save as PNG
    png("plot3.png", bg="transparent")
    
    # Plot the first line graph
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
           lwd=1
    )
    
    # Close the PNG file
    dev.off()
}

plot3("household_power_consumption.txt")
