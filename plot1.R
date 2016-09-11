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
png(filename = "plot1.png",width = 480, height = 480)

hist(df$Global_active_power,
     col="red",
     main = "Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

## Close png device
dev.off()
