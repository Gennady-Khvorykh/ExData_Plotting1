# Function getData() reads 'household_power_consumption.txt' file line by line and 
# returns the data frame containing the observations for February 1st and 2nd in 2007.
# It also gets the list of features from the same file, makes it to be descriptive and sets 
# as column names. 

getData <- function(){
  
  # Create connection
  con <- file("household_power_consumption.txt", "r")
  
  # Exctract the features and make them descriptive
  features <- readLines(con, 1)
  features <- unlist(strsplit(features, ";"))
  features <- tolower(features)
  
  # Initialaize the output as list
  out <- list()
  
  obs <- 1 # Count the number of observations starting from 1
  
  # Read further the file line by line
  while(length(line <- readLines(con, 1)) > 0) {
    
    ## Skip the lines not having '1/2/2007' or '2/2/2007'
    if (!grepl("^1/2/2007|^2/2/2007", line)) next
    
    # Replace '?' for NA
    if (grepl("\\?", line)) line <- gsub("\\?", "NA", line)
    
    # Split the line into character vector
    l <- unlist(strsplit(line, ";"))
        
    # If there is a missing value at the end of string, add 'NA' 
    if (grepl(";$", line)) l <- append(l, "NA")
    
    # Add line to output list
    out[[obs]] <- l
    obs <- obs + 1 
    
  }
  
  # Close connection
  close(con)  
  
  # Make a matrix from the list
  out <- do.call(rbind, out)
  
  # Convert the matrix into data frame
  out <- as.data.frame(out,  stringsAsFactors = F)
  
  # Set the names for data frame
  names(out) <- features
  
  # Combine 'date' and 'time' and convert to POSIXlt
  out$timestamp <- strptime(paste(out$date, out$time), "%d/%m/%Y %H:%M:%S")
  
  # Set numeric class for columns from 3 to 9 
    for (n in names(out)[3:9]) {
      out[[n]] <- as.numeric(out[[n]])
    }
  
  out
  
}