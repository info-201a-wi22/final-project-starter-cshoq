# Tab for interactive chart 3

library(shiny)

position_choices <- unique(concussions$Position)

sidebar_content <- sidebarPanel(
  checkboxGroupInput(
    "Position",
    label = "Position(s)",
    choices = position_choices
  )
)

main_content <- mainPanel(
  plotOutput("Chart3"),
  p("Description of chart.")
)

chart_3_panel <- tabPanel(
  "Panel Name",
  titlePanel("Title"),
  sidebarLayout(
    sidebar_content, main_content
  )
)