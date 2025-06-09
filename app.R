install.packages("shiny")


library(shiny)
library(ggplot2)
library(factoextra)
library(readr)
library(dplyr)

ui <- fluidPage(
  titlePanel("Customer Segmentation with K-Means"),
  sidebarLayout(
    sidebarPanel(
      numericInput("clusters", "Choose number of clusters:", 5, min = 1, max = 10)
    ),
    mainPanel(
      plotOutput("clusterPlot")
    )
  )
)

server <- function(input, output) {
  data <- reactive({
    df <- read_csv("Mall_Customers.csv")
    df$Gender <- as.numeric(factor(df$Gender, levels = c("Male", "Female")))
    df_clean <- df[, c("Gender", "Age", "Annual Income (k$)", "Spending Score (1-100)")]
    colnames(df_clean) <- c("Gender", "Age", "Income", "Score")
    df_clean
  })

  clusters <- reactive({
    kmeans(data(), centers = input$clusters, nstart = 25)
  })

  output$clusterPlot <- renderPlot({
    fviz_cluster(clusters(), data = data(), geom = "point", ellipse.type = "norm") +
      labs(title = paste("Customer Segments with k =", input$clusters))
  })
}

shinyApp(ui = ui, server = server)
