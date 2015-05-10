# Source the function that gets raw data amd make them tidy
source("getdata.R")

# Get data
data <- getData()

# Start graphical device
png("plot2.png")

# Plot the data
plot(data$timestamp, data$global_active_power, type = "l",
     xlab = NA, ylab = "Global Active Power (kilowatts)")


# Close the graphical device
dev.off()



