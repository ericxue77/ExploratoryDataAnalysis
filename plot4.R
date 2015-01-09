##Create the file device
png(file = "plot4.png")

##Read the file
hpc_data<-read.table("household_power_consumption.txt", sep=";", header=T)

##Select the data
df<-subset(hpc_data,xor(hpc_data$Date=="1/2/2007",hpc_data$Date=="2/2/2007"))

##Set the grid
par(mfrow=c(2,2),mar=c(5,4,4,4))

##Draw the plot 1
plot(finalTime,as.numeric(levels(df$Global_active_power))[df$Global_active_power], ylab="Global Active Power (killowatts)", xlab="",type="l")

##Draw the plot 2
plot(finalTime,as.numeric(levels(df$Voltage))[df$Voltage], ylab="Voltage", xlab="",type="l")

##Draw the plot 3
plot(finalTime,as.numeric(levels(df$Sub_metering_1))[df$Sub_metering_1], ylab="Energy sub metering", xlab="",type="l")

##Add line for sub metering 2
lines(finalTime,as.numeric(levels(df$Sub_metering_2))[df$Sub_metering_2], col="red")

##Convert sub metering 3
df$Sub_metering_3<-as.character(df$Sub_metering_3)
df$Sub_metering_3[df$Sub_metering=="?"]<-"0"
df$Sub_metering_3<-as.factor(df$Sub_metering_3)

##Draw the sub metering 3
lines(finalTime,as.numeric(levels(df$Sub_metering_3))[df$Sub_metering_3], col="blue")

##Add legend
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = c(1,1,1))


##Draw the plot 4
plot(finalTime,as.numeric(levels(df$Global_reactive_power))[df$Global_reactive_power], ylab="Global_reactive_power", xlab="",type="l")



##close the device
dev.off()


