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
png(filename="Plot1.png", height=480, width=480)
#plot histogram of Global_active_power, specify color, axes and title label
hist(sub$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#close png device
dev.off() 
