source("ensureDataPresence.R")

# After having grabbed the data  
dataset=grabData()

#PNG device with requested size 
png("plot3.png", width=480, height=480)

# Plot type = l for lines 
plot(dataset$Time, dataset$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
# red line
lines(dataset$Time, dataset$Sub_metering_2, col="red")
# blue line 
lines(dataset$Time, dataset$Sub_metering_3, col="blue")
# legend with lines and colors
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
# I get the short days in Italian on the x ticks because my locale is Italian... 

# Device OFF
dev.off()