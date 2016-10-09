# The user-interface definition of the Shiny web app.
library(shiny)
require(markdown)
library(dplyr)

shinyUI(
    navbarPage("Data science capstone project--word predictor", 
    # multi-page user-interface that includes a navigation bar.
        tabPanel("Word predictor",
             sidebarPanel(
               textInput("text", label = h3("Input"), value = "Hell predictor"),
               helpText("Type in a sentence above, hit enter (or press the button below), the predicted words will display to the right."),
               submitButton("submit to the predictor")
             ),
             mainPanel(     
                      h3("Most possible word predicted:", align = "center"),
                      h4(textOutput("predicted1"), align="center", style="color:blue"),
                      h3("Other possible words:", align = "center"),
                      h4(textOutput("predicted2"), align="center", style="color:green"),
                      h4(textOutput("predicted3"), align="center", style="color:green")
                   ) 
                 ),
        tabPanel("About the predictor",
                 mainPanel(
                   includeMarkdown("about.md")
                 )
        ) # end of "About" tab panel
    )
  
)
