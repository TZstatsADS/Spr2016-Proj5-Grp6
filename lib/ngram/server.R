library(shiny)
library(shinydashboard)


#shinyserver
shinyServer(function(input, output,session) {
  source("ngram.R")
    output$TextFinal<-renderText({
    firststring<-"the little prince"
    textlength<-20
    GetTheWholeText(input$firststring,input$textlength,newmatrix,input$ng)
    })
    
})