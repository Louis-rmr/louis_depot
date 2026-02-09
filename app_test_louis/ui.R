library(shiny)

got <- read.table("data/got.csv", header=TRUE, sep=";", dec=",")

fluidPage(
  titlePanel("Notes des épisodes par saison"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "saison",
        "Choisir une saison :",
        choices = sort(unique(got$season)),
        selected = "S1"
      )
    ),
      plotOutput("courbe")
  )
)

