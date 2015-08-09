##  Read in raw data from household_power_consuption.txt 
##  with ? as NA from data sub folder in working directory
data_raw <- read.table("./data/household_power_consumption.txt", sep= ";"
                       , header = TRUE
                       , na.strings = "?"
                       , stringsAsFactors = FALSE)

##  Create new Timestamp variable built from Data and Time in raw data
data_raw$Timestamp <- strptime(paste(data_raw$Date, data_raw$Time)
                               , "%d/%m/%Y %H:%M:%S")

##  Subset data to the range of observations between 2007-02-01 and 2007-02-02
data <- subset(data_raw
               , Timestamp >= "2007-02-01" & Timestamp < "2007-02-03")

##  Intialize png graphic device with size 480x480
png(filename = "plot4.png"
    , width = 480
    , height = 480)

##  Generate 4 different plots 
##  1. Timestamp by Global_active_power with y label
##  2. Timestamp by Voltage with datetime x label
##  3. Timestamp by all 3 sub metering each in different colors with a borderless legend
##  4. Timestamp by Global_reactive_power with datetime x label
par(mfrow = c(2, 2))
with(data, {
        plot(Timestamp
             , Global_active_power
             , type = 'l'
             , xlab = ""
             , ylab = "Global Active Power (kilowatts)")
        plot(Timestamp
             , Voltage
             , type = 'l'
             , xlab = "datetime")
        plot(Timestamp
             , Sub_metering_1
             , type = "n"
             , xlab = ""
             , ylab = "Energy sub metering")
                with(data, lines(Timestamp, Sub_metering_1, col = "black"))
                with(data, lines(Timestamp, Sub_metering_2, col = "red"))
                with(data, lines(Timestamp, Sub_metering_3, col = "blue"))
                legend("topright"
                       , lty = 1
					   , bty = "n"
                       , col = c("black", "red", "blue")
                       , legend = c("Sub_metering_1"
                                    , "Sub_metering_2"
                                    ,"Sub_metering_3"))
        plot(Timestamp
             , Global_reactive_power
             , type = 'l'
             , xlab = "datetime")
})


##  Close graphic device
dev.off()