getwd()
setwd("/Users/cullenshoquist/desktop")
library(dplyr)
nfl_data <- read.csv("Concussion_Injuries_2012_2014.csv")

# What is the average number of games missed by consuion? 
games_missed <- (sum(nfl_data$Games.Missed, na.rm = TRUE)) / nrow(nfl_data)

# Which team(s) has the most consussion?
concussions_by_team <- nfl_data %>% count(Team)
most_concussions <- concussions_by_team %>%
  filter(n == max(n)) %>%
  select(Team)

# What year had the most concussions?
concussions_by_position <- nfl_data %>% count(Position)
highest_position <- concussions_by_position %>%
  filter(n == max(n)) %>%
  select(Position)

# Which month had the most concussions?
concussions_by_month <- nfl_data %>% count(months(as.Date(nfl_data$Date)))
colnames(concussions_by_month) <- c("month", "n")
highest_month <- concussions_by_month %>%
  filter(n == max(n)) %>%
  select(month)

# What percent of players were injured in the pre-season?
pre_season_injury <- nfl_data %>% count(Pre.Season.Injury.)
num_pre_season_injury <- pre_season_injury %>%
  filter(Pre.Season.Injury. == "Yes") %>%
  select(n)
had_pre_season_injury <- num_pre_season_injury / nrow(nfl_data)
