library(devtools)
library(slidify)
library(slidifyLibraries)
library(shiny)
library(shinyapps)
library(ggplot2)
data("iris")

shinyServer(function(input, output, session) {
        whichPlot <- reactive({
                switch(input$plotType,
                       "Box Plot" = 1,
                       "Histogram" = 2,
                       "Scatter Plot" = 3)
        })
        whichBoxVar <- reactive({
                switch(input$y_box,
                       "Sepal.Length" = 1,
                       "Sepal.Width" = 2,
                       "Petal.Length" = 3,
                       "Petal.Width" = 4
                )
        })
        whichHistVar <- reactive({
                switch(input$x_hist,
                       "Sepal.Length" = 1,
                       "Sepal.Width" = 2,
                       "Petal.Length" = 3,
                       "Petal.Width" = 4
                )
        })
        whichScatXvar <- reactive({
                switch(input$x_var,
                       "Sepal.Length" = 1,
                       "Sepal.Width" = 2,
                       "Petal.Length" = 3,
                       "Petal.Width" = 4
                )
        })
        whichScatYvar <- reactive({
                switch(input$y_var,
                       "Sepal.Length" = 1,
                       "Sepal.Width" = 2,
                       "Petal.Length" = 3,
                       "Petal.Width" = 4
                )
        })
        output$main_plot <- renderPlot({
                if (whichPlot() == 1) {
                        ggplot(iris, aes(x = Species, y = iris[,whichBoxVar()],
                                         fill = Species)) +
                                geom_boxplot(notch = TRUE) +
                                xlab("Species") +
                                ylab(paste(names(iris)[whichBoxVar()]," (cm)"))
                }
                else{if ( whichPlot() == 2) {
                        ggplot(data = iris,aes(x = iris[,whichHistVar()],y = ..count..,
                                               label = ..count..),stat = "count",
                               position = "dodge") +
                                geom_histogram(aes(colour = Species, fill = Species),
                                               bins = input$bins, alpha = 0.95,
                                               position = "dodge") +
                                xlab(paste(names(iris)[whichHistVar()]," (cm)"))
                }else{

                        ggplot(data = iris,aes(x = iris[,whichScatXvar()],
                                               y = iris[,whichScatYvar()])) +
                                geom_point(aes(colour = Species),alpha = 0.95,
                                           size = 3,na.rm = TRUE) +
                                xlab(paste(names(iris)[whichScatXvar()]," (cm)")) +
                                ylab(paste(names(iris)[whichScatYvar()]," (cm)"))

                }
                }
        })
        vals <- reactiveValues(count = 0)
        observeEvent(input$update , vals$count <- vals$count + 1)
        output$text <- renderUI({
                HTML(paste(sprintf("You have counted: %s</br>", vals$count)))
        })
}
)
