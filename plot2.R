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
png(filename = "plot2.png"
    , width = 480
    , height = 480)

##  Generate a line plot with Timestamp as x and Global_active_power as y
with(data
     ,plot(Timestamp
           , Global_active_power
           , type = 'l'
           , xlab = ""
           , ylab = "Global Active Power (kilowatts)"))

##  Close graphic device
dev.off()