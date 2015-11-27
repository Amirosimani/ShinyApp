data <- read.csv("./Data/TFIDF.csv", header = TRUE)

function(input, output, clientData, session) {
  

  observe({
    updateSliderInput(session, "slider",
                      min = min(data[,input$selection]), max = max(data[,input$selection]))
  })
     
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    wordcloud_rep(data$Text, data[,input$selection], scale=c(3,0.1),
                  min.freq = input$slider, max.words= max(data[,input$selection]),
                  random.order=F,
                  colors=brewer.pal(8, "Dark2")
                  )
  })
  
  output$table <- renderDataTable({
    plotdata <- data.frame(data[,1],data[,input$selection])

})
  output$histogram <- renderPlot({
    hist( data[,input$selection],  breaks = (max(data[,input$selection])-min(data[,input$selection])) , col = 'darkgray', border = 'white', main = "Distrubtion of words based on your selected value", xlim=c(0,150), xlab =input$selection ,ylab = "")  
  })
  
  output$downloadData <- downloadHandler ( filename = function() {paste(data, '.csv' , sep='')},
                                           content = function(file){
                                             write.csv(data(), file)
                                           }
                                             )


}
