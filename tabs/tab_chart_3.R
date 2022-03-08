# Tab for interactive chart 3

library(shiny)


sidebar_content <- sidebarPanel(
  # Interactive widget
)

main_content <- mainPanel(
  plotOutput("Chart3"),
  p("Description of chart 3.")
)

chart_1_panel <- tabPanel(
  "Panel Name",
  titlePanel("Title"),
  sidebarLayout(
    sidebar_content, main_content
  )
)