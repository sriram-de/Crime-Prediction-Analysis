Crime=read.csv("C:/Users/srira/OneDrive/Desktop/Crimes_-_2020.csv",header=T)

head(Crime)
table(Crime$Month)
table(Crime$Month)[which.min(table(Crime$Month))]
table(Crime$Day)[which.min(table(Crime$Month))]
table(Crime$Day)
table(Crime$Day)[which.min(table(Crime$Day))]
table(Crime$Day)[which.max(table(Crime$Day))]

barplot(table(Crime$Month), main = "Crimes in Chicago Month wise", xlab = "Months", ylab="Numbber of Crimes")

topcrimelocation=sort(table(Crime$Location.Description))
Top5 = subset(Crime, Location.Description=="STREET" | Location.Description=="PARKING LOT/GARAGE(NON.RESID.)" | Location.Description=="ALLEY" | Location.Description=="GAS STATION" | Location.Description=="DRIVEWAY - RESIDENTIAL")
Top5$Location.Description = factor(Top5$Location.Description)
table(Top5$Location.Description)
barplot(table(Top5$Location.Description), main = "Crimes in Chicago Top 5 Locations", xlab = "Locations", ylab="Numbber of Crimes")

table(Crime$Year)


Crime$date <- as.POSIXlt(Crime$Date, format = "%m/%d/%Y %H:%M")

library(dplyr)
barplot(table(Crime$Primary.Type), main = "Types of Crimes in Chicago (Ungrouped)", xlab = "Crimes", ylab="Numbber of Crimes")
length(unique(Crime$Primary.Type))
Crime$crime <- as.character(Crime$Primary.Type)
Crime$crime <- ifelse(Crime$crime %in% c("CRIM SEXUAL ASSAULT","PROSTITUTION", "SEX OFFENSE"), 'SEX', Crime$crime)
Crime$crime <- ifelse(Crime$crime %in% c("MOTOR VEHICLE THEFT"),"MVT", Crime$crime)
Crime$crime <- ifelse(Crime$crime %in% c("GAMBLING", "INTERFERE WITH PUBLIC OFFICER", "INTERFERENCE WITH PUBLIC OFFICER", "INTIMIDATION", "LIQUOR LAW VIOLATION", "OBSCENITY", "NON-CRIMINAL", "PUBLIC PEACE VIOLATION","PUBLIC INDECENCY", "STALKING", "NON-CRIMINAL (SUBJECT SPECIFIED)"), "NONVIO", Crime$crime)
Crime$crime <- ifelse(Crime$crime == "CRIMINAL DAMAGE", "DAMAGE", Crime$crime)
Crime$crime <- ifelse(Crime$crime == "CRIMINAL TRESPASS", "TRESPASS", Crime$crime)
Crime$crime <- ifelse(Crime$crime %in% c("NARCOTICS", "OTHER NARCOTIC VIOLATION", "OTHER NARCOTIC VIOLATION"), "DRUG", Crime$crime)
Crime$crime <- ifelse(Crime$crime == "DECEPTIVE PRACTICE", "FRAUD", Crime$crime)
Crime$crime <- ifelse(Crime$crime %in% c("OTHER OFFENSE", "OTHER OFFENSE"), "OTHER", Crime$crime)
Crime$crime <- ifelse(Crime$crime %in% c("KIDNAPPING", "WEAPONS VIOLATION", "OFFENSE INVOLVING CHILDREN"), "VIO", Crime$crime)
table(Crime$crime)
                                                   

library(ggplot2)
qplot(Crime$crime, xlab = "Crime", main = "Crimes in Chicago (Grouped)") + scale_y_continuous("Number of crimes")


