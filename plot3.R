power<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
power$realDate<-strptime(power$Date,format="%d/%m/%Y")

sub.power <- subset(power, 
                    (realDate >= strptime("2007-02-01", format="%Y-%m-%d") & 
                             realDate <= strptime("2007-02-02", format="%Y-%m-%d" )))


sub.power$realTime <- strptime(paste(sub.power$Date, sub.power$Time),format="%d/%m/%Y %H:%M:%S")

png("plot3.png")
with(sub.power,  plot(realTime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
with(sub.power, lines(realTime,Sub_metering_2,col="red"))
with(sub.power, lines(realTime,Sub_metering_3,col="blue"))
legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
