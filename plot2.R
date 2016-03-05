plot2 <- function () {
    
    
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
    
    png (file = "plot2.png")
    
    with (data, plot (Global_active_power ~ datetime, ylab = "Global Active Power (kilowatts)",xlab = "",  type="l"))
    dev.off ()    
    
    
    
    
    
}