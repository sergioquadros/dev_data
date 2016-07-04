# data(iris)
library(shiny)
library(ggplot2)
shinyServer(function(input, output) {

        output$main_plot <- renderPlot({
                if(input$plotType=="Scatter Plot"){
                  ggplot(data=iris,aes(x=iris[,input$x_var],y=iris[,input$y_var]))+
                          geom_point(aes(colour=Species),alpha=0.95,size=3,na.rm=TRUE)+
                                xlab(paste(input$x_var," (cm)"))+
                                ylab(paste(input$y_var," (cm)"))

          }else{
                  ggplot(data=iris,aes(x=iris[,input$x_hist],y=..count..,
                                       label=..count..),stat="count",
                         position="dodge")+
                          geom_histogram(aes(colour=Species,fill=Species),
                                         bins=input$bins,alpha=0.95,
                                         position="dodge")+
                          xlab(paste(input$x_hist," (cm)"))
          }
          })

})
