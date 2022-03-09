library(shiny)
library(tidyverse)
library(ggplot2)
library(data.table)

# Data rearangment misc.

concussions <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-cshoq/main/data/Concussion-Injuries-2012-2014.csv")

concussion_no <- concussions %>% filter(Pre.Season.Injury. == "No")

chart_3_data <- concussions %>%
  select(Position) 

chart_3_table <- data.frame(table(chart_3_data$Position))

chart_3_final <- chart_3_table %>%
  rename(Position = Var1)

chart_3_final <- mutate(
  chart_3_final,
  percent = Freq / sum(chart_3_final$Freq)
)

position_table <- concussions %>%
  group_by(Position) %>%
  summarise(Concussion.Frequency = sum(str_count(Reported.Injury.Type, "Concussion")),
            Average.Week.of.Injury = mean(Week.of.Injury, na.rm = TRUE),
            Average.Weeks.Injured = mean(Weeks.Injured, na.rm = TRUE),
            Average.Games.Missed = mean(Games.Missed, na.rm= TRUE),
            Average.Downs.Played.Before.Injury = mean(Average.Playtime.Before.Injury, na.rm = TRUE),
            Average.Downs.Played.After.Injury = mean(Play.Time.After.Injury, na.rm = TRUE)
  ) %>%
  mutate_if(is.numeric, round) %>%
  select(Concussion.Frequency, Average.Week.of.Injury, Average.Weeks.Injured, Average.Games.Missed)


absence_data <- select(concussions, Games.Missed)
absence_table <- data.frame(table(absence_data$Games.Missed))
absence_freq <- as.vector((absence_table$Freq))

week_data <- select(concussions, Week.of.Injury)
week_table <- data.frame(table(week_data$Week.of.Injury))
week_table <- week_table %>%
  rename(Week = Var1)

server <- function(input, output) {
  
  # Chart 1
    # histogram with adjustable bin size
  output$Chart1 <- renderPlot ({
    p <- ggplot(concussions, aes(x = Total.Snaps)) + 
      geom_histogram(binwidth = input$bin_size, color = "darkblue", fill = "lightblue") +
      ggtitle("Snaps Played Before Injury in Concussions from 2012-2014") + 
      xlab("Snaps Before Injury") + ylab("# of players")
    p
  })
  
  # Chart 2 
  output$Chart2 <- renderPlot({
    q <- ggplot(concussions) +
        geom_point(aes(x = Week.of.Injury, y = Games.Missed)) +
        labs(title = "Weeks Missed Due to Concussion",
             x = "Week",
             y = "Games missed",
             color = "Industry") +
        scale_x_continuous(limits = input$slider)
    q
  })
  
  # Chart 3
  # Number of concussions by position
  output$Chart3 <- renderPlot ({
    r <- ggplot(data = chart_3_final, aes(x = Position, y= Freq)) + 
      geom_bar(stat="identity", color = "darkblue", fill = "lightblue", width = input$width) +
      ggtitle("Concussion by Position") + 
      xlab("Position") + ylab("# of players") +
      theme(text = element_text(size = 20),
            axis.text.x = element_text(angle=90, hjust=1))
    r
  })
  
  # Table
  output$Table <- renderTable({
    s <- as.data.table(position_table, keep.rownames = TRUE)
    s
  })
  
  # Summary Chart 1
  output$ChartS1 <- renderPlot({
    t <- ggplot(concussions, aes(x = Total.Snaps)) + 
      geom_histogram(binwidth = 10, color = "darkblue", fill = "lightblue") +
      ggtitle("Snaps Played Before Injury in Concussions from 2012-2014") + 
      xlab("Snaps Before Injury") + ylab("# of players")
    t
  })
  
  # Summary Chart 2
  output$ChartS2 <- renderPlot({
    u <- ggplot(week_table, aes(x=Week, y=Freq)) + 
      geom_point(size=5) +
      ggtitle("Week of Season in Which Concussions Occurred")
    u
  })
  
}