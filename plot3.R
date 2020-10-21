power <- read.table("household_power_consumption.txt",sep=";",header=T,
                    colClasses = c(rep("character",2),rep("numeric",7)),
                    na.strings = "?")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")
power$Date2 <- as.POSIXct(paste(power$Date,power$Time),format="%Y-%m-%d %T")
ed <- as.Date("02/02/2007",format="%d/%m/%Y")
sd <- as.Date("01/02/2007",format="%d/%m/%Y")
power <- power[power$Date <= ed & power$Date>=sd,]


library(ggplot2)
names(power)
c <- ggplot(power, aes(x=Date2)) + geom_line(aes(y=Sub_metering_1,color="Sub_metering_1")) +
  geom_line(aes(y=Sub_metering_2,color="Sub_metering_2")) + 
  geom_line(aes(y=Sub_metering_3,color="Sub_metering_3")) +
  xlab("Date") + ylab("Global Active Power (kilowatts)")
png("plot3.PNG")
c
dev.off()

lapply(power,class)
as.POSIXct(paste(power$Date,power$Time),format="%Y-%m-%d %T")
