# Source the function that gets raw data and make them tidy
source("getdata.R")

# Get data
data <- getData()

# Start graphical device
png("plot1.png")

# Plot the histogram
hist(data$global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)", 
     axes = F)

# Add axis
axis(1)
axis(2)
axis(2, at = 1200, labels = 1200)

# Close the graphical device
dev.off()



