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
plot(DTime,Data$Global_active_power,type="lines", ylab="Global Active Power (kilowatts)")

# Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")

# Don't forget to close the PNG device!
dev.off()