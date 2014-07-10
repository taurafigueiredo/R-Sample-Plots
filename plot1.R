function () 
{
    library(data.table)
    data <- fread("power_consumption.txt", na.strings = "?", 
        skip = 66637, nrows = 2880)
    hist(x = data$V3, col = "red", main = "Global Active Power", 
        xlab = "Global Active Power (killowatts)")
}
