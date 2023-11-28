#replace with your file location
t <- read.table("C:/Users/Lenovo/OneDrive/Desktop/DS/ds/datascience/ExData_Plotting1/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
t$Date <- as.Date(t$Date, "%d/%m/%Y")
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"C:/Users/Lenovo/OneDrive/Desktop/DS/ds/datascience/ExData_Plotting1/plot1.png", width=480, height=480)
dev.off()