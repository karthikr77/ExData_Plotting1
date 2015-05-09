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
plot(hpcDTSet$DateTime,hpcDTSet$Global_active_power, type="l"
     ,ylab="Global Active Power (kilowatts)",xlab="") 
#length(hpcDTSet$Datetime)
#length(hpcDTSet$Global_active_power)
dev.copy(device=png,file=".\\plot2.png", height=480, width=480)
dev.off()