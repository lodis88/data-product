library(shiny)

shinyUI(pageWithSidebar(
  
  #title of the page
  headerPanel("The MPG estimator app"),
  
  #the input part of the application
  sidebarPanel(
    h4("A) Please provide the input needed to compute your estimated MPG"),
    numericInput("transmissionType", label = "What type of transmission does your car have: 1=automatic or 2=manual?", value = 1, min = 1, max = 2, step = 1),
    radioButtons("gears", label = "How many forward gears does your car have?",
                 choices = list("3"= 3, "4" = 4, "5" = 5)),
    actionButton("goButton", "Compute!")),
  
  mainPanel(
    tabsetPanel(
    tabPanel("Result", h4("B) Based on the input you gave us, the following statement about MPG is applicable: "), textOutput("result")),
    tabPanel("How does it work?", includeMarkdown("HowDoesItWork.md")))
    )  
  ))