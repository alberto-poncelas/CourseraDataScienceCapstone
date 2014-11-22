

library(shiny);

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Word predictor"),
  

  verticalLayout(
    mainPanel("Write your sentence in the box below."),
    mainPanel("While you type, the app will try to predict the word you are typing (press "_" to autocomplete)"),
    mainPanel("As soon as you press <space> the app will try to predict the next word"),


    sidebarPanel(
      width = 15,
      textInput("caption", "Write your sentence here:", "")
    ),
    

    mainPanel(
      h3(textOutput("caption", container = span))
    )
  )
))

