

plot1 <- function(data_file) {
    
    # Read the data
    data <- read.csv(data_file, sep=";", na.strings = "?")
    
    # Subset the Data on dates 2007-02-01 and 2007-02-02
    sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    # Save as PNG
    png("plot1.png", bg="transparent")
    
    # Create the histogram
    hist(as.numeric(as.character(sub$Global_active_power)),
         col="red",
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)"
    )
    
    # Close the PNG file
    dev.off()
}

plot1("household_power_consumption.txt")
