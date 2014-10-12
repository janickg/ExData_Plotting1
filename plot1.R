# Load required packages for processing data
require(data.table)

# load data set
DT<-fread(input="household_power_consumption.txt",stringsAsFactors=FALSE,na.strings=c("?"," ? "))

# Get data from the two days from the assignment description
Data<-DT[(DT$Date == "1/2/2007" | DT$Date == "2/2/2007"),]

# reorder by date, then by time
Data<- Data[order(Date,Time)]

# construct a date time vector
DTime <- strptime(paste(Data$Date, Data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

# plot red histogram.
hist(as.numeric(Data$Global_active_power), main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")


# Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")

# Don't forget to close the PNG device!
dev.off()