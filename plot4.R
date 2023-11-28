library(lubridate)
#replace with your file location
t <- read.table("C:/Users/Lenovo/OneDrive/Desktop/DS/ds/datascience/ExData_Plotting1/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
t$Date <- as.Date(t$Date, "%d/%m/%Y")
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
dateTime <- ymd_hms(paste(t$Date, t$Time))
dateTime <- setNames(dateTime, "DateTime")
t <- cbind(dateTime, t)
day_names_abbrev <- format(dateTime, "%a")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(t, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="",xaxt="n")
  axis(1, at = dateTime, labels = day_names_abbrev)
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage (volt)", xlab="",xaxt="n")
  axis(1, at = dateTime, labels = day_names_abbrev)
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="",xaxt="n")
  axis(1, at = dateTime, labels = day_names_abbrev)
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="",xaxt="n")
  axis(1, at = dateTime, labels = day_names_abbrev)
})
dev.copy(png,"C:/Users/Lenovo/OneDrive/Desktop/DS/ds/datascience/ExData_Plotting1/plot4.png", width=480, height=480)
dev.off()


