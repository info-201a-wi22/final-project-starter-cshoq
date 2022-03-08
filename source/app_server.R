library(shiny)
library(tidyverse)
library(ggplot2)

concussions <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-cshoq/main/data/Concussion-Injuries-2012-2014.csv")


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
  output$Chart3 <- renderPlot ({
    # code for chart 2 plot
  })
}