
#Import library
library(xts)
library(imputeTS)

#Import Data
setwd("F:/Documents/STA202-Project/")
air_data<-read.table("AirQualityUCI.csv",header=T,sep=";")


air_data<-air_data[,1:15]
head(air_data)



#Create a Date variable 
date1<- strptime("03/10/2004 18:00:00", "%d/%m/%Y %H:%M:%S")
date2<- strptime("04/04/2005 14:00:00", "%d/%m/%Y %H:%M:%S")
Date_air<-seq.POSIXt(date1,date2, by = "1 hour")


air_data.xts<-xts(air_data,order.by=Date_air)

#####
#plots

#plot(air_data$CO.GT)
plot(air_data$PT08.S1.CO)
#plot(air_data$NMHC.GT)
plot(air_data$PT08.S2.NMHC)
plot(air_data$PT08.S3.NOx)
#plot(air_data$NO2.GT)
plot(air_data$PT08.S4.NO2)

# PT08.S1.CO   PT08.S2.NMHC   PT08.S3.NOx   PT08.S4.NO2



test<-replace(test,test<0,NA)
print(test)
test1<-na_mean(test)