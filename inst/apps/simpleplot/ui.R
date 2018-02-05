library(shiny)
library(ggplot2)
library(readxl)

# 
# dataSource <- read_excel("C:\\Users\\Rachel\\Documents\\AFIT Masters OR Program\\R Class\\Project\\dataSource_r2.xlsx", sheet = "CONUS Data", range = "c3:iq514")
# 
devtools::use_data(dataSource)
# 
data(dataSource)

# dataSource <- as.data.frame(dataSource)


# Define UI for application that plots features of movies
ui <- fluidPage(
  
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    
    # Inputs
    sidebarPanel(
      
      # Select variable for y-axis
      selectInput(inputId = "y", 
                  label = "Y-axis:",
                  choices = colnames(dataSource), 
                  selected = "L90f1"),
      
      # Select variable for x-axis
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = colnames(dataSource), 
                  selected = "siteID"),  
      
      # Select variable for x-axis
      selectInput(inputId = "z", 
                  label = "Color by:",
                  choices = colnames(dataSource), 
                  selected = "LCLUCI")  
    ),
    
    # Outputs
    mainPanel(
     
        
        plotOutput(outputId = "scatterplot", brush = "plot_brush"),
        textOutput(outputId = "correlation"),
        dataTableOutput(outputId = "table"))
    )
    
    
    
  )
