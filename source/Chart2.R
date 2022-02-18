# Chart 2 for P02

# Month of game vs frequency scatter plot

library(tidyverse)
library(ggplot2)
library(leaflet)

library(readr)
concussions <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-cshoq/main/data/Concussion-Injuries-2012-2014.csv")

# Week of Concussion over the course of the Season 

week_data <- select(concussions, Week.of.Injury)
week_table <- data.frame(table(week_data$Week.of.Injury))
week_table <- week_table %>%
  rename(Week = Var1)

ggplot(week_table, aes(x=Week, y=Freq)) + 
  geom_point(size=5) +
  ggtitle("Week of Season in Which Concussions Occurred")


