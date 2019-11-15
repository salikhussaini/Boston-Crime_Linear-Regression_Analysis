install.packages("DataExplorer")
library(tidyverse)
library(DataExplorer)
library(lubridate)
library(ggplot2)
#Import Dataset
Master_Crime.Incident_Reports <- read_excel("~/GitHub/423-project/data/Master_Crime-Incident_Reports.csv")
offense <- read_excel("GitHub/423-project/data/rmsoffensecodes.xlsx")
crime <- Master_Crime.Incident_Reports
#Dataset Summary:
glimpse(md)
head(md)
head(offense)

#join
df <- left_join(crime, offense %>% rename(OFFENSE_CODE = CODE), by = "OFFENSE_CODE")

#new joined table
head(df)

#Data Explore
introduce
head(df)
plot_intro(df)

#Overall Crime
DataExplorer::plot_histogram(df)

#Specific Crime
plot_bar(df)

ggplot(data = df) +
    geom_bar(mapping = aes(x = OFFENSE_CODE_GROUP)) +
    facet_wrap(~ YEAR, nrow = 1) +
    coord_flip() +
    xlab("") +
    ylab("Count")

a <- ggplot(data = df) +
    geom_bar(mapping = aes(x = OFFENSE_CODE_GROUP))+
    ylab("Count")

a + coord_flip()


#Location
b <- ggplot(data = df) +
    geom_bar(mapping = aes(x = DISTRICT ))+
    ylab("Count")

features(df)

m1 <- lm(OFFENSE_CODE ~ DISTRICT, data = df)
summary(m1)

m2 <- lm(OFFENSE_CODE ~ DISTRICT + REPORTING_AREA + MONTH + DAY_OF_WEEK + HOUR + Lat + Long, data = df)
summary(m2)