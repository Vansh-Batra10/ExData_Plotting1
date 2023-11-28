library(lubridate)
#replace with your file location
t <- read.table("C:/Users/Lenovo/OneDrive/Desktop/DS/ds/datascience/ExData_Plotting1/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
t$Date <- as.Date(t$Date, "%d/%m/%Y")
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
dateTime <- ymd_hms(paste(t$Date, t$Time))
dateTime <- setNames(dateTime, "DateTime")
t <- cbind(dateTime, t)
day_names_abbrev <- format(dateTime, "%a")
plot(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)",xlab="",xaxt="n")
axis(1, at = dateTime, labels = day_names_abbrev)
dev.copy(png,"C:/Users/Lenovo/OneDrive/Desktop/DS/ds/datascience/ExData_Plotting1/plot2.png", width=480, height=480)
dev.off()



