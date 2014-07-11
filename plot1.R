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
    
    # Create a device to write a png file
    png(filename = "plot1.png", width = 480, height = 480)
    
    # Plot a histogram graph of Global Active Power 
    ## 3rd column, as describred in the Book Code
    ### https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
    hist(x = data$V3, col = "red", main = "Global Active Power", 
        xlab = "Global Active Power (killowatts)")
    
    # Close the device
    dev.off()
    
    # Delete the temp file
    unlink(temp)
    
    # Remove objects temp and data
    rm(temp)
    rm(data)
}
