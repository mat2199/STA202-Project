library(xts)

library(tidyr)
library(imputeTS)


setwd("C:/Users/mathi/OneDrive/Documents/ENSTA PARIS/Cours_deuxième_année/STA202/Projet_STA202")

air_data<-read.table("AirQualityUCI.csv",header=T,sep=";")
print(air_data)


air_data<-air_data[2:9357,3:15]





#head(air_data)


#Create vector date 

date1<- strptime("03/10/2004 18:00:00", "%m/%d/%Y %H:%M:%S")
date2<- strptime("04/04/2005 14:00:00", "%m/%d/%Y %H:%M:%S")
Date_air<-seq.POSIXt(date1,date2, by = "1 hour")


# Merge the two data frames together


air_data_final<-cbind(Date_air,air_data)


# Convert to xts format 
#final_data<-xts(air_data_final[,-1],order.by=Date_air)


#We start by replace the negative values with NA for one of the columns

test_col<-air_data_final$PT08.S1.CO.

test_col<-replace(test_col,test_col<0,NA)

# We count the number of missing values

n_m_values<-sum(is.na(test_col))

print(n_m_values)

#We impute the missing values with the mean of the other values of the series 

mean_imput<-na_mean(test_col)
missing_values<-sum(is.na(mean_imput))
print(missing_values)


# We can now plot our fully processed values 

plot(mean_imput,type="l")
