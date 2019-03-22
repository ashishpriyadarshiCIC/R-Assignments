
Data = read.csv("B.csv", header = TRUE)

setwd("") #Set the location to where the data is

Data

bar <- subset(Data, TypeOfDisability=="TotalDisabledPopulation" & Sex=="Females" & TypeOfRegion==" Total ")

bar

dataFem <- subset(bar , select = -c(StateName,TypeOfDisability,TypeOfRegion,Sex))

dataFem #This is the data of working and non working disabled population of females in every state in India

dataFem$PercentageOfWorkingPopulation <- (dataFem$TotalWork/(dataFem$TotalWork + dataFem$Nonworkers))*100

dataFemPer <- subset(dataFem , select = -c(TotalWork,Nonworkers))
dataFemPer <- dataFemPer[-c(1),] #Removing the stat of india as it might create confusion

dataFemPer

png(file = "Percentage_of_employed_females_out_of_disabled_females_in_every_state_in_India_assignment.png")

barplot(dataFemPer$PercentageOfWorkingPopulation,names.arg=dataFemPer$StateCode,xlab="State_Code",ylab="Percentage of Employed Females",col="blue",
main="Employement of Disabled Females",border="red")
dev.off()

