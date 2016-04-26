library(shiny)
library(shinydashboard)

shinyUI( fluidPage(
  navbarPage(
    "Team 8 Project 5",
    tabPanel("What is Crypotography?",icon = icon("unlock"),
             helpText("Cryptography is a method of storing and 
                      transmitting data in a particular form so 
                      that only those for whom it is intended can
                      read and process it. ")),
    
    
    tabPanel("Exploratory Analysis",icon=icon("line-chart"),
             sidebarLayout(position="left",
                           sidebarPanel(width = 3),
                           
                           
                           mainPanel(width = 9)
                           )
             ),
    
    tabPanel("App",icon = icon("apple"),
             sidebarPanel(
               radioButtons("method", "Select the Method",
                            c("Method 1" = "one",
                              "Method 2" = "two")),
               
               textInput("text", "Text:", "I love cryptography."),
             numericInput("num", "Numeric input",  value = 1,min = 1, max = 25),
             submitButton("Submit")
             ),
             
             mainPanel(verbatimTextOutput("text1"),
                       verbatimTextOutput("text2")
               )
    ),

    
    tabPanel("Ngram",icon = icon("apple"),
             sidebarPanel(
                 
                 textInput("firststring", label = h6("Text input"), 
                           value = "a bad dream"),
                 numericInput("textlength", label = h6("Text input"), 
                           value = 20),
                 numericInput("ng", label = h6("Text input"), 
                           value = 4)
                 ),
             mainPanel(
                 textOutput("TextFinal"
                 )
                 #tabsetPanel(type = "tabs", 
                 #           tabPanel("Plot", plotOutput("plot")), 
                 #            tabPanel("Summary", verbatimTextOutput("summary")), 
                 #             tabPanel("Table", tableOutput("table"))
             )
             
    ),
    
    
    tabPanel("Info",icon=icon("facebook"),
             tabItem(tabName = "about",
                              box(width = 12,h3(icon("group"),"Team Members"))
                   #title = "Team Members", status = "primary", solidHeader = TRUE, collapsible = TRUE, width = 12,
                   
               )
               )
             )
    
   
  ))


