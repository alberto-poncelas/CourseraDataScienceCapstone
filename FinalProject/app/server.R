

library(shiny)
library(stringr)


#load the functions for predicting
source('predictingFunctions.R')

#Variables
lastPressedKey<-"";
predictWord<-""; 
tbl<-list();

 
# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output,session) {




#Write a message of "Loading data" while the data loads
  output$caption <- renderText({

    # Create a Progress object
    progress <- shiny::Progress$new()
    progress$set(message = "Please wait until the app is loaded", value = 0)
    
    #Load the n-grams (we do a global asignation using "<<-")
    tbl<<-loadData();

    # Close the progress when this reactive exits 
    on.exit(progress$close())
   


  })

  

  #Do when a key is pressed
  observe({

      #Get the input word
      theInput<-input$caption
      lastPressedKey<-substring(theInput,nchar(theInput));

      if (lastPressedKey==" "){
        #predictWord<-"newWordprediction"
        predictWord<-predict(theInput,tbl)
      }else{
        predictWord<-" "
      }
      

      isolate({
        output$caption <- renderText({
          paste (c(input$caption,predictWord), sep = " ");
        })

      })

  })



})

