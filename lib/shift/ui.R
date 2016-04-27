library(shiny)
library(shinydashboard)
library("dplyr")
library("tm")

shinyUI( fluidPage(
  navbarPage(
    includeCSS("style.css"),
    tabPanel("The Crime",icon = icon("unlock"),
             sidebarPanel(
               helpText("Fellow classmates and friends, a crime has been committed! Yuting has been kidnapped and is being held for ransom! But, since we all are
                          college students, none of us can afford to pay the criminals to get her back. If we want to get our course grades (and get Yuting back safely), we need to solve this crime!
                        Will you join the Team Six Detective Agency in solving this mystery? We need four volunteers!"),
               img(src="detective.jpg", width=500),
               helpText("Thank you for your participation! Now that we have our full detective team and you all have been given clues, we need to give some background information and knowledge so we can prepare to solve this crime."),
               helpText("Will we be able to save Yuting in time?!")
                  ),
            mainPanel(
              img(src="murder.jpg", width = 400)
            )),
    
    
    tabPanel("Background Information",icon=icon("book"),
             mainPanel(includeMarkdown("background.md")
                 )
             ),
    
    tabPanel("Shift Cipher",icon = icon("level-up"),
             sidebarPanel(
               helpText("What we need to do is send clue 1 to the police without the kidnappers knowing what we are saying"),
               br(),
               helpText("Can the person who has clue one read the clue out loud, and tell us what the message to encode to the police is?"),
               br(),
               helpText("Don't worry though, we will show you also the results of decoding a shift cipher with our algorithm too, to make sure the police can decipher it properly!"),
               textInput("text", "Text:", "What is clue one?!"),
             numericInput("num", "What is the shift value?",  value = 1,min = 1, max = 25),
             submitButton("Submit")
             ),
             
             mainPanel(verbatimTextOutput("text1"),
                       br(),
                       img(src="detec.jpg", width=400),
                       br(),
                       helpText("Thank you, good volunteer for sending us this decoded message for the first clue. When we run this through our Shift Cipher decoding algorithm, we produce the following:"),
                       verbatimTextOutput("text2")
               )
    ),
    
 
    tabPanel("Vigenere Cipher",icon = icon("sliders"),
             sidebarPanel(
               textInput("text2", "Text:", "I love cryptography."),
               textInput("text3", "Key:", "elephant"),
               submitButton("Submit")
             ),
             
             mainPanel(verbatimTextOutput("text8"),
                       verbatimTextOutput("text9")
             )
    ),
    tabPanel("Permutation",icon = icon("random"),
             sidebarPanel(
               textInput("text4", "Text:", "I love cryptography."),
               #textInput("text3", "Key:", "elephant"),
               submitButton("Submit")
             ),
             
             mainPanel(tableOutput("matrix"),
                       verbatimTextOutput("text10")
             )
    ),
    tabPanel("N-Gram Comparison",icon = icon("check"),
             sidebarPanel(
                 
                 textInput("firststring", label = h6("Text input") ,
                           value="the little prince"),
                 numericInput("textlength", label = h6("Text input"), 
                           value="30"),
                 numericInput("ng", label = h6("Text input"),
                          value="4"),
                 submitButton("Submit")
                 ),
             mainPanel(
                 #verbatimTextOutput("TextFinal")
                 #tabsetPanel(type = "tabs", 
                 #           tabPanel("Plot", plotOutput("plot")), 
                 #            tabPanel("Summary", verbatimTextOutput("summary")), 
                 #             tabPanel("Table", tableOutput("table"))
             )
             
    ),
    
    tabPanel("Binary Probability",icon = icon("balance-scale"),
             sidebarPanel(width = 12,
                          textInput("text1", "Text:", "This is the last project."),
                          numericInput("num1", "Number of Iteration",  value = 10,min = 1, max = 100),
                          submitButton("Submit")
             ),
             
             mainPanel(width = 12,
                       verbatimTextOutput("text3"),
                       verbatimTextOutput("text4"),
                       verbatimTextOutput("text5"),
                       verbatimTextOutput("text6"),
                       verbatimTextOutput("text7")
                       
             )
    ),
    
    tabPanel("Conclusion",icon=icon("certificate"),
             mainPanel(includeMarkdown("conclude.md")
             )
    )
               )
             )
    
   
  )


