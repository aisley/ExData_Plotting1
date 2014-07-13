#Set the working Directory that contains the data file
setwd("C:\\Users\\Andy\\Documents\\GitHub\\ExData_Plotting1\\ProjectCode")

## Read data
e_data <- read.csv (".\\household_power_consumption.txt", sep = ";", na.strings="?")

## sub_set the data where date is 2007-02-01 to 2007-02-02
e_sub_set <- subset(e_data, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007", format="%d/%m/%Y") | 
                       as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))

## Create the first graphic
png(file="plot1.png",width=480,height=480,bg=NA,units="px")
hist(as.numeric(e_sub_set$Global_active_power), 
     col="red", main="Global Active Power", xlab="Global Active Power in (kilowatts)", 
     ylim=c(0,1200))
dev.off()
