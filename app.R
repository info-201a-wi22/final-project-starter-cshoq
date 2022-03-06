setwd("~/INFO201Assignments/Project/final-project-starter-cshoq/app")

library(plotly)
library(shiny)

source("source/app_server.R")
source("source/app_ui.R")

shinyApp(server = server, ui = ui)