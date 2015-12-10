source("ensureDataPresence.R")

# After having grabbed the data  
dataset=grabData()

#PNG device with requested size 
png("plot1.png", width=480, height=480)

# Histogram with axis labels and title, plus bars in red 
hist(dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Close the device 
dev.off()



