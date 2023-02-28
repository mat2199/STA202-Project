library(xts)

library(tidyr)
library(imputeTS)


setwd("C:/Users/mathi/OneDrive/Documents/ENSTA PARIS/Cours_deuxième_année/STA202/Projet_STA202")

air_data<-read.table("AirQualityUCI.csv",header=T,sep=";")

air_data<-air_data[2:9357,3:15]

#Create vector date 

date1<- strptime("03/10/2004 18:00:00", "%m/%d/%Y %H:%M:%S")
date2<- strptime("04/04/2005 14:00:00", "%m/%d/%Y %H:%M:%S")
Date_air<-seq.POSIXt(date1,date2, by = "1 hour")



# Create a count of NA's values

# We automate the data processing

data_process<-function(col)
  {
  # We start by replace the negative values with NA's
  col<-replace(col,col<0,NA)
  # We impute the missing values with the mean of the other values of the series thanks to the na_mean function
  mean_imput<-na_mean(col)
  return (mean_imput)
}

#We select the rows that interest us

data_to_process<-(cbind(air_data$PT08.S1.CO.,air_data$PT08.S2.NMHC.,air_data$PT08.S3.NOx.,air_data$PT08.S4.NO2.,air_data$PT08.S5.O3))

#We apply the process function

data_air<-as.data.frame(apply(data_to_process,2,data_process))

# We rename our columns

names(data_air)[1]<-"PT08.CO"
names(data_air)[2]<-"PT08.NMHC"
names(data_air)[3]<-"PT08.NOx"
names(data_air)[4]<-"PT08.NO2"
names(data_air)[5]<-"PT08.O3"

# We create a time series for each data

data_PT08.CO<-xts(data_air$PT08.CO,order.by=Date_air)
data_PT08.NMHC<-xts(data_air$PT08.NMHC,order.by=Date_air)
data_PT08.NOx<-xts(data_air$PT08.NOx,order.by=Date_air)
data_PT08.NO2<-xts(data_air$PT08.NO2,order.by=Date_air)
data_PT08.O3<-xts(data_air$PT08.O3,order.by=Date_air)



