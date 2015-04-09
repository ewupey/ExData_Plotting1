power<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
power$realDate<-strptime(power$Date,format="%d/%m/%Y")

sub.power <- subset(power, 
                    (realDate >= strptime("2007-02-01", format="%Y-%m-%d") & 
                     realDate <= strptime("2007-02-02", format="%Y-%m-%d" )))

png("plot1.png")
with(sub.power,hist(Global_active_power, col="red", main="Global Active Power", 
                   xlab="Global Active Power (kilowatts)"))
dev.off()
