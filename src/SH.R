library(readr)
library(dplyr)
Boston_Crime_final_orginal <- read_csv("GitHub/423-project/data/Boston_Crime_final_orginal.txt")
BC0 <- Boston_Crime_final_orginal
Boston_Crime_final <- read_csv("GitHub/423-project/data/Boston_Crime_final.csv")
BC <- Boston_Crime_final
str(BC0)
str(BC)
datevars <- c("Recode", "DAY_OF_WEEK", "HOUR", "Month", "Date", "Year")
BC1 <- BC[datevars]

str(BC)

model1 <- lm(BC$Distance_To_Station ~ BC$REPORTING_AREA + BC$SHOOTING	+ 
               BC$DAY_OF_WEEK	+ BC$HOUR + BC$Lat	+ BC$Long	+ BC$Population	+ 
               BC$Area	+ BC$Average_Daily_Temp +	BC$Station_Lat	+ BC$Station_Long	+
               BC$Recode +	BC$Month	+ BC$Date +	BC$Year)
install.packages(CRAN)
library(Metrics)
mse()
summary(model1)

model2 <- lm(BC$Distance_To_Station ~ BC$DAY_OF_WEEK	+ BC$HOUR + BC$Month	+ BC$Date +	BC$Year + BC$Area + BC$Population)

summary(model2)


model3 <- lm(BC$Distance_To_Station ~ BC$DAY_OF_WEEK	+BC$Month	+	BC$Year + BC$Area + BC$Population)

summary(model3)

populationsq <- BC$Population * BC$Population
areasq <- BC$Area * BC$Area
poparea <- BC$Population * BC$Area
temparea <- BC$Area * BC$Average_Daily_Temp

model4 <- lm(BC$Distance_To_Station ~ BC$DAY_OF_WEEK	+BC$Month	+	BC$Year + BC$Area + BC$Population +  BC$Average_Daily_Temp + temparea + poparea + areasq + populationsq)

summary(model4)

mse(BC$Distance_To_Station, predict(model2, BC))
mse(BC$Distance_To_Station, predict(model3, BC))
mse(BC$Distance_To_Station, predict(model4, BC))


res <- cor(model4)
round(res, 2)