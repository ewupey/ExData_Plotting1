power<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
power$realDate<-strptime(power$Date,format="%d/%m/%Y")

sub.power <- subset(power, 
                    (realDate >= strptime("2007-02-01", format="%Y-%m-%d") & 
                             realDate <= strptime("2007-02-02", format="%Y-%m-%d" )))


sub.power$realTime <- strptime(paste(sub.power$Date, sub.power$Time),format="%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow =c(2,2))
with(sub.power, plot(realTime,Global_active_power, type="l", 
                     ylab = "Global Active Power", xlab=""))

with(sub.power, plot(realTime,Voltage, type="l", 
                      ylab = "Voltage", xlab="datetime"))

with(sub.power, { plot(realTime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
                  lines(realTime,Sub_metering_2,col="red")
                  lines(realTime,Sub_metering_3,col="blue") })
legend("topright", lty=1, col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")


with(sub.power, plot(realTime,Global_reactive_power, type="l", 
                     ylab = "Global_reactive_power", xlab="datetime"))

dev.off()