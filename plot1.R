plot1 <- function () {

library (data.table)    

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists ("./data")) {
    dir.create ("./data")
    download.file (url, "./data/household_power_consumption.zip")
    unzip ("./data/household_power_consumption.zip", "./data")
}
data.all <- fread ("./data/household_power_consumption.txt", na.strings = "?")

data.all 
data <- data.all [Date %in% c("1/2/2007", "2/2/2007")]
                  
#data[, datetime := as.POSIXct (paste (Date, Time), format = "%d/%m/%Y %H:%M:%S")]
png (file = "plot1.png")

hist (data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off ()
}
