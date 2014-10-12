# Load required packages for processing data
require(data.table)

# load data set
DT<-fread(input="household_power_consumption.txt",stringsAsFactors=FALSE,na.strings=c("?"," ? "))

# subset the first day
Day1<-(as.numeric(DT[DT$Date == "1/2/2007",Global_active_power]))
# subset the second day
Day2<-(as.numeric(DT[DT$Date == "2/2/2007",Global_active_power]))

# combine the the data for global active power over both days
Data<-c(Day1,Day2)

# plot red histogram.
hist(Data, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")