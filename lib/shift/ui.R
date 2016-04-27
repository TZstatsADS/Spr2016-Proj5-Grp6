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
                        Will you join the Team Six Detective Agency in solving this mystery? We need six volunteers!"),
               img(src="murder.jpg", width = 400),
               helpText("Thank you for your participation! Now that we have our full detective team and you all have been given clues, we need to give some background information and knowledge so we can prepare to solve this crime."),
               helpText("Will we be able to save Yuting in time?!")
                  ),
            mainPanel(
              
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
                       helpText("Thank you, good volunteer for sending us this decoded message for the first clue. When we run this through our Shift Cipher decoding algorithm, we produce the following:"),
                       verbatimTextOutput("text2")
               )
    ),
    
 
    tabPanel("Vigenere Cipher",icon = icon("sliders"),
             sidebarPanel(
               helpText("Now, we know where Yuting is, but how many kidnappers are there?"),
               br(),
               helpText("To be extra safe, we will use the Vignere method to encode and decode, with the same communication procedure as last time"),
               br(),
               textInput("text2", "Text:", "How many bad guys do the police need to fight?"),
               br(),
               textInput("text3", "Key:", "What Key should we use?"),
               submitButton("Submit")
             ),
             
             mainPanel(
               helpText("This is the encrypted message we sent over the the police!"),
               verbatimTextOutput("text8"),
               br(),
               helpText("Here is what they decoded! The message was sent successfully!"),
               br(),
               verbatimTextOutput("text9")
             )
    ),
    tabPanel("Permutation",icon = icon("random"),
             sidebarPanel(
               helpText("Now finally, can the person with clue 3 tell us if Yuting gave us any other messages? Is she in need of medical help?"),
               br(),
               textInput("text4", "Text:", "6"),
               #textInput("text3", "Key:", "elephant"),
               submitButton("Submit")
             ),
             
             mainPanel(
               helpText("And here are the encoded results that were sent to the police"),
               br(),
                       verbatimTextOutput("text10"),
               helpText("But this is the decoded visual matrix produced! Much clearer."),
               br(),
               tableOutput("matrix")
             )
    ),
    tabPanel("N-Gram Comparison",icon = icon("check"),
             sidebarPanel(
                 helpText("Now finally, since this is a stressful situation, we need to see who else we should inform about Yuting's kidnapping. What does clue four say?"),
                 br(),
                 textInput("firststring", label = h6("Text input") ,
                           value="the little prince"),
                 numericInput("textlength", label = h6("Text input"), 
                           value="12"),
                 numericInput("ng", label = h6("Text input"),
                          value="4"),
                 submitButton("Submit")
                 ),
             mainPanel(
                 verbatimTextOutput("TextFinal")
                 #tabsetPanel(type = "tabs", 
                 #           tabPanel("Plot", plotOutput("plot")), 
                 #            tabPanel("Summary", verbatimTextOutput("summary")), 
                 #             tabPanel("Table", tableOutput("table"))
             )
             
    ),
    
    tabPanel("Binary Probability",icon = icon("balance-scale"),
             sidebarPanel(width = 12,
                          helpText("While the police are on their way, we should take a side-step"),
                          textInput("text1", "Text:", "I was hoping this would work but for now it should just confuse the kidnappers which is also good. However, this idea with future development, should prove very promising. "),
                          numericInput("num1", "Number of Iterations",  value = 1 ,min = 1, max = 100),
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
             sidebarPanel(
               helpText("Yuting has now been found, and she is so grateful she is going to give everyone an A in the course! Now you can include yourselves in the ranks of the the great detectives!")
             ),
             mainPanel(
               img(src="detective.jpg", width=900),
               br(),
               includeMarkdown("conclude.md")
             )
    )
               )
             )
    
   
  )


