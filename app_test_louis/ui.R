library(shiny)

got <- read.csv2("data/got.csv", header=TRUE, sep=";", dec=",")

fluidPage(
  titlePanel("Notes des épisodes par saison"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "saison",
        "Choisir une saison :",
        choices = c("S1", "S2", "S3", "S4", "S5", "S6", "S7", "S8"),
        selected = "S1"
      )
    ),
    mainPanel(
      tableOutput("courbe")
    )
  )
)

