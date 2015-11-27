fluidPage(
  # Application title
  titlePanel("Code of Ethics and Conduct"),
  # sidebar description
  br(),
    fluidRow(
      column(11,
             h4("Analysis of existing codes of conduct and codes of ethics relevant to the practice of chemistry."),
             p("As part of the Workshop on Ethical Guidelines for the Practice of Chemistry under the Norms of the Chemical Weapons Convention, 142 codes were collected and analysed. Here you can interact with our findings and results."),
             br(),
             p("You can toggle between word frequency, case frequency, and TF-IDF."),
             p("ps. download button is not functional at the moment.")
    )
    ),
    
  br(),
   sidebarPanel(
     selectInput("selection", "Choose a Variable:",
                 choices = colnames(data)[2:4]),
     #actionButton("update", "Change"),
     hr(),
            sliderInput("slider", "Frequency Range:",
                        min = 10, max = 2000, value = 100, step= 10, animate=F
                        
                        ),
     downloadButton('downloadData', 'Download')
     ),
   
    # helpText("what is TFID?")
    # Show Word Cloud
    mainPanel(
      tabsetPanel(
        tabPanel("Frequency Table", dataTableOutput(outputId= "table")),
        tabPanel("Histogram", plotOutput("histogram")),
        tabPanel("Word Cloud", plotOutput("plot"))
        
    )
    )
)
