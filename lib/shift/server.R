library(shiny)
library(shinydashboard)


#shinyserver
shinyServer(function(input, output,session) {
  
  temp = list.files(pattern="*.csv")
  myfiles = lapply(temp, read.delim)
  dic = do.call(c,myfiles)
  dic = lapply(dic,levels)
  rm(myfiles)
  source("enc.R")
  source("dec.R")
  source("toNumber.R")
  source("toSentence.R")
  source("inD.R")
  library("dplyr")
  library("tm")
  
  
  en = enc(input$text,input$num)
  de = dec(code)
  
  output$text1 <- renderText({ 
    paste("Your encrypted message is: ", en)
  })
  
  output$text2 <- renderText({ 
    paste("Your decrypted message is: ", de)
  })

})