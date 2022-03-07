# Tab for interactive chart 1

library(shiny)


sidebar_content <- sidebarPanel(
  sliderInput(
    "bin_size",
    label = "Bin Size",
    min = 1,
    max = 20,
    value = 10
  )
)

main_content <- mainPanel(
  plotOutput("Chart1"),
  p("Description of chart.")
)

chart_1_panel <- tabPanel(
  "Heightened Concussion Risk Towards Start of Game",
  titlePanel("Frequency of Concussions as a Function of Snaps Played"),
  sidebarLayout(
    sidebar_content, main_content
  )
)