source("ensureDataPresence.R")

# After having grabbed the data  
dataset=grabData()

#PNG device with requested size 
png("plot2.png", width=480, height=480)

# Simple Plot
plot(dataset$Time, dataset$Global_active_power,   type="l",   xlab="",   ylab="Global Active Power (kilowatts)")

# Device OFF
dev.off()