#The dataset has 2075260 rows and 100 columns
#Size of the dataset: 2075260*100*8bytes = 1660208000 bytes = 1.7 GB
#It will take about twice as much memory to read in the data: ~ 3.5 GB memory 

#Read in the data, specify the number of rows, the separator ';' and that missing values are shown as '?'
hpc <- read.table("household_power_consumption.txt", sep=";", nrows=2075259, head=T, na.strings="?")

#Create a 10th column, datetime containing date and time
library(lubridate)
hpc$datetime = dmy_hms(paste(hpc[,1], hpc[,2]))

#Subset the data: only select data from February 1st and 2nd of 2007
sub <- subset(hpc, Date%in%c("1/2/2007", "2/2/2007"))

#Open png device and specify file name and pixelsize
png(filename="Plot3.png", height=480, width=480)
#plot Sub_metering_1 as a function of datetime, specify plot type, color and axes label
plot(sub$datetime, sub$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", col="black")
#add Sub_metering_2/3 as a function of datetime, specify plot type and color
lines(sub$datetime, sub$Sub_metering_2, type="l", col="red")
lines(sub$datetime, sub$Sub_metering_3, type="l", col="blue")
#add legend at the top right, specify linetype, color label and text
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#close png device
dev.off() 