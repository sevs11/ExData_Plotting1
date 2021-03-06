power_cons<-read.table("./household_power_consumption.txt", sep=";",header=TRUE,colClasses="character")
power_cons$DateTime <- as.POSIXct(paste(power_cons$Date, power_cons$Time), format="%d/%m/%Y %H:%M:%S")
pow_c<-power_cons[power_cons$DateTime>="2007-02-01 00:00:00"&power_cons$DateTime<"2007-02-03 00:00:00",]
pow_c$Sub_metering_1<-as.numeric(pow_c$Sub_metering_1)
pow_c$Sub_metering_2<-as.numeric(pow_c$Sub_metering_2)
pow_c$Sub_metering_3<-as.numeric(pow_c$Sub_metering_3)
plot(pow_c$DateTime,pow_c$Sub_metering_1, ylab="Enegry sub metering",xlab="",type="l", col="Black")
lines(pow_c$DateTime,pow_c$Sub_metering_2, col="Red")
lines(pow_c$DateTime,pow_c$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black", "Red", "Blue"),
        lty = c(1, 1, 1), pch = c(NA, NA, NA))
dev.copy(png, file="plot3.png", width=480, height=480) 
dev.off() 