library(shiny)
library(writexl)
library(shinyhelper)
library(shinythemes)

shinyUI(fluidPage(theme = shinytheme("paper"),
    img(src='cbc.jpg',  height = '200px', width = '200px', style = 'float:right;'),
    titlePanel(strong("Centre for Biological Control Database Repository")),
    titlePanel(h6("Rhodes University, Department of Zoology and Entomology, Grahamstown, South Africa")),
    titlePanel(h6("* Please report any bugs in this application to vsteenderen@gmail.com")),
    br(),
    tags$style(HTML(" .tabbable > .nav > li > a {background-color: olivedrab; color:black; width: 140PX; border-right: 5px solid darkolivegreen; }  ", ".nav-tabs {font-size: 14px} ")),
  
    tabsetPanel(
        tabPanel(tags$b("CACTI"), 
        sidebarPanel(
        textOutput("cactus_num"),
        #tags$head(tags$style("#cactus_num{color: darkolivegreen;}")),
        
        br(),
        selectizeInput("cactus_database", strong("Select File:"), choices = list.files("cactus/")),
        downloadButton("download_cactus", style="color: #fff; background-color: darkolivegreen; border-color: white")
        ),
        
        mainPanel()),
        
        tabPanel(tags$b("CITRUS"),
                 sidebarPanel(
                     textOutput("citrus_num"),
                     br(),
                     selectizeInput("citrus_database", strong("Select File:"), choices = list.files("citrus/")),
                     downloadButton("download_citrus", style="color: #fff; background-color: darkolivegreen; border-color: white")
                 ),         
        ),
        
        tabPanel(tags$b("GRASSES"),
                 sidebarPanel(
                     textOutput("grasses_num"),
                     br(),
                     selectizeInput("grasses_database", strong("Select File:"), choices = list.files("grasses/")),
                     downloadButton("download_grasses", style="color: #fff; background-color: darkolivegreen; border-color: white")
                 ),      
        ),
        
        tabPanel(tags$b("WATER WEEDS"),
                 sidebarPanel(
                     textOutput("waterweeds_num"),
                     br(),
                     selectizeInput("waterweeds_database", strong("Select File:"), choices = list.files("waterweeds/")),
                     downloadButton("download_waterweeds", style="color: #fff; background-color: darkolivegreen; border-color: white")
                 ),      
        ),
        
        tabPanel(tags$b("OTHER"),
                 sidebarPanel(
                     textOutput("other_num"),
                     br(),
                     selectizeInput("other_database", strong("Select File:"), choices = list.files("other/")),
                     downloadButton("download_other", style="color: #fff; background-color: darkolivegreen; border-color: white")
                 ),      
                 )
        
    )
    )
)
