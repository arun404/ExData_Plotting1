## This function constructs 4 plots in 2 X 2 matrix based on exploratory data provided.  
## Input is data from Household power consumption on dates jan 1st and 2nd 2007
## Output will be 4 plots - 
## 1st plot - Line plot of Global Active power
## 2nd plot - line plot of Voltage on y axis wrto dates with time 
## 3rd plot - 3 types of Energy Sub metering, with legend and colors
## 4th plot - Global Reactive power wrt datetime
## All the plots will be rendered into png device.  This device has to be disconnected at the end


power_cons4 <- function() {
  
  DF <- read.csv.sql("C:\\Users\\Arun\\Documents\\Coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep = ";"                              
                     , sql = "select * from file where Date in ('1/2/2007', '2/2/2007') ")

  dateTime <- strptime( paste(DF$Date,DF$Time), format="%d/%m/%Y %H:%M:%S")
  
  ##4th plot
  
  png(filename = "plot4.png"
      ,width = 480, height = 480) #, units = "px", pointsize = 12)
  
  par(mfrow = c(2,2))
  
  with(DF, 
      {
      #1st plot
      plot(dateTime, xlab = "", ylab = "Global Active Power", Global_active_power, type = "l")
      #2nd plot
      plot( dateTime, Voltage, type = "l",xlab = "datetime", ylab = "Voltage")
      #3rd plot
      plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
      lines(dateTime, Sub_metering_2, col = "red")
      lines(dateTime, Sub_metering_3, col = "blue")
      legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      #4th plot
      plot(dateTime,Global_reactive_power, type ='l', xlab ="datetime")
      }
      )
  
  dev.off()
   
}