fluidPage(
  # Application title
  titlePanel("Code of Ethics and Conduct"),
  # sidebar description
  br(),
    fluidRow(
      column(4,
             h4("Which Word Cloud?"),
             p("You can generate your word cloud based on the Word Frequency, Number of Cases, or TF-ID* driven from 143 code of ethics and conduct in the field of chemistry.")
    )
    ),
    
     
   sidebarPanel(
     selectInput("selection", "Choose a Variable:",
                 choices = colnames(data)[2:4]),
     actionButton("update", "Change"),
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
        tabPanel("Word Cloud", plotOutput("plot")),
        tabPanel("Table", dataTableOutput(outputId= "table")),
        tabPanel("Histogram", plotOutput("histogram"))
    )
    )
  )
