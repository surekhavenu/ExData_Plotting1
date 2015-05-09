## plots the histogram of Global Active Power
plot1 <- function() {
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
        png("plot1.png",  width = 480, height = 480)
        
        ## plot the histogram of Global Active Power 
        hist(df$Global_active_power, 
             col = "RED", 
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
        
        ## close the PNG device
        dev.off()
}