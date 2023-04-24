library(tidyverse)
library(readxl)
install.packages("shiny")
Nigeria_Cleaned_6_24_2022_Version2 <- read_excel("Nigeria_Cleaned_6.24.2022_Version2.xlsx")
View(Nigeria_Cleaned_6_24_2022_Version2)

N.HIV <- Nigeria_Cleaned_6_24_2022_Version2


# Read in the title file
title_file <- read_excel("Quantitative Codebook.xlsx")

Clean.N.HIV <- subset(N.HIV, select = c("uniqueidentifyingcode", "language", "implementationyear",
                                "country", "beforetheinterview_1", "beforetheinterview_2", "q1", "q2",
                                "q3"))



library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  titlePanel("My Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("mtcars", "iris"))
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Define server
server <- function(input, output) {
  output$plot <- renderPlot({
    data <- switch(input$dataset,
                   "mtcars" = mtcars,
                   "iris" = iris)
    ggplot(data, aes(x = mpg, y = wt)) +
      geom_point()
  })
}

# Run the app
shinyApp(ui, server)
