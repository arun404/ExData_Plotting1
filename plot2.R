## This function constructs 1 plot based on exploratory data provided.  
## Input is data from Household power consumption on dates jan 1st and 2nd 2007
# Plot gives Global Active power details by time
## Plot will be rendered into png device.  This device has to be disconnected at the end


power_cons2 <- function() {
  
  DF <- read.csv.sql("C:\\Users\\Arun\\Documents\\Coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep = ";"                              
                     , sql = "select Date, Time, Global_active_power 
                              from file where Date in ('1/2/2007', '2/2/2007')" )
  
  dateTime <- strptime( paste(DF$Date,DF$Time), format="%d/%m/%Y %H:%M:%S")
  
  ##2nd plot
  
  png(filename = "plot2.png"
      ,width = 480, height = 480) #, units = "px", pointsize = 12)

  with(DF, plot(dateTime, xlab = "", ylab = "Global Active Power (kilowatts)", Global_active_power, type = "l"))
    
  
  dev.off()
  
}