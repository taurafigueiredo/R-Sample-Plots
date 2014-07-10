function () 
{
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
        destfile = temp)
    data <- read.table(unz(temp, "household_power_consumption.txt"), 
        na.strings = "?", skip = 66637, nrows = 2880, sep = ";")
    hist(x = data$V3, col = "red", main = "Global Active Power", 
        xlab = "Global Active Power (killowatts)")
    unlink(temp)
    rm(temp)
    rm(data)
}
