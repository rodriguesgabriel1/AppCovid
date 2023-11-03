## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  # Cabeçalho
  dashboardHeader(
    title = "AppCovid Check"
  ),
  # Barra lateral
  dashboardSidebar(),
  # Corpo do App
  dashboardBody(
    # 1 Linha 
    fluidRow(
      # 1 Box
      box( # importando arquivo .fasta
        fileInput("file", "Escolha um arquivo .fasta:",
                  multiple = FALSE,
                  accept = c(".fasta"))
      )
      #-----------
      
    )
    
    
    
  )
)

server <- function(input, output) {
  # Lendo os arquivos do upload
  uploaded_data <- reactive({
    req(input$file) # REQUERIDO Garante que o usuário tenha carregado um arquivo
    read.csv(input$file$datapath) # Lê o arquivo CSV carregado pelo usuário
  })
  
}

shinyApp(ui, server)