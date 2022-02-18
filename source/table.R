concussions <- read.csv("data/ConcussionInjuries2012_2014.csv")

library(dplyr)
library(stringr)
library(data.table)
concussions$Play.Time.After.Injury <- gsub("downs", "", as.character(concussions$Play.Time.After.Injury)) 
concussions$Average.Playtime.Before.Injury <- gsub("downs", "", as.character(concussions$Average.Playtime.Before.Injury))
concussions$Play.Time.After.Injury <- gsub("Did not return from injury", "", as.character(concussions$Play.Time.After.Injury)) 

concussions$Play.Time.After.Injury <- as.numeric(as.character(concussions$Play.Time.After.Injury))
concussions$Average.Playtime.Before.Injury <- as.numeric(as.character(concussions$Average.Playtime.Before.Injury))


position_table <- concussions %>%
  group_by(Position) %>%
  summarise(Concussion.Frequency = sum(str_count(Reported.Injury.Type, "Concussion")),
  Average.Week.of.Injury = mean(Week.of.Injury, na.rm = TRUE),
  Average.Weeks.Injured = mean(Weeks.Injured, na.rm = TRUE),
  Average.Games.Missed = mean(Games.Missed, na.rm= TRUE),
  Average.Downs.Played.Before.Injury = mean(Average.Playtime.Before.Injury, na.rm = TRUE),
  Average.Downs.Played.After.Injury = mean(Play.Time.After.Injury, na.rm = TRUE)
            ) %>%
  mutate_if(is.numeric, round)

position_table <- as.data.table(position_table, keep.rownames = TRUE)

