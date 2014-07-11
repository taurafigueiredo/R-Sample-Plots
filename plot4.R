function () 
{
    # Create a temp file
    temp <- tempfile()
    
    # Download zipped file
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
        destfile = temp)
    
    # Unzip and read file 
    ## Only dates 01/02/2007 and 02/02/2017 - rows 66638:69518
    ## Setting NA string as "?" and separator as ";"
    data <- read.table(unz(temp, "household_power_consumption.txt"), 
        na.strings = "?", skip = 66637, nrows = 2880, sep = ";")
    
    # Transform date column
    data <- transform(data, V1 = strptime(paste(data$V1,data$V2),format = "%d/%m/%Y %H:%M:%S"))
    
    # Create a device to write a png file
    png(filename = "plot4.png", width = 480, height = 480)
    
    # Set a new canvas model
    par(mfrow=c(2,2))
    
    # Plot a line graph of Global Active Power by weekday
    ## 3rd column, as describred in the Book Code (link below)
    with(data, plot(V1, V3, type="l", ylab = "Global Active Power", xlab = ""))
    
    # Plot a line graph of Voltage by weekday 
    ## 5th column, as describred in the Book Code (link below)
    with(data, plot(V1, V5, type="l", ylab = "Voltage", xlab = "datetime"))
    
    # Plot a line graph of Energy sub metering by weekday 
    ## 7th to 9th columns, as describred in the Book Code (link below)
    with(data, plot(V1, V7, type="l", xlab = "", ylab = "Energy sub metering"))
    with(data, lines(V1, V8, type="l", col="red"))
    with(data, lines(V1, V9, type="l", col="blue"))
    legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,bty = "n")
    
    # Plot a line graph of Global reactive power by weekday 
    ## 4th column, as describred in the Book Code (link below)
    with(data, plot(V1, V4, type="l", ylab = "Global_reactive_power", xlab = "datetime", lwd = 0.5))
    
    # Code Book: 
    ### https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
    
    # Close the device
    dev.off()
    
    # Delete the temp file
    unlink(temp)
    
    # Remove objects temp and data
    rm(temp)
    rm(data)
}
