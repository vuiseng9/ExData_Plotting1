## Setting Working Directory
setwd("C://Users/vchua/Desktop/MyProCert/Exploratory_Data_Analysis/ExData_Plotting1/")

## Storing header
header <- read.table('household_power_consumption.txt', 
                     nrows = 1, 
                     header = TRUE, 
                     sep =';', 
                     stringsAsFactors = FALSE)

## Import the subset of interest
df <- read.table('household_power_consumption.txt',
           header = FALSE,
           sep = ';',
           skip = 66637,
           nrows = 2880,
           stringsAsFactors = FALSE)

## renaming df column name with header column name
names(df) <- names(header)

## Create a datetime of posix type with Date & Time column
df$datetime <- strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %T")

## Open png device
png(filename = "plot4.png",width = 480, height = 480)


par(mfrow=c(2,2))

# topleft
plot(df$datetime,
     df$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# topright
with(df, plot(datetime,
              Voltage,
              type = "l"))

# bottomleft
plot(df$date,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(df$datetime,df$Sub_metering_2,col='red')
lines(df$datetime,df$Sub_metering_3,col='blue')
legend("topright",
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue"),
       bty = "n")

# bottomright
with(df, plot(datetime,
              Global_reactive_power,
              type = "l"))

## Close png device
dev.off()
