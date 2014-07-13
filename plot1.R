## This function constructs 1 plot based on exploratory data provided.  
## Input is data from Household power consumption on dates jan 1st and 2nd 2007
## Plot gives Global Active Power histogram
## Plot will be rendered into png device.  This device has to be disconnected at the end


power_cons1 <- function() {
  
  DF <- read.csv.sql("C:\\Users\\Arun\\Documents\\Coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep = ";"                              
                     , sql = "select Date, Global_active_power  from file where Date in ('1/2/2007', '2/2/2007') ")
  
  png(filename = "plot1.png"
      ,width = 480, height = 480) #, units = "px", pointsize = 12)
  
  hist(DF$Global_active_power
       ,xlab = "Global Active Power (kilowatts)", col = "red"
       ,main = "Global Active Power")
  
  dev.off()
  
  
  #head(DF)
  #Date     
  #Time 
  #Global_active_power 
  #Global_reactive_power 
  #Voltage 
  #Global_intensity 
  #Sub_metering_1
  #Sub_metering_2 
  #Sub_metering_3
  
}