setwd("C:\\CoursEra\\Exploratory Data Analysis\\Project 1")
#2007-02-01 and 2007-02-02
dataFile=".\\household_power_consumption.txt"
hpc<-read.table(dataFile,header=TRUE,sep=";",stringsAsFactors=FALSE)
#str(hpc)
#head(hpc,n=3)
hpcDTSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
#head(hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),],n=3)
#head(hpcDTSet,n=3)
hpcDTSet$DateTime <- strptime(paste(hpcDTSet$Date, hpcDTSet$Time), "%d/%m/%Y %H:%M:%S")
hpcDTSet$Date <- as.Date(hpcDTSet$Date, format="%d/%m/%Y") 
hpcDTSet$Global_active_power <- as.numeric(hpcDTSet$Global_active_power)
hpcDTSet$Sub_metering_1 <- as.numeric(hpcDTSet$Sub_metering_1) 
hpcDTSet$Sub_metering_2 <- as.numeric(hpcDTSet$Sub_metering_2) 
#length(hpcDTSet$Datetime)
#length(hpcDTSet$Global_active_power)
plot(hpcDTSet$DateTime, hpcDTSet$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpcDTSet$DateTime,hpcDTSet$Sub_metering_2,col="Red")
lines(hpcDTSet$DateTime,hpcDTSet$Sub_metering_3,col="Blue")
legend("topright",lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#without lty color is not setting
dev.copy(device=png,file=".\\plot3.png", height=480, width=480)
dev.off()