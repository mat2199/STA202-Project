library(xts)


library(imputeTS)


setwd("C:/Users/mathi/OneDrive/Documents/ENSTA PARIS/Cours_deuxième_année/STA202/Projet_STA202")

air_data<-read.table("AirQualityUCI.csv",header=T,sep=";")

air_data<-air_data[,1:15]
head(air_data)


air_data_with_NA<-replace(air_data,-200,NA)


date1<- strptime("03/10/2004 18:00:00", "%m/%d/%Y %H:%M:%S")
date2<- strptime("04/04/2005 13:00:00", "%m/%d/%Y %H:%M:%S")
Date_air<-seq(date1,date2, by = "1 hour")


air_data.xts<-xts(air_data,order.by=Date_air)

plot(air_data$CO.GT)

test<-air_data$NMHC.GT.

test<-replace(test,test<0,NA)
print(test)
test1<-na_mean(test)