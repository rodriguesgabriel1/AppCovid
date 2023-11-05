## app.R ##
#------ Preâmbulo ------#
library(shiny) # Shiny app
library(shinydashboard) # Template shiny
library(BiocManager) # Para utilizar um outro pacote Biostrings (Genético)
library(kmer) # Função cluster k-mer
library(factoextra) # Plot mais bonito do dendograma
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
          box( # importando arquivo .fasta
            fileInput("file", "Escolha um arquivo .fasta:",
                      multiple = FALSE,
                      accept = c("text/fasta",
                                 "text/x-fasta",
                                 ".fasta",
                                 ".fa"))
          ),
          #----------- Plotando o Gráfico
        box( # Box para gráfico 
          plotOutput("dend") # Gráfico Dendograma
          )
        ),
      # segundo menu HELP
      tabItem(
        tabName = "help"
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
    (fasta_files <- list.files(path = "./Denise" , pattern = '\\.fasta$'))
    # Read the nucleotide sequences in FASTA format.
    sequences <- Biostrings::readAAStringSet(paste0("Denise/",fasta_files))
    sequences
    #------- Lendo o arquivo .fasta importado pelo usuário
    # Read the nucleotide sequences in FASTA format.
    new_seq <- Biostrings::readAAStringSet(input$file$datapath)
    sequences <- c(sequences,new_seq)
    # Mudando o nome das sequencias para designer do plot
    names(sequences) <- LETTERS[1:18]
    #---------------------------
    # browser() # Shiny Debugging
    # Count the number of base pairs in each sequence
    (lengths <- lengths(sequences))
    # Print the length of the shortest sequence
    (shortest_length <- min(lengths))
    # Trim sequences to the shortest length
    trimmed_sequences <- subseq(sequences, end = shortest_length)
    # Convert to a matrix for grouping
    seqs <- as.matrix(trimmed_sequences)
    # Generate clustering. Here, k=6, but you can experiment with other values of k.
    # Remember that for k = n, you need to set nstart = n.
    w <- kmer::cluster(seqs, k = 6, nstart = 6, residues = NULL, gap = "-")
    plot(w, main = "", horiz = TRUE)
    
    #--------------- Melhorando plot
    # https://rpubs.com/cleviab/877722
    # http://www.sthda.com/english/wiki/beautiful-dendrogram-visualizations-in-r-5-must-known-methods-unsupervised-machine-learning
    # https://r-charts.com/part-whole/circular-dendrogram/
    # #==========================================
    # # Modelos de plot para testar
    # factoextra::fviz_dend(w, cex = 0.5, horiz = TRUE)
    # 
    # factoextra::fviz_dend(w, cex = 0.5, horiz = TRUE,
    #                       k = 4,
    #                       k_colors = c("#2E9FDF", "#c066c0", "#E7B800", "#FC4E07"),
    #                       color_labels_by_k = TRUE
    #                       
    # )
    # 
    # factoextra::fviz_dend(w, k = 4, # corte em 4 grupos
    #           horiz = TRUE,
    #           cex = 0.5, # tamanho do rótulo
    #           k_colors = c("#2E9FDF", "#c066c0", "#E7B800", "#FC4E07"),
    #           color_labels_by_k = TRUE, # cores por grupo
    #           ggtheme = theme_gray() #mudar tema
    # )
    # 
    # factoextra::fviz_dend(w, k = 4, cex = 0.4, horiz = TRUE, k_colors = "jco",
    #           rect = TRUE, rect_border = "jco", rect_fill = TRUE)
    # #==========================================
    
    
    
  })
  #--------------------------------
  
}

shinyApp(ui, server)