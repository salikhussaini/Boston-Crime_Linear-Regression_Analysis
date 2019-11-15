
# clean up Boston weather dataset
#   for the group project

library(stationaRy)
library(tidyverse)

# Logan Airport, Boston, MA
boston_met_data <- 
    get_met_data(
        station_id = "725090-14739"
        , years = 2015:2019
    )
boston_met_data

write.csv(boston_met_data
          , 'F:/DePaul University/Data Analysis and Regression DCS - 423 - 720 - 1040/Final Project/Boston_weather_data.csv')

# convert the POSTix column of date time to date only
boston_dat$time <- as.Date(boston_dat$time)

# creates the column for converting the temp to F
boston_dat <- boston_met_data %>% 
    na.omit() %>% 
    mutate(temp_f = ((temp * (9/5)) + 32) %>% round(1)) 

# returns the daily average temp for each day
boston_daily_avg <- boston_dat %>% 
    group_by(time) %>% 
    summarise(round(mean(temp_f))) %>% 
    rename(date = time) %>% 
    rename(mean_temp = 2)

write.csv(boston_daily_avg
          , 'F:/DePaul University/Data Analysis and Regression DCS - 423 - 720 - 1040/Final Project/Boston_daily_avg.csv')







