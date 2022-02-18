
library(dplyr)
concussions <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-cshoq/main/data/Concussion-Injuries-2012-2014.csv")

# What is the average number of games missed by consuion? 
games_missed <- (sum(concussions$Games.Missed, na.rm = TRUE)) / nrow(concussions)

# Which team(s) has the most consussion?
concussions_by_team <- concussions %>% count(Team)
most_concussions <- concussions_by_team %>%
  filter(n == max(n)) %>%
  select(Team)

# What year had the most concussions?
concussions_by_position <- concussions %>% count(Position)
highest_position <- concussions_by_position %>%
  filter(n == max(n)) %>%
  select(Position)

# Which month had the most concussions?
concussions_by_month <- concussions %>% count(months(as.Date(nfl_data$Date)))
colnames(concussions_by_month) <- c("month", "n")
highest_month <- concussions_by_month %>%
  filter(n == max(n)) %>%
  select(month)

# What percent of players were injured in the pre-season?
pre_season_injury <- concussions %>% count(Pre.Season.Injury.)
num_pre_season_injury <- pre_season_injury %>%
  filter(Pre.Season.Injury. == "Yes") %>%
  select(n)
had_pre_season_injury <- num_pre_season_injury / nrow(nfl_data)
