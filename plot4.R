source("ensureDataPresence.R")

# After having grabbed the data  
dataset=grabData()

#PNG device with requested size 
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
# Top left
plot(dataset$Time, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# Top right
plot(dataset$Time, dataset$Voltage, type="l", xlab="datetime", ylab="Voltage")
# Bottom left 
plot(dataset$Time, dataset$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(dataset$Time, dataset$Sub_metering_2, col="red")
lines(dataset$Time, dataset$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,box.lwd=0)
# Bottom right
plot(dataset$Time, dataset$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(dataset$Time, dataset$Global_reactive_power)

dev.off()
