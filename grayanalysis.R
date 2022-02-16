# Making chart for P02

# histogram with bins like
  # num players with average playtime before injury being 0-5 downs, 5-10, etc

library(tidyverse)
library(ggplot2)

concussions <- read.csv("C:\\Users\\12069\\Documents\\INFO201Project\\final-project-starter-cshoq\\data\\Concussion-Injuries-2012-2014.csv")
View(concussions)

ggplot(concussions, aes(x = Total.Snaps)) + 
  geom_histogram(binwidth = 10, color = "darkblue", fill = "lightblue") +
  ggtitle("Snaps Played Before Injury in Concussions from 2012-2014") + 
  xlab("Snaps Before Injury") + ylab("# of players")

