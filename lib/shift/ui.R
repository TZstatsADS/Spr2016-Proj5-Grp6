library(shiny)
library(shinydashboard)

shinyUI( fluidPage(
  navbarPage(
    includeCSS("style.css"),
    tabPanel("Crypotography",icon = icon("unlock"),
             box(width = 6,
                 img(src="murder.jpg", width = 400) ),
             box(width = 6,
                 helpText("There was a death on Treebark Ln. The victim was identified 
as Mark Oswalt, who recently was married. The police went to the crime scene and they 
reported the death as a suicide. Later that day, after the police left, a private detective, 
hired by the victim's friend who thought it was a murder, searched the crime scene and 
found a note the police missed. It read: "),
                 helpText("4,3: 8,1:_: 9,1: 2,1: 7,4:_: 6,1:9,3:_: 9,1: 4,3: 3,3: 3,2: !"),
                 helpText("The detective took out his cell phone and started dialing the
police to tell them about his findings. Once the detective opened the phone to dial, he 
                          immediately screamed out, 'I SOLVED IT!'"),
                 br(),
                 helpText("Who was the murderer and how did the detective find out?")
                        
                 )
            ),
    
    
    tabPanel("Exploratory Analysis",icon=icon("line-chart"),
             sidebarLayout(position="left",
                           sidebarPanel(width = 3),
                           
                           
                           mainPanel(width = 9)
                           )
             ),
    
    tabPanel("Shifting",icon = icon("apple"),
             sidebarPanel(
               textInput("text", "Text:", "I love cryptography."),
             numericInput("num", "Number of shift",  value = 1,min = 1, max = 25),
             submitButton("Submit")
             ),
             
             mainPanel(verbatimTextOutput("text1"),
                       verbatimTextOutput("text2")
               )
    ),
    
    tabPanel("Mapping",icon = icon("apple"),
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
                              box(width = 12,h3(icon("group"),"Team Members"),
                                  br(),
                                  h5("Nicole Marie Lapointe Jameson: nml2145@columbia.edu"),
                                  h5("Yanran Wang: yw2758@columbia.edu"),
                                  h5("Zehao Wang: zw2323@columbia.edu"),
                                  h5("Yanyu Zheng: yz2690@columbia.edu"),
                                  h5("Jadie Zuo: xz2467@columbia.edu"))
                   
               )
               )
             )
    
   
  ))


