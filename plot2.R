power<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
power$realDate<-strptime(power$Date,format="%d/%m/%Y")

sub.power <- subset(power, 
                    (realDate >= strptime("2007-02-01", format="%Y-%m-%d") & 
                     realDate <= strptime("2007-02-02", format="%Y-%m-%d" )))


sub.power$realTime <- strptime(paste(sub.power$Date, sub.power$Time),format="%d/%m/%Y %H:%M:%S")

png("plot2.png")
with(sub.power, plot(realTime,Global_active_power, type="l", 
                     ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()