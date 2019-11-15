#GPS calculation
#import the required packages
library(readr)

# read in the data
gps <- read_csv('C:/Users/P3DR0/Desktop/Classes/CSC/DSC423/Project/Repo_10042019/423-project-master/423-project-master/data/Boston_Crime_clean_V4_gpsworking.csv')

#convert to radians
radius <- 3959 #earth radius in miles
lat1rad <- gps$Lat * pi / 180 #crime lat
lat2rad <- gps$Station_Lat * pi / 180 #ps lat

deltaTheta <- (gps$Station_Lat - gps$Lat) * pi / 180 #delta of lats
deltaLamda <- (gps$Station_Long - gps$Long) * pi / 180 #delta of longs

#Haversine Formula
calc1 <- sin(deltaTheta/2) * sin(deltaTheta/2) + cos(lat1rad) * cos(lat2rad) * sin(deltaLamda/2) * sin(deltaLamda/2)
calc2 <- 2 * atan2(sqrt(calc1), sqrt(1-calc1))
calc3 <- radius * calc2

gps$Distance_To_Station <- (calc3)

# Write csv output
write_csv(gps
          , 'C:/Users/P3DR0/Desktop/Classes/CSC/DSC423/Project/Repo_10042019/423-project-master/423-project-master/data/Boston_Crime_clean_V5.csv')