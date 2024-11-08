##plot 4

setwd("H:/Mina dokument_filer/Kurser/R programming")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" , destfile = 'data.zip')
unzip("H:/Mina dokument_filer/Kurser/R programming/data.zip")

INDATA <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ",")
##Filtering dates
# converting string to date 
# filter date and converting string to numeric
pdata <- INDATA[INDATA$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#Graph 1
Global_active_power <- as.numeric(pdata$Global_active_power)
DateTime <- strptime(paste(pdata$Date, pdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
days <- as.POSIXct(c("2007/02/01 00:00", "2007/02/02 00:00", "2007/02/03 00:00"))
day_labels <- c("Thu", "Fri", "Sat")
plot(DateTime, Global_active_power, type = "l", ylab = "Global active Power (kilowatts)", xlab = "", xaxt = "n")
axis(1, at = days, labels = day_labels)

#Graph 2
Voltage <- as.numeric(pdata$Voltage)
DateTime <- strptime(paste(pdata$Date, pdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
days <- as.POSIXct(c("2007/02/01 00:00", "2007/02/02 00:00", "2007/02/03 00:00"))
day_labels <- c("Thu", "Fri", "Sat")
plot(DateTime, Voltage, type = "l", ylab = "Global active Power", xlab = "datetime", xaxt = "n")
axis(1, at = days, labels = day_labels)

#Graph 3
DateTime <- strptime(paste(pdata$Date, pdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
days <- as.POSIXct(c("2007/02/01 00:00", "2007/02/02 00:00", "2007/02/03 00:00"))
day_labels <- c("Thu", "Fri", "Sat")

plot(DateTime, pdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(DateTime, pdata$Sub_metering_2, col = "red")
lines(DateTime, pdata$Sub_metering_3, col = "blue")
axis(1, at = days, labels = day_labels)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#Graph 4
Global_reactive_power <- as.numeric(pdata$Global_reactive_power)
DateTime <- strptime(paste(pdata$Date, pdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
days <- as.POSIXct(c("2007/02/01 00:00", "2007/02/02 00:00", "2007/02/03 00:00"))
day_labels <- c("Thu", "Fri", "Sat")
plot(DateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n")
axis(1, at = days, labels = day_labels)
dev.off()

