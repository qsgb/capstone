library(shiny)

source("backoff.r")


# Shiny server
shinyServer(
  function(input, output) {
    # Prepare dataset
    dbout <- reactive({backoff(input$text)})
    output$predicted1<-renderText({
      out<-dbout()
      if (out=="Invalid input"){
        return("Invalid input")
      }else {
        return(out[1])
      }
    })
    output$predicted2 <- renderText({
      out<-dbout()
      return(out[2])
    })
    output$predicted3 <- renderText({
      out<-dbout()
      return(out[3])
    })
    }
)