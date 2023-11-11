## app.R ##
#------ Preâmbulo ------#
library(shiny) # Shiny app
library(shinydashboard) # Template shiny
library(BiocManager) # Para utilizar um outro pacote Biostrings (Genético)
library(kmer) # Função cluster k-mer
library(factoextra) # Plot mais bonito do dendograma
library(XVector) # Rodar func subseq()
library(stringr)

# Instalando Biostrings dentro do BiocManager
# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("Biostrings")
#-------------------------------------------------------------
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
         # importando arquivo .fasta
         box( width = 12, 
              fileInput("file", 
                     div("Escolha seus arquivos no formato ", em(".fasta"), ":"),
              
                      multiple = TRUE,
                      accept = c("text/fasta",
                                 "text/x-fasta",
                                 ".fasta",
                                 ".fa"))
          ),
          #----------- Plotando o Gráfico
        box( width = 12, # Box para gráfico 
          plotOutput("dend") # Gráfico Dendograma
          )
        ),
      # Segundo menu Help
      tabItem(
        tabName = "help", # nome da guia como "help"
             box( width = 12,
              h1("Ajuda", align = "center"), # Cabelhaço da página nível 1 centralizado
              hr(),
             
              div( # Cria uma div para conter o texto
                style = "text-align: justify;", # Adicione o estilo para justificar o texto
               "Esse aplicativo efoi desenvolvido para comparar cepas de SARS-CoV-2. 
               nstruções de utilização do APP. Neste exemplo, adicionamos a classe justify-text à div que envolve o texto. Certifique-se de que o nome da classe CSS corresponda ao que você definiu no arquivo. Isso deve justificar o texto dentro do elemento div com a classe CSS justify-text. Certifique-se de que o arquivo esteja vinculado corretamente ao seu aplicativo Shiny para que o estilo seja aplicado."
             )
            ),
        
        box( width = 12,
             titlePanel("Exemplo de imagem GIF no Shiny"),
              mainPanel(
                imageOutput("gifImage")
              )
             )
        ),
      
      # Quarto menu Contato
      tabItem(  
        tabName = "Contact",
             box( width = 10,
                h1("Contato", align = "center"),
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
  
  #------------- Home -------------#
  # Gráfico Dendograma
  output$dend <- renderPlot({
    req(input$file) # REQUERIDO Garante que o usuário tenha carregado um arquivo
    # browser() # Shiny Debugging
    #------- Importando os dados para comparação
    # Carregando banco de dados de COVID-19 registrados (Genoma completo)
    
    #(fasta_files <- list.files(path = "./Denise" , pattern = '\\.fasta$'))
    # Read the nucleotide sequences in FASTA format.
    #sequences <- Biostrings::readAAStringSet(paste0("Denise/",fasta_files))
    #sequences
    
    #------- Lendo o arquivo .fasta importado pelo usuário
    
    
    # Read the nucleotide sequences in FASTA format.
    
    # Ler o arquivo .fasta importado pelo usuário
    new_seq <- Biostrings::readAAStringSet(input$file$datapath)
    sequences <- c(new_seq)
    
    # Criar um vetor de letras correspondente ao número de sequências
    # num_sequences <- length(sequences)
    # sequence_labels <- LETTERS[1:num_sequences]
    # 
    # # Atribuir as letras como rótulos para as sequências
    
    
    # browser()
    # Título ID do código
    texto <- names(sequences)
    
    
    # Use str_locate() para encontrar a posição do "|"
    posicao <- str_locate(texto, "\\| | \\S")
    
    # Verifique a posição encontrada
    posicao
    
    # Extraia a parte da string antes do "|"
    parte_desejada <- str_sub(texto, start = 1, end = posicao[1] - 1)
    
    
    
    
    names(sequences) <- parte_desejada
    
    
    
    #---------------------------
    # browser() # Shiny Debugging
    # Count the number of base pairs in each sequence
    (lengths <- lengths(sequences))
    # Print the length of the shortest sequence
    (shortest_length <- min(lengths))
    # Trim sequences to the shortest length
    trimmed_sequences <- XVector::subseq(sequences, end = shortest_length)
    # Convert to a matrix for grouping
    seqs <- as.matrix(trimmed_sequences)
    # Generate clustering. Here, k=6, but you can experiment with other values of k.
    # Remember that for k = n, you need to set nstart = n.
    w <- kmer::cluster(seqs, k = 6, nstart = 6, residues = NULL, gap = "-")
    
    #plot(w, main = "", horiz = TRUE)
    
    #--------------- Melhorando plot
    # https://rpubs.com/cleviab/877722
    # http://www.sthda.com/english/wiki/beautiful-dendrogram-visualizations-in-r-5-must-known-methods-unsupervised-machine-learning
    # https://r-charts.com/part-whole/circular-dendrogram/
    # #==========================================
    # # Modelos de plot para testar
    # factoextra::fviz_dend(w, cex = 0.5, horiz = TRUE)
    # 
     factoextra::fviz_dend(w, cex = 0.5, horiz = TRUE,
                           k = 4,
                           k_colors = c("#2E9FDF", "#c066c0", "#E7B800", "#FC4E07"),
                           color_labels_by_k = TRUE
                           
     )
    # 
    #factoextra::fviz_dend(w, k = 4, # corte em 4 grupos
     #          horiz = TRUE,
    #       cex = 0.5, # tamanho do rótulo
    #           k_colors = c("#2E9FDF", "#c066c0", "#E7B800", "#FC4E07"),
    #           color_labels_by_k = TRUE, # cores por grupo
     #         ggtheme = theme_gray() #mudar tema
     #)
    # 
    # factoextra::fviz_dend(w, k = 4, cex = 0.4, horiz = TRUE, k_colors = "jco",
    #           rect = TRUE, rect_border = "jco", rect_fill = TRUE)
    # #==========================================
    
    
    
  })
  #--------------------------------
  # menu help
  output$gifImage <- renderImage({
    list(src = "C:/Users/luanp/Downloads/Vídeo sem título ‐ Feito com o Clipchamp.gif",
         contentType = "image/gif",
         width = "500px")
  }, deleteFile = FALSE)
}

shinyApp(ui, server)