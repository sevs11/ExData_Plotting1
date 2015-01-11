power_cons<-read.table("./household_power_consumption.txt", sep=";",header=TRUE)
power_cons$DateTime <- as.POSIXct(paste(power_cons$Date, power_cons$Time), format="%d/%m/%Y %H:%M:%S")
pow_c<-power_cons[power_cons$DateTime>="2007-02-01 00:00:00"&power_cons$DateTime<"2007-02-03 00:00:00",]
pow_c$Global_active_power<-as.numeric(pow_c$Global_active_power)
hist(pow_c$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480) 
dev.off() 