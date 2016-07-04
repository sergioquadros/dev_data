
library(rmarkdown)
library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Iris Data: Some Exploratory Plots"),
  # Sidebar Layout
  sidebarLayout(
          sidebarPanel(
            # First choice: histogram or scatter plot
            selectInput(
                    inputId = "plotType",
                    label = "Plot Type",
                    c(Scatter ="Scatter Plot",
                      Histogram = "Histogram")),
            # Second choice:
                # 2nd choice is a scatter plot
            conditionalPanel(condition="input.plotType == 'Scatter Plot'",
                             selectInput(
                                     inputId = "x_var",
                                     label = "X Variable",
                                     names(iris),
                                     selected = names(iris)[[1]]
                                     ),
                             selectInput(
                                     inputId = "y_var",
                                     label = "Y Variable",
                                     names(iris),
                                     selected = names(iris)[[3]]
                                     )
                             ),

                # 2nd choice was histogram
            conditionalPanel(condition="input.plotType == 'Histogram'",
                             sliderInput(inputId = "bins",
                                         label = "Number of bins:",
                                         min = 5, max = 60, value = 35),
                             selectInput(
                                     inputId = "x_hist",
                                     label = "Variable",
                                     names(iris),
                                     selected = names(iris)[[1]]
                             )
                             )
            ),
          # Show the selected plot
          mainPanel(
                  plotOutput(outputId = "main_plot")
                  )
          ),
  # Documention at "_README.html"
  fluidRow(
          column(12,includeMarkdown("_README.md")
          )
          )
  )
)
