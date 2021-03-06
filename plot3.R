fullData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", stringsAsFactors = FALSE)
dfHPC <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007" )
rm(fullData)

tmpLocale <- Sys.getlocale(category = "LC_TIME")
Sys.setlocale(category = "LC_TIME", "English")

dfHPC$Date <- as.character(dfHPC$Date)
dfHPC$Time <- as.character(dfHPC$Time)
dfHPC$DateTime <- paste(dfHPC$Date, dfHPC$Time)
dfHPC$DateTime <- strptime(dfHPC$DateTime, "%d/%m/%Y %H:%M:%S")


dfHPC$Global_active_power <- as.numeric(dfHPC$Global_active_power)
dfHPC$Global_reactive_power <- as.numeric(dfHPC$Global_reactive_power)
dfHPC$Voltage <- as.numeric(dfHPC$Voltage)
dfHPC$Sub_metering_1 <- as.numeric(dfHPC$Sub_metering_1)
dfHPC$Sub_metering_2 <- as.numeric(dfHPC$Sub_metering_2)
dfHPC$Sub_metering_3 <- as.numeric(dfHPC$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")

plot(dfHPC$DateTime, dfHPC$Sub_metering_1, , type = "s", xlab = "", ylab = "Energy sub metering", col = "black")
lines(dfHPC$DateTime, dfHPC$Sub_metering_2, type = "s", col = "red")
lines(dfHPC$DateTime, dfHPC$Sub_metering_3, type = "s", col = "blue")
legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1, col=c("black", "red", "blue"), lty="solid")

dev.off()

Sys.setlocale(category = "LC_TIME", tmpLocale)