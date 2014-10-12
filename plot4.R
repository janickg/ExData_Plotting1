# Load required packages for processing data
require(data.table)
require(dplyr)

# load data set
DT<-fread(input="household_power_consumption.txt",stringsAsFactors=FALSE,na.strings=c("?"," ? "))


# Get data from the two days from the assignment description
Data<-DT[(DT$Date == "1/2/2007" | DT$Date == "2/2/2007"),]

# reorder by date, then by time
Data<- Data[order(Date,Time)]

# construct a date time vector
DTime <- strptime(paste(Data$Date, Data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

# 4 figures arranged in 2 rows and 2 columns
par(mfrow=c(2,2))

# first plot (1,1): Global Active Power
plot(DTime,as.numeric(Data$Global_active_power), type="lines", col="black", 
     xlab="", ylab="Global Active Power")


# second plot (1,2): Voltage over time
plot(DTime,as.numeric(Data$Voltage), type="lines", col="black", 
     xlab="", ylab="Voltage")

# third plot (2,1): Energy sub metering
plot(DTime,Data$Sub_metering_1, type="lines", col="black", xlab="", ylab="Energy sub metering")
lines(DTime,Data$Sub_metering_2,col="red")
lines(DTime,Data$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=0.1,cex=0.5)

# fourth plot (2,2): Global reactive power
plot(DTime,as.numeric(Data$Global_reactive_power), type="lines", col="black", 
     xlab="", ylab="Global Reactive Power")

# Copy my plot to a PNG file
dev.copy(png, file = "plot4.png")

# Don't forget to close the PNG device!
dev.off()