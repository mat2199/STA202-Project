library(xts)

library(tidyr)
library(imputeTS)


setwd("C:/Users/mathi/OneDrive/Documents/ENSTA PARIS/Cours_deuxième_année/STA202/Projet_STA202")

air_data<-read.table("AirQualityUCI.csv",header=T,sep=";")
print(air_data)


air_data<-air_data[2:9356,3:15]





head(air_data)


#Create vector date 

date1<- strptime("03/10/2004 18:00:00", "%m/%d/%Y %H:%M:%S")
date2<- strptime("04/04/2005 14:00:00", "%m/%d/%Y %H:%M:%S")
Date_air<-seq.POSIXt(date1,date2, by = "1 hour")


# Merge the two data frames together


air_data_final<-cbind(Date,air_data)

#air_data.xts<-xts(air_data,order.by=Date_air)

plot(air_data$CO.GT)

test<-air_data$NMHC.GT.

test<-replace(test,test<0,NA)
print(test)
test1<-na_mean(test)

plot(test1,type='l')