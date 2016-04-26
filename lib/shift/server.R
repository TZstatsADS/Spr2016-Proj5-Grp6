library(shiny)
library(shinydashboard)

temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read.delim)
dic = do.call(c,myfiles)
dic = lapply(dic,levels)
rm(myfiles)

#shinyserver
shinyServer(function(input, output,session) {
  
  source("enc.R")
  source("dec.R")
  source("toNumber.R")
  source("toSentence.R")
  source("stringToWord.R")
  source("inD.R")
  library("dplyr")
  library("tm")
  
  
  
  output$text1 <- renderText({ 
    en = enc(input$text,input$num)
    paste("Your encrypted message is: ", en)
  })
  
  output$text2 <- renderText({ 
    en = enc(input$text,input$num)
    words = stringToWord(en)
    if(length(words)>5){
      string = paste(words[1:5], collapse = " ")
    }else{
      string = en}
    s = rep(0,26)
    for(i in 1:26){
      dec = enc(string,i)
      dec = strsplit(dec,split=" ")[[1]]
      score = sapply(dec,inD,dic)
      score = sum(score)
      s[i]=score
    }
    key = which.max(s)
    print(paste("The key is shifting",(26-key),sep=" "))
    out = enc(en,key)
    
    paste("Your decrypted message is: ", out)
  })

})