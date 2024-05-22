library(shiny)
library(leaflet)
library(bslib)
library(wesanderson)
library(tidyverse)
library(RColorBrewer)
library(scales)
library(lattice)

# Source the external plots.R script
source("utils/plots.R")
# Load data
dataSites <- readRDS("data/data.rds")
df1 <- readRDS("data/df1.rds")
df2 <- readRDS("data/df2.rds")

# Choices for drop-downs
vars <- c("None" = "",
  "Level of integration",
  "Income Level",
  "HIV Prevalence"
)

####

ui <- navbarPage("TPT", id="nav",
                 tabPanel("Interactive map",
                          div(class="outer",
                              
                              tags$head(
                                includeCSS("styles.css")
                              ),
                              
                              leafletOutput("map", width="100%", height="100%"),
                              
                              absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                            draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                                            width = 630, height = "auto",
                                            div(class = "control-wrapper",
                                                selectInput("plotChoice", "Figure:",
                                                            choices = list("Population eligible for TPT" = "fig1", "Barriers for TPT" = "fig2")),
                                                selectInput("color", "Stratifying variable:", vars),
                                                actionButton("resetBtn", "Reset Plot"),
                                                style = "display: flex; align-items: center; justify-content: space-between;"
                                            ),
                                            uiOutput("plotOutput"))
                          ),
                          
                          #tags$div(id="cite",
                                #   'Data compiled for ', tags$em('Coming Apart: The State of White America, 1960–2010'), ' by Charles Murray (Crown Forum, 2012).'
                         # )
                 )
)


server <- function(input, output, session) {
  
  # Reactive value to store the selected record_id
  selectedRecordId <- reactiveVal(NULL)
  
  ## Interactive Map ###########################################
  
  # Create the map
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 17.5, lat = 0, zoom = 3)
  })
  
  # Observe map click events
  observeEvent(input$map_shape_click, {
    clickedId <- input$map_shape_click$id
    if (!is.null(clickedId) && clickedId %in% dataSites$record_id) {
      selectedRecordId(clickedId)
    } else {
      selectedRecordId(NULL)  # Explicitly reset on non-specific area click
    }
  })
  
  observeEvent(input$resetBtn, {
    selectedRecordId(NULL)  # Reset the selection when the reset button is clicked
  })
  
  output$plotOutput <- renderUI({
    if (input$plotChoice == "fig1") {
      plotOutput("fig1", height = 600)
    } else {
      plotOutput("fig2", height = 600)
    }
  })
  
  # Plot that updates based on interaction
  output$fig1 <- renderPlot({
    # Decide which data to use based on selectedRecordId
    if (is.null(selectedRecordId())) {
      dataToPlot <- df1
    } else {
      dataToPlot <- df1 %>% filter(record_id == selectedRecordId())
    }
    # Check if a selection has been made in the dropdown or pass an empty string if not
    strat_var <- ifelse(is.null(input$color) || input$color == "", "", input$color)
    
    # Call fig1 with the appropriate data
    fig1(dataToPlot, strat_var)
  })
  
  output$fig2 <- renderPlot({
    # Decide which data to use based on selectedRecordId
    if (is.null(selectedRecordId())) {
      dataToPlot <- df2
    } else {
      dataToPlot <- df2 %>% filter(record_id == selectedRecordId())
    }
    # Check if a selection has been made in the dropdown or pass an empty string if not
    strat_var <- ifelse(is.null(input$color) || input$color == "", "", input$color)
    
    # Call fig1 with the appropriate data
    fig2(dataToPlot, strat_var)
  })
  
  # This observer is responsible for maintaining the circles and legend,
  # according to the variables the user has chosen to map to color and size.
  observe({
    if (!is.null(input$color)) {
      zoom <- input$map_zoom
      radius <- ifelse(zoom < 5, 60000, 
                       ifelse(zoom < 8, 20000, 
                              ifelse(zoom < 11, 10000, 
                                     ifelse(zoom < 15, 1000, 500))))
      
      if (input$color == "") {
        # Set all points to black if no stratifying variable is selected
        leafletProxy("map", data = dataSites) %>%
          clearShapes() %>%
          addCircles(~longitude, ~latitude, radius=radius, layerId=~record_id,
                     stroke=FALSE, fillOpacity=0.6, fillColor="black")
      } else {
        # Check if the column exists and if it's a factor, then color accordingly
        if (!is.null(dataSites[[input$color]]) && is.factor(dataSites[[input$color]])) {
          colorData <- dataSites[[input$color]]
          pal <- colorFactor("viridis", levels = levels(colorData))
          
          leafletProxy("map", data = dataSites) %>%
            clearShapes() %>%
            addCircles(~longitude, ~latitude, radius=radius, layerId=~record_id,
                       stroke=FALSE, fillOpacity=0.6, fillColor=pal(colorData)) %>%
            addLegend("bottomleft", pal=pal, values=colorData, title=input$color,
                      layerId="colorLegend")
        }
      }
    }
  })
  

  

  # Show a popup at the given location
  showSitePopup <- function(record_id, lat, lng) {
    selectedSite <- dataSites[dataSites$record_id == record_id,]
    content <- as.character(tagList(
      tags$strong(HTML(sprintf("%s, %s",
                               selectedSite$name, selectedSite$Country))), tags$br(),
      sprintf("TPT provided in-house or at co-located TB clinic: %s", selectedSite$`TPT currently provided in-house or at co-located TB clinic`), tags$br(),
      sprintf("TB treatment for PLHIV: %s", selectedSite$`TB treatment for PLHIV`), tags$br(),
      sprintf("Level of integration: %s", selectedSite$`Level of integration`), tags$br(),
      sprintf("Anyone attended a formal training on TPT provision: %s", selectedSite$`Anyone attended a formal training on TPT provision`), tags$br(),

    ))
    leafletProxy("map", data = dataSites) %>% addPopups(lng, lat, content, layerId = record_id)
  }

  # When map is clicked, show a popup with city info
  observe({
    leafletProxy("map") %>% clearPopups()
    event <- input$map_shape_click
    print(event)
    if (is.null(event))
      return()
    
    isolate({
      showSitePopup(event$id, event$lat, event$lng)
    })
  })
  
}

shinyApp(ui = ui, server = server)
