
setwd("") #Set the location to where the data is

Data = read.csv("air_data.csv", header = TRUE) #Air Quality Index Data

Data <- subset(Data , select = -c(Hour.1,From.Date,To.Date,X))

Data

mean(Data$PM10)
median(Data$PM10)
sqrt(var(Data$PM10))

mean(Data$PM2.5)
median(Data$PM2.5)
sqrt(var(Data$PM2.5))

hist(Data$PM2.5)

hist(Data$PM10)

m <- mean(Data$PM2.5)
std <- sqrt(var(Data$PM2.5))
library(ggplot2)

ggplot(Data, aes(x = Data$Hour, y = Data$PM2.5, color = PM2.5)) + geom_point(size =1.5) + scale_color_gradientn(colours = rainbow(5)) + geom_smooth(color = "red")
