setwd("D:/work/coursera")
library(dplyr)
household <- read.table("household_power_consumption.txt", sep = ";", header = T, colClasses = "character")
household$Time <- strptime(paste(household$Date, household$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02", ]
household$Global_active_power[household$Global_active_power == "?"] <- "NA"
household$Global_active_power <- as.numeric(household$Global_active_power)
household$Global_reactive_power <- as.numeric(household$Global_reactive_power)
par(mfcol = c(2, 2), mar = c(4, 4, 1.7, 1)+0.1)

with(household, plot(Time, Global_active_power, type = "s", ylab = "Global Active Power (kilowatts)", xlab = ""))

with(household, plot(Time, Sub_metering_1, type = "s", ylab = "Energy sub metering", xlab = ""))
with(household, lines(Time, Sub_metering_2, col = "red"))
with(household, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", names(household)[7:9], lty = c(1, 1, 1), col = c("black", "red", "blue"), cex=.55, xjust = 1)

household$Voltage <- as.numeric(household$Voltage)
with(household, plot(Time, Voltage, type = "l"), xlab = "datetime")

with(household, plot(Time, Global_reactive_power, type = "s"), xlab = "datetime")
dev.copy(png, "plot4.png")
dev.off()
