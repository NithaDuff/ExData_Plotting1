png("plot3.png",width = 480,height = 480)

write(grep("^[1|2]/2/2007;*", readLines("household_power_consumption.txt"),value = T),"required_data.txt")
data <- read.table("required_data.txt",na.strings = '?',header = F, sep = ";",
                   col.names =  read.table("household_power_consumption.txt",header = T,nrows = 1,sep = ";") %>% colnames(),
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

xaxis <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

with(data,plot(Sub_metering_1~xaxis,type = "l",xlab = ' ', ylab = "Energy sub metering"),na.rm = T)
lines(xaxis,data$Sub_metering_2,col="red",type = "l")
lines(xaxis,data$Sub_metering_3,col="blue",type = "l")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"),lty = c(1,1,1))

dev.off()