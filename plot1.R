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
png(filename = "plot1.png"
    , width = 480
    , height = 480)

##  Generate histogram of Global_active_power with labels, title, and color red
hist(data$Global_active_power
     , xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency"
     , col = "red"
     , main = "Global Active Power")

##  Close graphic device
dev.off()