data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c(rep("character",2), rep("numeric", 7)), na.strings = "?")
dataneeded <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
dataneeded <- transform(dataneeded, Date = as.Date(dataneeded$Date, format = "%d/%m/%Y"), Time = strptime(paste(dataneeded$Date, dataneeded$Time), format = "%d/%m/%Y %H:%M:%S"))
png("plot3.png", width=480, height = 480, units = "px", bg = "transparent")
plot(dataneeded$Time, dataneeded$Sub_metering_1, type="l", col="black", pch=NA, xlab="", ylab = "Energy sub metering", ylim = range(dataneeded$Sub_metering_1))
lines(dataneeded$Time, dataneeded$Sub_metering_2, col="red", pch=NA)
lines(dataneeded$Time, dataneeded$Sub_metering_3, col="blue", pch=NA)
legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
dev.off()