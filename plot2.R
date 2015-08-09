setwd("D:/work/coursera")
household <- read.table("household_power_consumption.txt", sep = ";", header = T, colClasses = "character")
household$Time <- strptime(paste(household$Date, household$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02", ]
household$Global_active_power[household$Global_active_power == "?"] <- "NA"
household$Global_active_power <- as.numeric(household$Global_active_power)
par(mfcol = c(1, 1), mar = c(5, 4, 4, 2)+0.1)
png("plot2.png")
with(household, plot(Time, Global_active_power, type = "s", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()