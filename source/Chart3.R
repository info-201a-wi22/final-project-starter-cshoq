# Chart 2 for P02

# Month of game vs frequency scatter plot

library(tidyverse)
library(ggplot2)
library(dplyr)
library(leaflet)

library(readr)
concussions <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-cshoq/main/data/Concussion-Injuries-2012-2014.csv")

# Games Missed Due to Concussion

absence_data <- select(concussions, Games.Missed)
absence_table <- data.frame(table(absence_data$Games.Missed))
absence_freq <- as.vector((absence_table$Freq))

plot(absence_freq, type = "o" , xlab = "Games Missed Post concussion", ylab = "Frequency", main = "Games Missed Due to Concussions Chart") 



