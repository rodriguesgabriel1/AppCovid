library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(
    title = "AppCovid Check"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home"),
      menuItem("Help", tabName = "help"),
      menuItem("Desenvolvedores", tabName = "Dev"),
      menuItem("Contato", tabName = "contact")  # Corrigido para "contact"
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "home",
        box(
          fileInput("file", "Escolha um arquivo .fasta:",
                    multiple = FALSE,
                    accept = c(".fasta"))
        )
      ),
      tabItem(
        tabName = "contact",
        box(
        textInput("nome", "Nome:"),
        textInput("email", "E-mail:"),
        textAreaInput("mensagem", "Mensagem:"),
        actionButton("enviar", "Enviar"),
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
  
  # função observeEvent para lidar com o envio do formulário
  observeEvent(input$enviar, {
    # adicionar função para receber as mensagens
    # você pode usar os valores de input$nome, input$email e input$mensagem
    
    output$feedback <- renderText({
      "Mensagem enviada com sucesso!"
    })
  })
}

shinyApp(ui, server)
