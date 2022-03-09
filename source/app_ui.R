
library(shiny)
library(knitr)
library(markdown)


page_one <- tabPanel(
  "Intro Page",
  h1("The Concussion Conundrum"),
  img(src='nfl_helmets.png'),
  p("In this site, you will be able to see a variety of different data charts that demonstrate the various consequences of concussions in the NFL. We are trying to get to the bottom of much of the analytical side of NFL concussions, and want this data to be a reference to the NFL's executive board in future decision making!")
)

page_two <- tabPanel(
  "Chart 1",
  sidebarPanel(
    sliderInput(
      "bin_size",
      label = "Bin Size",
      min = 1,
      max = 20,
      value = 10
    )
  ),
  
  main_content <- mainPanel(
    plotOutput("Chart1"),
    p("As we can see, players generally played about 15-40 snaps before being diagnosed with a concussion. There is also a clear left skew, as the game goes on and snaps falter to exist (or in other words, some games individual players don't play enough snaps), we see fewer concussions.")
  )
)

page_three <- tabPanel(
  "Chart 2",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "slider",
        label = "Year Range", min = min(concussion_no$Week.of.Injury), 
        max = max(concussion_no$Week.of.Injury), 
        value = c(6, 9), 
        step = 1
        )
    ),
    main_content <- mainPanel(
      plotOutput("Chart2"),
      strong("Visualization Description"), 
      p("In this interactive graph, you can look at how many weeks players missed
based on what week they got their concussion in. This can show you patterns
of players missing less weeks the farther into the season players go.")
    )
  )
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
      p("We can see there are clear discrepencies between players playing certain positions and their concussion chances. Cornerback and wide receiver (two positions that go head-to-head), seem to be the most dangerous in regards to concussions. ")
    )
  )
)

page_five <- tabPanel(
  "Summary",
  plotOutput("ChartS1"),
  p("A key takeaway from the dataset is obviously the trends presented regarding the frequencies of which concussions occur real-time, in the game. We see a trend in which concussions spike in the first half of the game, and slowly drop throughout the game. This showcases a pattern played in games in which players of all positions are more prone to injuries in the beginning of the game than towards the end- leaving questions to be answered. Do the NFL make rule changes to lower this trend? What rule changes can they do to lower this trend without lowering the competitiveness or quality of the game? Do players have to train differently in the off season to better prepare themselves for the beginning of the season/games?
"),
  tableOutput("Table"),
  p("Another key takeaway from the data is the frequencies in which each position gets injured, as both sides of the football are affected and play differently. Based on the table displayed, we can see that a majority of the concussions from the data set are on the defensive side of the ball, which creates the case that the risk of concussion simply increases or decreases based on what position you decide to play. There really is nothing the NFL can do to limit or decrease this trend unless they completely eliminate the physicality of the defense or offense- which they have attempted to do throughout the years, but the result still stands. This takeaway once again plays back into what the NFL could do, and what they couldn't do due to the backlash both from the fans, and players."),
  plotOutput("ChartS2"),
  p("The final key takeaway from the exploration of this data is the week of the season that concussions occurred. We can see that although generally concussion are equally spread throughout the season, week one can be dangerous. This is likely since players haven't seen the playing field in nearly 8 months and are unfamiliar with how they are supposed to make contact with other players. The NFL should surely take some precautions to increase safety in week 1.")
)

page_six <- tabPanel(
  "Project Report",
  htmltools::includeMarkdown("po3-report.md")
)

ui <- fluidPage(
  titlePanel("The Concussion Conundrum"),
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Yusei+Magic&display=swap');
      body {
        background-color: grey;
        color: white;
      }
      h2 {
        font-family: 'Yusei Magic', sans-serif;
      }
      .shiny-input-container {
        color: #474747;
      }"))
  ),
  tabsetPanel(
    type = "tabs",
 
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
))
