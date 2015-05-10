# Source the function that gets raw data and make them tidy
source("getdata.R")

# Get data
data <- getData()

# Start graphical device
png("plot4.png")

# Plot the data

par(mfrow = c(2, 2))

with(data, {
  
  plot(timestamp, global_active_power, type = "l",
       xlab = NA, ylab = "Global Active Power (kilowatts)")
  
  plot(timestamp, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
 
  plot(timestamp, sub_metering_1, "l", xlab = NA, ylab = "Energy sub metering")
  lines(timestamp, sub_metering_2, "l", col = "red")
  lines(timestamp, sub_metering_3, "l", col = "blue")
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"),
         lwd = 1, bty = "n")
  
  plot(timestamp, global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
})

# Close the graphical device
dev.off()



