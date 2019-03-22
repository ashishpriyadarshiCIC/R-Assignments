
data = read.csv(file = "Death_rate.csv", check.names = FALSE,)


statenum = c(2,3,4,9,10,11,12,13,14,15,16,17)

pdf("Exercise_1.pdf")
for (i in statenum){
    x = as.numeric(colnames(data)[2:43])
    y = as.numeric(as.vector(data[i,])[2:43])

    lm(y~x)
    mains <- paste("Regression plot for the state: ", as.character(data$State[i]) )

    plot(x,y, col = "blue", main = mains, xlab = "Years", ylab = "Death Rate", abline(lm(y~x)))
    
}

dev.off()
