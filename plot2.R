data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c(rep("character",2), rep("numeric", 7)), na.strings = "?")
dataneeded <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
dataneeded <- transform(dataneeded, Date = as.Date(dataneeded$Date, format = "%d/%m/%Y"), Time = strptime(paste(dataneeded$Date, dataneeded$Time), format = "%d/%m/%Y %H:%M:%S"))
png("plot2.png", width=480, height = 480, units = "px", bg = "transparent")
plot(dataneeded$Time, dataneeded$Global_active_power, type="l", pch=NA, xlab="", ylab = "Global Active Power (kilowatts)", ylim = range(dataneeded$Global_active_power))
dev.off()