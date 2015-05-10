# Source the function that gets raw data amd make them tidy
source("getdata.R")

# Get data
data <- getData()

# Start graphical device
png("plot3.png")

# Plot the data
with(data, {
  plot(timestamp, sub_metering_1, "l", xlab = NA, ylab = "Energy sub metering")
  lines(timestamp, sub_metering_2, "l", col = "red")
  lines(timestamp, sub_metering_3, "l", col = "blue")
  
})

# Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lwd = 1)

# Close the graphical device
dev.off()



