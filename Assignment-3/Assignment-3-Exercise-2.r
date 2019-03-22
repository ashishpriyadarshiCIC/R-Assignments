
library("ggpubr")

data_1 = read.csv(file = "Population_yearwise.csv", check.names = FALSE)
data_2 = read.csv(file = "Registered_motors.csv", check.names = FALSE)
years = as.numeric(colnames(data)[5:57])
population_india = as.numeric(as.vector(data_1[108,])[5:57]) # 1960 - 2012
vehicles_sold = as.numeric(as.vector(data_2[,2][4:56]))
pdf("Exercise_2.pdf")
plot(years,population_india, main = "Plot of Population vs Year")
mtext("The plots tells that Population and Year have direct linear relation.")
plot(years,vehicles_sold, main = "Plot of Vehicle Sold vs Year ")
mtext("The plots tells that Vehicle Sold and Year have direct exponential relation.")
plot(population_india,vehicles_sold, main = "Plot of Vehicle Sold vs Population Size ")
mtext("So, Population and Vehicles have a exponential relation.")


data_plot = data.frame("Population" = population_india, "Vehicle" = vehicles_sold)
ggscatter(data_plot,x = "Population", y = "Vehicle", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Population", ylab = "Vehicles Sold")
dev.off()
