power <- read.table("household_power_consumption.txt",sep=";",header=T,
                    colClasses = c(rep("character",2),rep("numeric",7)),
                    na.strings = "?")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")
power$Date2 <- as.POSIXct(paste(power$Date,power$Time),format="%Y-%m-%d %T")
ed <- as.Date("02/02/2007",format="%d/%m/%Y")
sd <- as.Date("01/02/2007",format="%d/%m/%Y")
power <- power[power$Date <= ed & power$Date>=sd,]



b <- ggplot(power, aes(x=Date2,y=Global_active_power)) + geom_line() +
  xlab("Date") + ylab("Global Active Power (kilowatts)")

bc <- ggplot(power, aes(x=Date2,y=Voltage)) + geom_line() +
  xlab("Date") + ylab("Voltage")

c <- ggplot(power, aes(x=Date2)) + geom_line(aes(y=Sub_metering_1,color="Sub_metering_1")) +
  geom_line(aes(y=Sub_metering_2,color="Sub_metering_2")) + 
  geom_line(aes(y=Sub_metering_3,color="Sub_metering_3")) +
  xlab("Date") + ylab("Global Active Power (kilowatts)")

d <- ggplot(power, aes(x=Date2,y=Global_reactive_power)) + geom_line() +
  xlab("Date") + ylab("Global Reactive Power (kilowatts)")

library(gridExtra)
grid.arrange(b,bc,c,d,ncol=2)
