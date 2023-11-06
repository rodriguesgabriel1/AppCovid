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
      # Quarto menu Contato
      tabItem(  
        tabName = "Contact",
        box("Contato",
                 textInput("nome", "Nome:"),
                 textInput("email", "Email:"),
                 textAreaInput("mensagem", "Mensagem:"),
                 submitButton("Enviar"),
                 textOutput("feedback")
        )
        
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
  ## crie essa função para dar funcionalidade ##
  ## ao botão enviar mas, não funcionou!     ##
  observeEvent(input$submit, {
    # Execute ação quando o botão "Enviar" for clicado
    nome <- input$nome
    email <- input$email
    mensagem <- input$mensagem
    
    # Lógica para enviar um email, armazenar em um banco de dados, etc.
    
    # Atualize o feedback para o usuário
    output$feedback <- renderText({
      paste("Obrigado por entrar em contato, ", nome, "!")
    })
  })
  
}

shinyApp(ui, server)