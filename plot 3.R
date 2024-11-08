### plot 3
setwd("H:/Mina dokument_filer/Kurser/R programming")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" , destfile = 'data.zip')
unzip("H:/Mina dokument_filer/Kurser/R programming/data.zip")

INDATA <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ",")

##Filtering dates
pdata <- INDATA[INDATA$Date %in% c("1/2/2007","2/2/2007") ,]

#merging date and time and setting to time format
DateTime <- strptime(paste(pdata$Date, pdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#setting days as x-axis variables
days <- as.POSIXct(c("2007/02/01 00:00", "2007/02/02 00:00", "2007/02/03 00:00"))
day_labels <- c("Thu", "Fri", "Sat")

#creating plot, adding lines and legend and printing to a png file

png("plot3.png", width=480, height=480)
plot(DateTime, pdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(DateTime, pdata$Sub_metering_2, col = "red")
lines(DateTime, pdata$Sub_metering_3, col = "blue")
axis(1, at = days, labels = day_labels)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off