plot3 <- function () {
    
    
    
    library (data.table)    
    library (lubridate)

    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    if (!file.exists ("./data")) {
        dir.create ("./data")
        download.file (url, "./data/household_power_consumption.zip")
        unzip ("./data/household_power_consumption.zip", "./data")
    }
    data.all <- fread ("./data/household_power_consumption.txt", na.strings = "?")
    
    data.all 
    data <- data.all [Date %in% c("1/2/2007", "2/2/2007")]
    
    data[, datetime := as.POSIXct (paste (Date, Time), format = "%d/%m/%Y %H:%M:%S")]
    data [, wd := wday(datetime, label=TRUE)]
    
    png (file = "plot3.png")
    with (data, {
        plot (Sub_metering_1 ~ datetime, xlab = "", ylab = "Energy sub metering",  type = "l", col="black")
        lines (Sub_metering_2 ~ datetime, col="red")
        lines (Sub_metering_3 ~ datetime, col="blue") }
    )
    legend ("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
                                                                    
    dev.off ()    
    
    
    
    
}