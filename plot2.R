hpc_data<-read.table("household_power_consumption.txt", sep=";", header=T)
df<-subset(hpc_data,xor(hpc_data$Date=="1/2/2007",hpc_data$Date=="2/2/2007"))
plot(finalTime,as.numeric(levels(df$Global_active_power))[df$Global_active_power], ylab="Global Active Power (killowatts)", xlab="",type="l")
dev.copy(png, file = "plot2.png")
dev.off()


