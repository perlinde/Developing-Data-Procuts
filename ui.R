#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#


library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(navbarPage(
    title="SHL Shot Maps",
    theme = shinytheme("cerulean"),
    
    tabPanel(
        title="Analysis",
    
        
  # Sidebar with a slider input for number of bins 
    
    
    sidebarPanel(
       checkboxGroupInput("team",
                   "Team:",
                    choices=c("HV71", "FHC", "FBK", "DIF", "SAIK", "VLH", "RBK",
                              "OHK", "BIF", "KHK", "LHF", "LHC", "MIF", "MIK"),
                   select="HV71"),
       checkboxGroupInput("defTeam",
                          "Defending Team:",
                          choices=c("HV71", "FHC", "FBK", "DIF", "SAIK", "VLH", "RBK",
                                    "OHK", "BIF", "KHK", "LHF", "LHC", "MIF", "MIK"),
                          select=c("HV71", "FHC", "FBK", "DIF", "SAIK", "VLH", "RBK",
                                   "OHK", "BIF", "KHK", "LHF", "LHC", "MIF", "MIK")),
       width=2
    ),
  
    
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("distPlot")
    )
  ),
  tabPanel(
      title="About",
      mainPanel(column(8, offset = 2, includeMarkdown("about.md")))
  )
)
)