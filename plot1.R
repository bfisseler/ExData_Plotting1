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

png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(dfHPC$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()

Sys.setlocale(category = "LC_TIME", tmpLocale)