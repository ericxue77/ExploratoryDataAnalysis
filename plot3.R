##Create the file device
png(file = "plot3.png")

##Read the file
hpc_data<-read.table("household_power_consumption.txt", sep=";", header=T)

##Select the data
df<-subset(hpc_data,xor(hpc_data$Date=="1/2/2007",hpc_data$Date=="2/2/2007"))

##Draw the plot
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
> 

##close the device
dev.off()


