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
b <- ggplot(power, aes(x=Date2,y=Global_active_power)) + geom_line() +
  xlab("Date") + ylab("Global Active Power (kilowatts)")
png("plot2.PNG")
b
dev.off()

lapply(power,class)
as.POSIXct(paste(power$Date,power$Time),format="%Y-%m-%d %T")
