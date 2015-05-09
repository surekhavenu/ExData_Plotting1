## plot the graph with date and time on x-axis and Energy sub meterings on y-axis
## with a legend of different sub meterings
plot3 <- function() {
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
        png("plot3.png",  width = 480, height = 480)
        
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
               col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## close the PNG device
        dev.off()
}