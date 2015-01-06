hpc_data<-read.table("household_power_consumption.txt", sep=";", header=T)
df<-subset(hpc_data,xor(hpc_data$Date=="1/2/2007",hpc_data$Date=="2/2/2007"))
hist(as.numeric(levels(df$Global_active_power))[df$Global_active_power],xlab="Global Active Power (killowatts)", col="red", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()


