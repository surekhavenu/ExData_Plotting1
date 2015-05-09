## plots four different graphs with date and time on x-axis and various other
## parameter
plot4 <- function() {
        ## check for file exists or not
        if(!file.exists("household_power_consumption.txt"))
                return("File household_power_consumption.txt does not exist in current directory")

        ## read the entire file and store into data frame df
        df <- read.table("household_power_consumption.txt", sep = ";", header = T,  
                         stringsAsFactors = F, na.strings = "?")
        
        ## extract data from the dates 2007-02-01 and 2007-02-02 and store into data frame df
        df <- df[(as.Date(df$Date, "%d/%m/%Y") == as.Date("2007-02-01", "%Y-%m-%d")) | 
                 (as.Date(df$Date, "%d/%m/%Y") == as.Date("2007-02-02", "%Y-%m-%d")), ]
        
        ## Open PNG device with a width of 480 pixels and a height of 480 pixels. This creates
        ## a PNG file in my working directory
        png("plot4.png",  width = 480, height = 480)
        
        ## set the layout margin
        par(mar = c(4, 4, 4, 4))
        
        ## Set the layout with 2 rows and 2 columns 
        par(mfrow = c(2,2), mfcol = c(2,2))
        
        ## plot the graph with date and time on x-axis and Global Active Power on Y-axis
        plot(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"), 
             df$Global_active_power, 
             xlab = "",
             ylab = "Global Active Power", 
             type = "l")
        
        ## plot with no plotting
        plot(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"), 
             df$Sub_metering_1,
             xlab = "",
             ylab = "Energy sub metering",
             type = "n")
        
        ## draw balck lines representing Sub_metering_1 againt date and time
        lines(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"),
              df$Sub_metering_1,
              col = "black")
        
        ## draw red lines representing Sub_metering_2 againt date and time
        lines(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"),
              df$Sub_metering_2,
              col = "red")
        
        ## draw blue lines representing Sub_metering_1 againt date and time
        lines(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"),
              df$Sub_metering_3,
              col = "blue")
        
        ## add legend on top right corner with black, red, blue lines representing
        ## Sub_metering_1, Sub_metering_2, Sub_metering_3 respectively
        legend("topright", 
               lty = c(1, 1, 1), 
               cex = 0.9,
               bty = "n",
               col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## plot the graph with date and time on x-axis and Voltage on Y-axis
        plot(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"), 
             df$Voltage,
             xlab = "datetime",
             ylab = "Voltage", 
             type = "l")
        
        ## plot the graph with date and time on x-axis and Global_reactive_power on Y-axis
        plot(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"), 
             df$Global_reactive_power,
             xlab = "datetime",
             ylab = "Global_reactive_power", 
             type = "l")
        
        ## close the PNG device
        dev.off()        
}