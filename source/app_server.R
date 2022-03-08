library(shiny)
library(tidyverse)
library(ggplot2)

concussions <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-cshoq/main/data/Concussion-Injuries-2012-2014.csv")

chart_3_data <- concussions %>%
  select(Position) 

chart_3_table <- data.frame(table(chart_3_data$Position))

chart_3_final <- chart_3_table %>%
  rename(Position = Var1)

chart_3_final <- mutate(
  chart_3_final,
  percent = Freq / sum(chart_3_final$Freq)
)

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
  output$Chart2 <- renderPlot ({
    # code for chart 2 plot
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
}