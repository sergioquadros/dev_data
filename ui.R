library(rmarkdown)
library(shiny)
shinyUI(fluidPage(
        titlePanel("Iris Data: Some Exploratory Plots"),
        br(),
        sidebarLayout(
                position = "right",
                sidebarPanel(
                        # First Choice: boxplot, histogram or scatter plot
                        selectInput(
                                inputId = "plotType",
                                label = "Plot Type",
                                choices = c(Box = "Box Plot",
                                            Histogram = "Histogram",
                                            Scatter = "Scatter Plot")
                        ),
                        br(),
                        # Boxplot Inputs
                        conditionalPanel(
                                condition = "input.plotType == 'Box Plot'",
                                selectInput(
                                        inputId = "y_box",
                                        label = "Variable",
                                        names(iris)[-5],
                                        selected = names(iris)[1]
                                )
                        ),
                        # Histogram Inputs
                        conditionalPanel(
                                condition = "input.plotType == 'Histogram'",
                                selectInput(
                                        inputId = "x_hist",
                                        label = "Variable",
                                        names(iris)[-5],
                                        selected = names(iris)[1]
                                ),
                                br(),
                                sliderInput(inputId = "bins",
                                            label = "Number of bins:",
                                            min = 5, max = 40, value = 10)
                        ),
                        # Scatter Plot Inputs
                        conditionalPanel(
                                condition = "input.plotType == 'Scatter Plot'",
                                selectInput(
                                        inputId = "x_var",
                                        label = "X Variable",
                                        names(iris)[-5],
                                        selected = names(iris)[1]
                                ),
                                br(),
                                selectInput(
                                        inputId = "y_var",
                                        label = "Y Variable",
                                        names(iris)[-5],
                                        selected = names(iris)[3]
                                )
                        )
                        ,
                        br(),
                        actionButton("update", "Counter"),
                        p("Click the button to update how many plots you have counted."),
                        htmlOutput("text")
                ),
                mainPanel(
                        plotOutput(outputId = "main_plot")
                )
        ),
        # Documention at "Iris.html"
        fluidRow(
                column(12,includeMarkdown("Iris.md"))
        )
))
