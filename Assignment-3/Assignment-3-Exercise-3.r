
data_3 = read.csv(file = "State_literarcy.csv", check.names = FALSE)
data_4 = read.csv(file = "Convict_wages.csv", check.names = FALSE)
data_state =   substr(  as.character(as.vector(data_3[,1]))  , 1, 5)                 
data_literacy = as.numeric(as.vector(data_3[,8])) 

data_newliteracy = data.frame("State" = tolower(data_state), "Literacy_Rate" = data_literacy)

counter  = 1
data_state_convicts <- vector(mode="character", length =0)
data_skilled_convicts <- vector(mode="numeric", length=0)
data_semiskilled_convicts <- vector(mode="numeric", length=0)
data_unskilled_convicts <- vector(mode="numeric", length=0)
for (rows in 1:nrow(data_4)){
    if ( as.numeric(data_4[rows,2]) == 2011){
        data_state_convicts[counter] =  substr(as.character(data_4[rows,1]), 1, 5)   
        data_skilled_convicts[counter] = substr(as.character(data_4[rows,3]), 1, 5)   
        data_semiskilled_convicts[counter] = substr(as.character(data_4[rows,4]), 1, 5)   
        data_unskilled_convicts[counter] = substr(as.character(data_4[rows,5]), 1, 5)   
        counter = counter + 1 
    }      
}

data_new2011 = data.frame("State" = tolower(data_state_convicts), "Skilled_Convicts" = data_skilled_convicts, "SemiSkilled_Convicts" = data_semiskilled_convicts, "UnSkilled_Convicts" = data_unskilled_convicts)

ramen = 1
data_samestate_literacy = vector(mode="numeric", length = 0)
data_samestate_skilledconvicts = vector(mode= "numeric", length = 0)
data_samestate_semiskilledconvicts = vector(mode= "numeric", length = 0)
data_samestate_unskilledconvicts = vector(mode= "numeric", length = 0)
for (rows in 1:nrow(data_new2011)){
    for (rows2 in 1:nrow(data_newliteracy)){
        
        
        if(as.character(data_new2011[rows,1]) == as.character(data_newliteracy[rows2,1]) ){
        
                    data_samestate_literacy[ramen] = data_newliteracy[rows2,2]
                    data_samestate_skilledconvicts[ramen] = data_new2011[rows,2]
                    data_samestate_semiskilledconvicts[ramen] = data_new2011[rows,3]
                    data_samestate_unskilledconvicts[ramen] = data_new2011[rows,4]
                    
                    ramen = ramen + 1
    }
        
    }
    
    
}

data_samestate_correlation = data.frame("Literacy" = data_samestate_literacy, "SkilledConvicts Wages" = data_samestate_skilledconvicts, "SemiSkilledConvicts Wages" = data_samestate_semiskilledconvicts, "UnSkilledConvicts Wages" = data_samestate_unskilledconvicts )


pdf("Exercise3.pdf")
ggscatter(data_samestate_correlation,x = "Literacy", y = "SemiSkilledConvicts.Wages", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Literacy Rate", ylab = "Semi Skilled Convicts - Wage")
ggscatter(data_samestate_correlation,x = "Literacy", y = "SkilledConvicts.Wages", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Literacy Rate", ylab = "Skilleds Convicts - Wage")
ggscatter(data_samestate_correlation,x = "Literacy", y = "UnSkilledConvicts.Wages", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Literacy Rate", ylab = "UnSkilledConvicts - Wages")
dev.off()
