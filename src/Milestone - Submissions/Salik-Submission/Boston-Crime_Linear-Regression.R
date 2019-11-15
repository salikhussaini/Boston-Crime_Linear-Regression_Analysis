install.packages("car")
library(car)

#Import Dataset
BCrime <- read.delim("~/GitHub/423-project/data/BCo.txt")
B <- BCrime

#Interaction Variable creation
hD <- B$Population / B$Area

#Linear Regression Models
model2 <- lm(B$Distance_To_Station ~ B$OCCURRED_ON_DATE	
             + B$Average_Daily_Temp + B$Area + B$Population + B$HOUR + hD)

model3 <- lm(B$Lat ~ B$OCCURRED_ON_DATE	
             + B$Average_Daily_Temp + B$Area + B$Population + B$HOUR + hD)

model4 <- lm(B$Lat ~ B$OCCURRED_ON_DATE	
              + B$Area + B$Population + B$HOUR + hD)
#Model Metrics
summary(model2)
summary(model3)
summary(model4)

#Check for Multicollinearty
car::vif(model4)

#Residual Analysis
hist(model2$residuals)
plot(model2$fitted.values, model2$residuals )
plot(model2)

qqPlot(model2, main="QQ Plot")
qq.plot(model2)

(outs <- influencePlot(model2))
car::outlierTest(hD)

# Residuals vs Fitted Plot
plot(model2, which=1, col=c("blue")) 

sqrt(deviance(model2)/df.residual(model2))