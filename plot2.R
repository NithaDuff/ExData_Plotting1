png("plot2.png",width = 480,height = 480)
write(grep("^[1|2]/2/2007;*", readLines("household_power_consumption.txt"),value = T),"required_data.txt")
data <- read.table("required_data.txt",na.strings = '?',header = F, sep = ";",
                   col.names =  read.table("household_power_consumption.txt",header = T,nrows = 1,sep = ";") %>% colnames(),
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
xaxis <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
with(data,plot(Global_active_power~xaxis ,type = "l",xlab = ' ', ylab = "Global Active Power(kilowatts)"),na.rm = T)
dev.off()