# Tab for interactive chart 2

library(shiny)


sidebar_content <- sidebarPanel(
  # Interactive widget
)

main_content <- mainPanel(
  plotOutput("Chart2"),
  p("Description of chart 2.")
)

chart_1_panel <- tabPanel(
  "Panel Name",
  titlePanel("Title"),
  sidebarLayout(
    sidebar_content, main_content
  )
)