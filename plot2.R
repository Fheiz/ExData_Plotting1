

plot2 <- function(data_file) {
    
    # Read the data
    data <- read.csv(data_file, sep=";", na.strings = "?")
    
    # Subset the Data on dates 2007-02-01 and 2007-02-02
    sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    # Paste Date and Time in order to have an unique index (used for X index)
    sub <- cbind(sub, Datetime = strptime(paste(sub$Date, sub$Time, sep=" "),
                                          "%d/%m/%Y %H:%M:%S"))
    
    # Save as PNG
    png("plot2.png", bg="transparent")
    
    # Plot the line graph
    plot(sub$Datetime, sub$Global_active_power,
         ylab = "Global Active Power (kilowatts)",
         xlab = "",
         type="l"
    )
    
    # Close the PNG file
    dev.off()
}

plot2("household_power_consumption.txt")
