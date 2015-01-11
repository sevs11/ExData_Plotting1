power_cons<-read.table("./household_power_consumption.txt", sep=";",header=TRUE,colClasses="character")
power_cons$DateTime <- as.POSIXct(paste(power_cons$Date, power_cons$Time), format="%d/%m/%Y %H:%M:%S")
pow_c<-power_cons[power_cons$DateTime>="2007-02-01 00:00:00"&power_cons$DateTime<"2007-02-03 00:00:00",]
pow_c$Global_active_power<-as.numeric(pow_c$Global_active_power)
plot(pow_c$DateTime,pow_c$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.copy(png, file="plot2.png", width=480, height=480) 
dev.off() 