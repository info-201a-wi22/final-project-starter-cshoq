
library(shiny)

source("tabs/tab_intro.R")
source("tabs/tab_chart_1.R")
source("tabs/tab_chart_2.R")
source("tabs/tab_chart_3.R")
source("tabs/tab_summary.R")
source("tabs/tab_report.R")


page_one <- tabPanel(
  "Intro Page",
  h1("The Concussion Conundrum"),
  img("Welcome to the #1 Concussion Data Resource!", src='nfl_helmets.png'),
  p("In this site, you will be able to see a variety of different data charts that demonstrate the various consequences of concussions in the NFL. We are trying to get to the bottom of much of the analytical side of NFL concussions, and want this data to be a reference to the NFL's executive board in future decision making!")
)

page_two <- tabPanel(
  "Chart 1"
)

page_three <- tabPanel(
  "Chart 2"
)

page_four <- tabPanel(
  "Chart 3",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "width",
        label = "Width of Bars", min = 0.1, max = 0.9, value = 0.5
        )
    ),
    main_content <- mainPanel(
      plotOutput("Chart3"),
      p("Description of chart.")
    )
  )
)

page_five <- tabPanel(
  "Summary"
)

page_six <- tabPanel(
  "Project Report"
)



ui <- navbarPage(
  title = "Project Example",
  position = "fixed-top",
  
  # The project introduction
  page_one,
  
  # The three charts
  page_two,
  page_three,
  page_four,
  
  # The project summary
  page_five,
  
  # The project report
  page_six
)
