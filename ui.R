library(shiny)
library(shinythemes)
library(markdown)

####################################
# User Interface                   #
####################################
ui <- fluidPage(theme = shinytheme("darkly"),
                navbarPage("BMI Calculator:",
                           
                           tabPanel("Home",
                                    # Input values
                                    sidebarPanel(
                                      HTML("<h3>Input parameters</h3>"),
                                      sliderInput("height", 
                                                  label = "Height", 
                                                  value = 175, 
                                                  min = 40, 
                                                  max = 250),
                                      sliderInput("weight", 
                                                  label = "Weight", 
                                                  value = 70, 
                                                  min = 20, 
                                                  max = 100),
                                      
                                      actionButton("submitbutton", 
                                                   "Submit", 
                                                   class = "btn btn-primary")
                                   
                                    ),
                                    mainPanel(
                                      tags$label(h3('Status/Output')), # Status/Output Text Box
                                      verbatimTextOutput('contents'),
                                      tableOutput('tabledata') # Results table
                                    ) # mainPanel()
                                    
                           ), #tabPanel(), Home
                           
                           tabPanel("About", 
                                    titlePanel("About"), 
                                    div(includeMarkdown("about.md"),
                                        align="justify")
                           ) #tabPanel(), About
                           
                ),# navbarPage()
                actionButton(
                  "sign_out",
                  "Log af",
                  icon = icon("sign-out-alt"),
                  class = "pull-right"
                )
) # fluidPage()

secure_ui(ui)