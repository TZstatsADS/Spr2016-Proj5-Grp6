library(shiny)
library(shinydashboard)

#Codes for shifting
temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read.delim)
dic = do.call(c,myfiles)
dic = lapply(dic,levels)
rm(myfiles)

#Codes for Mapping
load("prob.RData")
load("prob_mat.RData")
prob_mat <- prob.mat

#shinyserver
shinyServer(function(input, output,session) {
  
  source("enc.R")
  source("dec.R")
  source("toNumber.R")
  source("toSentence.R")
  source("stringToWord.R")
  source("inD.R")
  source("vigenerecipher.R")
  source("ngram.R")
  library("dplyr")
  library("tm")
  
  #Output for shifting############################################################
    output$TextFinal<-renderText({
        GetTheWholeText(input$firststring,input$textlength,newmatrix,input$ng)
    })
    
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
  
  #Output for scrambling ############################################################
  
  decode <- function(mapping,coded) {
    coded=toupper(coded)
    decoded=coded
    for (i in 1:nchar(coded)) {
      if (substring(coded,i,i) %in% toupper(letters)) {
        substring(decoded,i,i)=toupper(letters[mapping==substring(coded,i,i)])
      }
    }
    decoded
  }
  
  log.prob <- function(mapping,decoded) {
    logprob=0
    
    lastletter=""
    for (i in 1:nchar(decoded)) {
      curletter=substring(decoded,i,i)
      if (curletter %in% toupper(letters)) {
        logprob=logprob+log(prob[rownames(prob_mat)==lastletter,
                                               colnames(prob_mat)==curletter])
        lastletter=curletter
      } else {
        if (lastletter!="") {
          logprob=logprob+log(prob[rownames(prob_mat)==lastletter,27])
          lastletter=""
        }
      }
    }
    
    if (lastletter!="") {
      logprob=logprob+log(prob[rownames(prob_mat)==lastletter,27])
      lastletter=""
    }
    logprob
  }
  
  output$text3 <- renderText({ 
    coded <- decode(sample(toupper(letters)),input$text1)
    paste("Your encrypted message is: ", coded)
  })
  br()
  
  mapping <- sample(toupper(letters)) 
  i=2 
  
  output$text4 <- renderText({ 
    coded <- decode(sample(toupper(letters)),input$text1)
    cur.decode <- decode(mapping,coded)
    cur.loglike <- log.prob(mapping,cur.decode)
    max.loglike <- cur.loglike
    max.decode <- cur.decode
    while (i<=input$num1) {
      proposal <- sample(1:26,2) # select 2 letters to switch
      prop.mapping=mapping
      prop.mapping[proposal[1]]=mapping[proposal[2]]
      prop.mapping[proposal[2]]=mapping[proposal[1]]
      
      prop.decode=decode(prop.mapping,coded)
      prop.loglike=log.prob(prop.mapping,prop.decode)
      
      if (runif(1)<exp(prop.loglike-cur.loglike)) {
        mapping=prop.mapping
        cur.decode=prop.decode
        cur.loglike=prop.loglike
        
        if (cur.loglike>max.loglike) {
          max.loglike=cur.loglike
          max.decode=cur.decode
        }
        
        cat(i,cur.decode,"\n")
        i=i+1
      }
    }
    paste("Your decrypted message is: ", cur.decode)
      #    "Your decoded message is: ", max.decode)
    
  })
  
  output$text5 <- renderText({ 
    coded <- decode(sample(toupper(letters)),input$text1)
    cur.decode <- decode(mapping,coded)
    cur.loglike <- log.prob(mapping,cur.decode)
    max.loglike <- cur.loglike
    max.decode <- cur.decode
    while (i<=input$num1) {
      proposal <- sample(1:26,2) # select 2 letters to switch
      prop.mapping=mapping
      prop.mapping[proposal[1]]=mapping[proposal[2]]
      prop.mapping[proposal[2]]=mapping[proposal[1]]
      
      prop.decode=decode(prop.mapping,coded)
      prop.loglike=log.prob(prop.mapping,prop.decode)
      
      if (runif(1)<exp(prop.loglike-cur.loglike)) {
        mapping=prop.mapping
        cur.decode=prop.decode
        cur.loglike=prop.loglike
        
        if (cur.loglike>max.loglike) {
          max.loglike=cur.loglike
          max.decode=cur.decode
        }
        
        cat(i,cur.decode,"\n")
        i=i+1
      }
    }
    paste("Your log-likelihood is: ", cur.loglike)
  })
  
  output$text6 <- renderText({ 
    coded <- decode(sample(toupper(letters)),input$text1)
    cur.decode <- decode(mapping,coded)
    cur.loglike <- log.prob(mapping,cur.decode)
    max.loglike <- cur.loglike
    max.decode <- cur.decode
    while (i<=input$num1) {
      proposal <- sample(1:26,2) # select 2 letters to switch
      prop.mapping=mapping
      prop.mapping[proposal[1]]=mapping[proposal[2]]
      prop.mapping[proposal[2]]=mapping[proposal[1]]
      
      prop.decode=decode(prop.mapping,coded)
      prop.loglike=log.prob(prop.mapping,prop.decode)
      
      if (runif(1)<exp(prop.loglike-cur.loglike)) {
        mapping=prop.mapping
        cur.decode=prop.decode
        cur.loglike=prop.loglike
        
        if (cur.loglike>max.loglike) {
          max.loglike=cur.loglike
          max.decode=cur.decode
        }
        
        cat(i,cur.decode,"\n")
        i=i+1
      }
    }
    paste("Your maximum log-likelihood is: ", max.loglike)
  })
  
  output$text7 <- renderText({ 
    coded <- decode(sample(toupper(letters)),input$text1)
    cur.decode <- decode(mapping,coded)
    cur.loglike <- log.prob(mapping,cur.decode)
    max.loglike <- cur.loglike
    max.decode <- cur.decode
    while (i<=input$num1) {
      proposal <- sample(1:26,2) # select 2 letters to switch
      prop.mapping=mapping
      prop.mapping[proposal[1]]=mapping[proposal[2]]
      prop.mapping[proposal[2]]=mapping[proposal[1]]
      
      prop.decode=decode(prop.mapping,coded)
      prop.loglike=log.prob(prop.mapping,prop.decode)
      
      if (runif(1)<exp(prop.loglike-cur.loglike)) {
        mapping=prop.mapping
        cur.decode=prop.decode
        cur.loglike=prop.loglike
        
        if (cur.loglike>max.loglike) {
          max.loglike=cur.loglike
          max.decode=cur.decode
        }
        
        cat(i,cur.decode,"\n")
        i=i+1
      }
    }
    paste("Your decoded message is: ", max.decode)
  })




  ########code for vigenere cipher#############
  output$text8<-renderText({
    vn <- vigen(input$text2,input$text3)
    paste("Your encrypted message is: ", vn)
    
  })
  output$text9<-renderText({
    vnn <- vigen(input$text2,input$text3)
    vd <- vigen(vnn, input$text3, decrypt = T)
    paste("Your decrypted message is: ", vd)
  })
  
  ########code for permutation###########
  output$matrix<-renderTable({
      tt<-input$text4
    matrix(c(substring(tt, 1:nchar(tt), 1:nchar(tt)),rep('*',25-nchar(tt))),5,5,byrow = T)
  })
  output$text10<-renderText({
      tt<-input$text4
    m<-matrix(c(substring(tt, 1:nchar(tt), 1:nchar(tt)),rep('*',25-nchar(tt))),5,5,byrow = T)
    paste(m, collapse = "") 
  })

})