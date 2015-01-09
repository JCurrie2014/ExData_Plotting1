#This project charts energy usage over a two day period in February 2007
#Four plots will be created showing various energy usage metrics on Feb,1 and 2 of 2007
#Author: Jerry Currie 1/9/2015
#Data Source URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#Data Input File(s): household_power_consumption.txt 
#R Packages: dplyr
#See README.md for data descriptions: https://github.com/JCurrie2014/ExData_Plotting1 
#See Version.md for system version information: https://github.com/JCurrie2014/ExData_Plotting1 

##################### load libraries #################################
#load dplyr library for filtering and selecting data
library(dplyr)
##################### end load libraries #################################


##################### Get data ###########################################
#Place header information inside data.frame 
#(Note: header information is lost from partial input read) 
dathead<-read.table("household_power_consumption.txt", sep=";", header=T, nrows=1)
#Load initial data frame
dat1<-read.table("household_power_consumption.txt", sep=";", header=F, nrows=10000, skip=66000)
#Replace ? with NA. There are no "?" in this data set, but this should be used as a precaution
dat1[dat1=="?"]<-NA
#omit rows having NAs and create new data.frame
dat<-na.omit(dat1)
#Get column names from dathead
names(dat)<-names(dathead)
#Create new formatted date columns (NDate).T
dat$NDate<-as.Date(dat$Date, "%d/%m/%Y")
#Filter by date range as put in ddat var
ddat<-filter(dat, NDate=="2007-02-01" | NDate=="2007-02-02" )
#Create New Time stamp. (Note: this step was used for educational purposes only and not used anywhere in this code)
ddat$NTTime <- strptime(paste(ddat$NDate,  ddat$Time) , format="%Y-%m-%d%H:%M:%S") 
#add three character acronym for weekday as last column
ddat$Day<-strftime(ddat$NDate,"%a")
##################### End Get data #######################################


##################### Create Plot Labels #################################
#Create 3 labels for Axis. Thu, Fri & Sat are x-axis lables. strftime was used in case of different time frame.
xaxis<-c(1,nrow(ddat)/2,nrow(ddat))
xaxislabels<-c(strftime(min(ddat$NDate),"%a"),strftime(max(ddat$NDate),"%a"),strftime(max(ddat$NDate)+1,"%a"))
##################### End Create Plot Labels ##############################

##################### Create data subsets #################################
# Create subset data.frame for plots 3 and 4 (not used in plots 1 & 2)
#p3data = Sub_Metering_1, Sub_Metering_2, Sub_Metering_3
p3data<-ddat[,7:9]
##################### End Create data subsets ############################


##################  Plot 3 Charts ###########################################
#plot 3) 3 series line plot
png("plot3.png", width=480, height=480) #set image size to 480x480
matplot(p3data, type = "l", col=c("black","blue","red"),xlab="", xaxt = "n", ylab="Energy sub metering",)
axis(1, xaxis, labels=xaxislabels)
legend("topright", legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), col=c("black","blue","red"),  bty = "n",lwd=2) # optional legend
dev.off()
##################  End Plot 3 Charts ######################################
 