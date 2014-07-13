#Set the working Directory that contains the data file
setwd("C:\\Users\\Andy\\Documents\\GitHub\\ExData_Plotting1\\ProjectCode")

## Read data
e_data <- read.csv (".\\household_power_consumption.txt", sep = ";", na.strings="?")

## sub_set the data where date is 2007-02-01 to 2007-02-02
e_sub_set <- subset(e_data, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007", format="%d/%m/%Y") | 
                         as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))


#Concate Date and time into a single datetime variable
e_sub_set$datetime <- strptime(paste(e_sub_set$Date,e_sub_set$Time),format="%d/%m/%Y %H:%M:%S")

#Create the plot on a png file
png(file="plot2.png",width=480,height=480, bg=NA ,units="px")
#Create the Plot2 assignment
plot(x=e_sub_set$datetime, y=e_sub_set$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type="l")
dev.off()





