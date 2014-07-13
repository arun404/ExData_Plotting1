## This function constructs 1 plot based on exploratory data provided.  
## Input is data from Household power consumption on dates jan 1st and 2nd 2007
# Plot gives Energy Submetering details by time
## Plot will be rendered into png device.  This device has to be disconnected at the end


power_cons3 <- function() {
  
  DF <- read.csv.sql("C:\\Users\\Arun\\Documents\\Coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep = ";"                              
                     , sql = "select * 
                              from file where Date in ('1/2/2007', '2/2/2007')" )
  
  dateTime <- strptime( paste(DF$Date,DF$Time), format="%d/%m/%Y %H:%M:%S")

  ##3rd plot
  
  png(filename = "plot3.png"
      ,width = 480, height = 480) #, units = "px", pointsize = 12)
  
  with(DF, plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
  with(DF, lines(dateTime, Sub_metering_2, col = "red"))
  with(DF, lines(dateTime, Sub_metering_3, col = "blue"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
  
}