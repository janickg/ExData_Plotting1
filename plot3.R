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

# create a line plot
plot(DTime,Data$Sub_metering_1, type="lines", col="black", xlab="", ylab="Energy sub metering")
lines(DTime,Data$Sub_metering_2,col="red")
lines(DTime,Data$Sub_metering_3,col="blue")

# Show legend top right
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=0.2,cex=0.5)

# Copy my plot to a PNG file
dev.copy(png, file = "plot3.png")

# Don't forget to close the PNG device!
dev.off()