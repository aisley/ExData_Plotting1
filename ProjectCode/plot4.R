#Set the working Directory that contains the data file
setwd("C:\\Users\\Andy\\Documents\\GitHub\\ExData_Plotting1\\ProjectCode")

## Read data
e_data <- read.csv (".\\household_power_consumption.txt", sep = ";", na.strings="?")

## sub_set the data where date is 2007-02-01 to 2007-02-02
e_sub_set <- subset(e_data, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007", format="%d/%m/%Y") | 
                         as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))


#Concate Date and Time ito a single datetime variable
e_sub_set$datetime <- strptime(paste(e_sub_set$Date,e_sub_set$Time),format="%d/%m/%Y %H:%M:%S")

#Create the plot on a png file
png(file="plot4.png",width=480,height=480, bg=NA ,units="px")

#create a 2x2 area for teh plots
par(mfrow = c(2,2))


#Plot top left chart - Same chart as plot 2
plot(x=e_sub_set$datetime
     ,y=e_sub_set$Global_active_power
     ,type="l"
     ,col="black"
     ,xlab=""
     ,ylab="Global Active Power"
)


# plot top right chart
plot(x=e_sub_set$datetime
     ,y=e_sub_set$Voltage
     ,type="l"
     ,col="black"
     ,xlab="datetime"
     ,ylab="Voltage"
)


#Plot bottom left chart - This is the same chart as Plot 3
#create the plot, plot the Sub_metering_1 field in black and set the y label
plot(x=e_sub_set$datetime
     ,y=e_sub_set$Sub_metering_1
     ,type="l"
     ,col="black"
     ,xlab=""
     ,ylab="Energy sub metering"
)


# plot the Sub_metering_2 field in red
lines(x=e_sub_set$datetime
      ,y=e_sub_set$Sub_metering_2
      ,type="l"
      ,col="red")


## submeter #3
lines(x=e_sub_set$datetime
      ,y=e_sub_set$Sub_metering_3
      ,type="l"
      ,col="blue")

#create the legend 
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,lwd=1
       ,col=c("black","red","blue"))


## Plot bottom right
plot(x=e_sub_set$datetime
     ,y=e_sub_set$Global_reactive_power
     ,type="l"
     ,col="black"
     ,xlab="datetime"
     ,ylab="global_reactive_power"
)


dev.off()
