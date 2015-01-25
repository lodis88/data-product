library(shiny)

#this created function is loaded in memory and used in the reactive part of this application
prediction.mpg <- function(model, data){
  predict(model, data)
}

#load the mtcars dataset and build the model
data(mtcars)
model <- lm(mpg ~ am + gear, mtcars)


#make the result reactive and compute the MPG based on the input, using the prediction.mpg function and the model
shinyServer(function(input,output)
  {    
  output$result <- renderText(
    {
    if(input$goButton >= 1)
      {
    isolate(data <- data.frame(am = input$transmissionType-1, gear = as.numeric(input$gears)))
    isolate(paste("We estimate that your car gets ", round(prediction.mpg(model, data), 2), " miles to the gallon (MPG). "))
      }
    else
      {
      paste("You didn't press the Compute! button yet!")
      }
    })
  })