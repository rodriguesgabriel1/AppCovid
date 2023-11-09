## app.R ##
library(shiny)
library(shinydashboard)



ui <- dashboardPage(
  skin = "purple", 
  # Cabeçalho
  dashboardHeader(
    title = "AppCovid Check"
  ),
  # Barra lateral
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home"),
      menuItem("Help", tabName = "help"),
      menuItem("Desenvolvedores", tabName = "Dev",icon = icon("landmark")),
      menuItem("Contato", tabName = "Contact")
    )
  ),
  # Corpo do App
  dashboardBody(
        fluidRow(
    #Colocar vários menus 
    tabItems(
      # segundo menu HELP
      tabItem(
        tabName = "Dev",
        
        #Título para os Desenvolvedores
        h1("Desenvolvedores", style= "font-family: 'Times New Roman';
           font-size: 45pt; text-align: center;font-weight: bold;"),
        
        
        #----------------
        # 1º Box para a desenvolvedora Denise
        box(status = "primary",
            solidHeader = TRUE,
            width = 6,
          #--------------
          #Tags para colocar a imagem de Denise em formato circular
          tags$img(src="denise.jpeg", class = "img-circle",
                   width = "200px", height = "200px"),style = "text-align: center",
          
          #Título com o nome da desenvolvedora
          h1(style="font-family: 'Times New Roman'; font-size: 20pt; 
             text-align: center; font-weight: bold;",
             "Denise de Assis Paiva"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Descrição
          p(style="font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;",
            "Universidade Federal de Lavras - UFLA"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/6114238098801542",
            style="font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;")
        ),
        
        
        
        
        #------------------
        #2º Box para a desenvolvedora Thelma
        box(
          status = "primary",
          solidHeader = TRUE,
          width = 6,
          tags$img(src="thelma.jpeg", class = "img-circle",
                   width = "200px", height = "200px"),
          
          #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",
          
          #Título com o nome da desenvolvedora
          h1(style="font-family: 'Times New Roman'; font-size: 20pt; 
             text-align: center; font-weight: bold;",
             "Thelma Sáfadi"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Descrição
          p(style= "font-family: 'Times New Roman'; font-size: 15pt;
            text-align: center;",
            "Universidade Federal de Lavras - UFLA"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/9821585244827807",
            style="font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;")
        ),
        
        
        
        
        #------------------
        #3º Box para a desenvolvedora karla
        box(
          status = "primary",
          solidHeader = TRUE,
          width = 6,
          tags$img(src="Karla.jpeg", class = "img-circle",
                   width = "200px", height = "200px"),
          
          #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",
          
          #Título com o nome da desenvolvedora
          h1(style="font-family: 'Times New Roman'; font-size: 20pt; 
             text-align: center; font-weight: bold;",
             "Karla Suemy Clemente Yotoko"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Descrição
          p(style= "font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;",
            "Universidade Federal de Viçosa - UFV"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/6405218841067158",
            style="font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;")
         ),
        
        #Usado para criar um espaço entre o Título e a descrição
        br(),
        
        
        
        #--------------
        #4º box do desenvolvedor Zarzar
        box(
          status = "primary",
          solidHeader = TRUE,
          width = 6,
          tags$img(src="zarzar.png", class = "img-circle",
                   width = "200px", height = "200px"),
          
          #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",
          
          #Título com o nome da desenvolvedora
          h1(style="font-family: 'Times New Roman'; font-size: 20pt; 
             text-align: center; font-weight: bold;",
             "Carlos Antônio Zarzar"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Descrição
          p(style= "font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;",
            "Universidade federal do Oeste do Pará - UFOPA Campus Monte Alegre"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/6505656674643382",
            style="font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;")
        ),
        
        
        
        #--------------
        #5º Box do desenvolvedor Gabriel
        box(
          status = "primary",
          solidHeader = TRUE,
          width = 6,
          tags$img(src="gabriel.png", class = "img-circle",
                   width = "200px", height = "200px"),
          
            #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",
          
            #Título com o nome da desenvolvedora
          h1(style="font-family: 'Times New Roman'; font-size: 20pt; 
             text-align: center; font-weight: bold;",
               "Gabriel Rodrigues da Silva"),
          
            #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Descrição
          p(style= "font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;",
            "Universidade federal do Oeste do Pará - UFOPA Campus Monte Alegre"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Link com um determinado nome
          a("Currículo Lattes", href= "lattes.cnpq.br/8677409423160124",
            style="font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;")
        ),
        
        
        
        #--------------
        #6º Box do desenvolvedor Luan
        box(
          status = "primary",
          solidHeader = TRUE,
          width = 6,
          tags$img(src="luan.png", class = "img-circle",
                   width = "200px", height = "200px"),
          
          #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",
          
          #Título com o nome da desenvolvedora
          h1(style="font-family: 'Times New Roman'; font-size: 20pt; 
             text-align: center; font-weight: bold;",
             "Luan Patrick Moura de Souza"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Descrição
          p(style= "font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;",
            "Universidade federal do Oeste do Pará - UFOPA Campus Monte Alegre"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/8643319250252707",
            style="font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;")
        ),
        
        
        
        #--------------
        #7º Box do desenvolvedor Daniel
        box(
          status = "primary",
          solidHeader = TRUE,
          width = 6,
          tags$img(src="daniel.png", class = "img-circle",
                   width = "200px", height = "200px"),
          
          #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",
          
          #Título com o nome da desenvolvedora
          h1(style="font-family: 'Times New Roman'; font-size: 20pt; 
             text-align: center; font-weight: bold;",
             "Daniel Pinto Siqueira"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Descrição
          p(style= "font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;",
            "Universidade federal do Oeste do Pará - UFOPA Campus Monte Alegre"),
          
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          
          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/3311133937308698",
            style="font-family: 'Times New Roman'; font-size: 15pt; 
             text-align: center;")
        ),
        
        
        
        #-------------
        #Imagens de apoiadores
        box(
          width = 6,
          status = "primary",
            solidHeader = TRUE,
          h1("Apoio", style= "font-family: 'Times New Roman';
           font-size: 40pt; text-align: center;font-weight: bold;"),
        
            #logo do Curso
          tags$img(src="logo_curso", class = "img-circle",
                   width = "280px", height = "280px"),
            #logo do Campus
          tags$img(src="logo_campus", class = "img-circle",
                   width = "280px", height = "280px"),
          style= "text-align: center;"
          )
       )
     )
   )
 )
)


server <- function(input, output) {
  
}

shinyApp(ui, server)







