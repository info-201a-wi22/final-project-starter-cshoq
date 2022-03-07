setwd("~/INFO201Assignments/Project/final-project-starter-cshoq")

library(shiny)

source("tabs/tab_intro.R")
source("tabs/tab_chart_1.R")
source("tabs/tab_chart_2.R")
source("tabs/tab_chart_3.R")
source("tabs/tab_summary.R")
source("tabs/tab_report.R")


ui <- navbarPage(
  title = "Project Example",
  position = "fixed-top",
  
  # The project introduction
  tab_intro,
  
  # The three charts
  tab_chart_1,
  tab_chart_2,
  tab_chart_3,
  
  # The project summary
  tab_summary,
  
  # The project report
  tab_report
)
