## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  # Cabeçalho
  dashboardHeader(
    title = "AppCovid Check"
  ),
  # Barra lateral
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home"),
      menuItem("Help", tabName = "help"),
      menuItem("Desenvolvedores", tabName = "Dev"),
      menuItem("Contato", tabName = "Contact")
    )
  ),
  # Corpo do App
  dashboardBody(
    #Colocar vários menus 
    tabItems(
      #Primeiro menu HOME
      tabItem(
        #Nome do menu desejado
        tabName = "home",
          # 1 Box
          box( # importando arquivo .fasta
            fileInput("file", "Escolha um arquivo .fasta:",
                      multiple = FALSE,
                      accept = c(".fasta"))
          )
          #-----------
          
        ),
      # segundo menu HELP
      tabItem(
        tabName = "help"
      )
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