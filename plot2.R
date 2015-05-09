## plot the graph with date and time on x-axis and Global Active Power on Y-axis
plot2 <- function() {
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
        ## a PNG file in current working directory
        png("plot2.png",  width = 480, height = 480)
        
        ## plot the graph with date and time on x-axis and Global Active Power on Y-axis
        plot(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"), 
             df$Global_active_power, 
             xlab = "",
             ylab = "Global Active Power (kilowatts)", 
             type = "l")
        
        ## close the PNG device
        dev.off()
}        