power <- read.table("household_power_consumption.txt",sep=";",header=T,
                    colClasses = c(rep("character",2),rep("numeric",7)),
                    na.strings = "?")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")
ed <- as.Date("02/02/2007",format="%d/%m/%Y")
sd <- as.Date("01/02/2007",format="%d/%m/%Y")
power <- power[power$Date <= ed & power$Date>=sd,]


library(ggplot2)
names(power)
a <- ggplot(power, aes(x=Global_active_power)) + 
  geom_histogram(binwidth=0.5,fill="red") + xlab("Global Active Power (kilowatts)") +
  ylab("Frequency") + ggtitle("Global Active Power")
png("plot1.PNG")
a
dev.off()

