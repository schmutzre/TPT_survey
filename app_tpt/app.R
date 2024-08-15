library(shiny)
library(leaflet)
library(bslib)
library(wesanderson)
library(tidyverse)
library(RColorBrewer)
library(scales)
library(lattice)
library(shinyBS)
library(plotly)
library(shinythemes)

# Source the external plots.R script
source("utils/plots.R")
# Load data
#datacheck <- readRDS("app_tpt/data/data.rds")
dataSites <- readRDS("data/data.rds")

df1 <- readRDS("data/df1.rds")
df2 <- readRDS("data/df2.rds")
df3 <- readRDS("data/df3.rds")

# Choices for drop-downs
vars <- c("None", 
          "Region",
          "Level of integrated TB/HIV services",
          "Income Level",
          "HIV Prevalence",
          "High burden country")

vars_plot <- c("None", 
               "Region",
               "Sub-region Africa",
               "Level of integrated TB/HIV services",
               "Income Level",
               "HIV Prevalence",
               "High burden country")

ui <- navbarPage("TPT", id="nav",
                 theme = shinytheme("readable"),
                 div(class = "logo-container",
                     tags$img(src = "logo1.png", height = "40px", style = "margin-right: 10px;"),
                     tags$img(src = "logo3.png", height = "50px"),
                     style = "position: absolute; top: 5px; right: 10px; z-index: 1000;"
                 ),
                 tabPanel("Map",
                          div(class="outer",
                              tags$head(
                                includeCSS("styles.css"),
                                tags$style(HTML("
                                  table {
                                    width: 100%;
                                    border-collapse: collapse;
                                    font-family: Arial, sans-serif;
                                  }
                                  th, td {
                                    padding: 12px;
                                    text-align: left;
                                    border-bottom: 1px solid #ddd;
                                  }
                                  th {
                                    background-color: #f2f2f2;
                                    color: #333;
                                  }
                                  tr:hover {
                                    background-color: #f5f5f5;
                                  }
                                  .info-box {
                                    display: flex;
                                    align-items: center;
                                    background-color: #f9f9f9;
                                    border: 1px solid #ddd;
                                    border-radius: 5px;
                                    padding: 10px;
                                    margin-bottom: 15px;
                                    color: #333;
                                  }
                                  .info-box-icon {
                                    font-size: 24px;
                                    margin-right: 10px;
                                    color: #5bc0de;
                                  }
                                  .info-box-text {
                                    font-size: 16px;
                                    font-weight: bold;
                                  }
                                "))
                              ),
                              leafletOutput("map", width="100%", height="100%"),
                              absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                            draggable = TRUE, top = "10%", left = "auto", right = "2%", bottom = "auto",
                                            width = "20%", maxWidth = "300px", height = "auto",
                                            div(class = "control-wrapper",
                                                selectInput("color", "Coloring:", vars),
                                                style = "display: flex; align-items: center; justify-content: space-between;"
                                            ),
                                            actionButton("showIntro", "Show Introduction")  # Add button to show modal
                              )
                          )
                 ),
                 tabPanel("People eligible for TPT",
                          fluidPage(
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("colorPlot1", "Stratifying variable:", vars_plot),
                                uiOutput("text1")  # Use uiOutput here
                              ),
                              mainPanel(
                                div(class = "info-box",
                                    div(class = "info-box-icon",
                                        icon("info-circle")),
                                    div(class = "info-box-text",
                                        "Hover over the plot to see details about the responses.")
                                ),
                                plotlyOutput("fig1", height = 600)
                              )
                            )
                          )
                 ),
                 tabPanel("Barriers for TPT",
                          fluidPage(
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("colorPlot2", "Stratifying variable:", vars_plot),
                                uiOutput("text2")
                              ),
                              mainPanel(
                                div(class = "info-box",
                                    div(class = "info-box-icon",
                                        icon("info-circle")),
                                    div(class = "info-box-text",
                                        "Hover over the plot to see details about the responses.")
                                ),
                                plotlyOutput("fig2", height = 600)
                              )
                            )
                          )
                 ),
                 tabPanel("TPT Treatment regimens",
                          fluidPage(
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("colorPlot3", "Stratifying variable:", vars_plot),
                                uiOutput("text3")
                              ),
                              mainPanel(
                                div(class = "info-box",
                                    div(class = "info-box-icon",
                                        icon("info-circle")),
                                    div(class = "info-box-text",
                                        "Hover over the plot to see details about the responses.")
                                ),
                                plotlyOutput("fig3", height = 600)
                              )
                            )
                          )
                 )
)


#### Server Code

server <- function(input, output, session) {
  
  # Function to show the modal dialog
  showIntroModal <- function() {
    showModal(modalDialog(
      title = "Welcome to the TPT Survey App",
      tags$p("Provision of TB preventive therapy (TPT) is recommended by WHO to achieve the End TB Strategy targets. We determined the access to and use of TPT services at HIV clinics in low- and middle-income countries (LMICs), three years after the launch of updated WHO guidance on TPT use."),
      tags$p("This application allows you to explore the survey data in detail. The main functionalities include:"),
      tags$ul(
        tags$li("Map: Use the map to select individual sites by clicking on them. Once a site is selected, a pop-up will give you the opportunity to display detailed information about the characteristics of the clinic and about TPT provision at that clinic. The map also allows you to color the sites by different variables such as 'Level of integration', 'Income Level', and 'HIV Prevalence'."),
        tags$li("People eligible for TPT: This page provides a plot displaying an aggregated overview of the eligibility of TPT for different groups at risk."),
        tags$li("Barriers: This page displays a plot of the barriers to TPT implementation at various sites."),
        tags$li("Treatment regimens: This page shows the different treatment regimens used for TPT across the sites.")
      ),
      tags$p("We hope this application helps you gain valuable insights into the implementation and challenges of TPT services in LMICs."),
      easyClose = TRUE,
      footer = modalButton("Close")
    ))
  }
  
  # Show the modal when the app starts
  showIntroModal()
  
  # Show the modal when the button is clicked
  observeEvent(input$showIntro, {
    showIntroModal()
  })
  
  # Reactive value to store the selected record_id
  selectedRecordId <- reactiveVal(NULL)
  
  ## Interactive Map ###########################################
  
  # Create the map
  output$map <- renderLeaflet({
    leaflet(dataSites) %>%
      addTiles() %>%
      setView(lng = 17.5, lat = 0, zoom = 3)
  })
  
  # This observer is responsible for maintaining the circles and legend,
  # according to the variables the user has chosen to map to color.
  observe({
    if (!is.null(input$color)) {
      zoom <- input$map_zoom
      radius <- ifelse(zoom < 5, 60000, 
                       ifelse(zoom < 8, 20000, 
                              ifelse(zoom < 11, 10000, 
                                     ifelse(zoom < 15, 1000, 500))))
      
      if (input$color == "None") {
        # Set all points to black if no stratifying variable is selected
        leafletProxy("map", data = dataSites) %>%
          clearShapes() %>%
          addCircles(~longitude, ~latitude, radius=radius, layerId=~record_id,
                     stroke=FALSE, fillOpacity=0.6, fillColor="black",
                     label = ~paste(name, country))
      } else {
        # Check if the column exists and if it's a factor, then color accordingly
        if (!is.null(dataSites[[input$color]]) && is.factor(dataSites[[input$color]])) {
          colorData <- dataSites[[input$color]]
          pal <- colorFactor("viridis", levels = levels(colorData))
          
          leafletProxy("map", data = dataSites) %>%
            clearShapes() %>%
            addCircles(~longitude, ~latitude, radius=radius, layerId=~record_id,
                       stroke=FALSE, fillOpacity=0.6, fillColor=pal(colorData),
                       label = ~paste(name, country)) %>%
            addLegend("bottomleft", pal=pal, values=colorData, title=input$color,
                      layerId="colorLegend")
        }
      }
    }
  })
  
  # Observe map click events
  observeEvent(input$map_shape_click, {
    clickedId <- input$map_shape_click$id
    if (!is.null(clickedId) && clickedId %in% dataSites$record_id) {
      selectedSite <- dataSites %>% filter(record_id == clickedId)
      selectedRecordId(clickedId)
      output$siteInfo <- renderUI({
        tagList(
          h4("Site Information"),
          tags$p(paste("Name:", selectedSite$name)),
          tags$p(paste("Country:", selectedSite$country))
        )
      })
    } else {
      selectedRecordId(NULL)  # Explicitly reset on non-specific area click
    }
  })
  
  # Helper function to render grouped tables
  renderGroupedTable <- function(data, group_var, question_var, answer_var) {
    data[[answer_var]] <- as.character(data[[answer_var]]) # Ensure category column is character
    group_levels <- unique(data[[group_var]])
    html <- ""
    
    for (group in group_levels) {
      group_data <- data[data[[group_var]] == group, ]
      html <- paste0(html, "<tr><th colspan='2'>", group, "</th></tr>")
      for (i in 1:nrow(group_data)) {
        html <- paste0(html, "<tr><td>", group_data[i, question_var], "</td><td>", group_data[i, answer_var], "</td></tr>")
      }
    }
    html
  }
  
  # Helper function to render ungrouped tables
  renderUngroupedTable <- function(data, question_var, answer_var) {
    data[[answer_var]] <- as.character(data[[answer_var]]) # Ensure category column is character
    data[[question_var]] <- as.character(data[[question_var]]) # Ensure category column is character
    html <- ""
    for (i in 1:nrow(data)) {
      html <- paste0(html, "<tr><td>", data[i, question_var], "</td><td>", data[i, answer_var], "</td></tr>")
    }
    html
  }
  
  # When map is clicked, show a popup with site info and open a modal with detailed plot
  observe({
    leafletProxy("map") %>% clearPopups()
    event <- input$map_shape_click
    if (is.null(event))
      return()
    
    isolate({
      showModal(modalDialog(
        title = tagList(
          tags$p(paste("Name:", dataSites[dataSites$record_id == event$id, "name"])),
          tags$p(paste("Country:", dataSites[dataSites$record_id == event$id, "country"]))
        ),
        selectInput("infoType", "Select Information Type for this clinic", choices = c("Site Characteristics", "People eligible for TPT", "Barriers for TPT", "Treatments offered")),
        uiOutput("siteDetails"),
        easyClose = TRUE,
        footer = modalButton("Close")
      ))
    })
  })
  
  # Render the selected information based on dropdown selection
  output$siteDetails <- renderUI({
    req(selectedRecordId())
    
    if (input$infoType == "Site Characteristics") {
      selectedSite <- dataSites %>% filter(record_id == selectedRecordId())
      siteData <- data.frame(
        variable = c("Population the center serves", "Facility location", "Level of integrated TB/HIV services", "Anyone attended a formal training on TPT provision", "Facility level of care"),
        category = c(selectedSite$`Population the center serves`, selectedSite$`Facility location`, selectedSite$`Level of integrated TB/HIV services`, selectedSite$`Anyone attended a formal training on TPT provision`, selectedSite$`Facility level of care`)
      )
      tagList(
        tags$table(style = "width:100%; border-collapse: collapse;",
                   tags$tbody(
                     HTML(renderUngroupedTable(siteData, "variable", "category"))
                   )
        )
      )
    } else if (input$infoType == "People eligible for TPT") {
      selectedInfo <- df1 %>% filter(record_id == selectedRecordId())
      tagList(
        tags$table(style = "width:100%; border-collapse: collapse;",
                   tags$tbody(
                     HTML(renderGroupedTable(selectedInfo, "who_group", "variable", "category"))
                   )
        )
      )
    } else if (input$infoType == "Barriers for TPT") {
      selectedInfo <- df2 %>% filter(record_id == selectedRecordId())
      tagList(
        tags$table(style = "width:100%; border-collapse: collapse;",
                   tags$tbody(
                     HTML(renderUngroupedTable(selectedInfo, "variable", "category"))
                   )
        )
      )
    } else if (input$infoType == "Treatments offered") {
      selectedInfo <- df3 %>% filter(record_id == selectedRecordId())
      tagList(
        tags$table(style = "width:100%; border-collapse: collapse;",
                   tags$tbody(
                     HTML(renderUngroupedTable(selectedInfo, "variable", "category"))
                   )
        )
      )
    }
  })
  
  ## Data Visualization ########################################
  
  # Plot for "People eligible for TPT" tab
  output$fig1 <- renderPlotly({
    strat_var <- ifelse(input$colorPlot1 == "None", "", input$colorPlot1)
    fig1(df1, strat_var)
  })
  
  # Plot for "Barriers" tab
  output$fig2 <- renderPlotly({
    strat_var <- ifelse(input$colorPlot2 == "None", "", input$colorPlot2)
    fig2(df2, strat_var)
  })
  
  # Plot for "Treatment regimens" tab
  output$fig3 <- renderPlotly({
    strat_var <- ifelse(input$colorPlot3 == "None", "", input$colorPlot3)
    fig3(df3, strat_var)
  })
  
  # Text output for "People eligible for TPT" tab
  output$text1 <- renderUI({
    HTML("
    <p>Identifying populations (unlikely to have active TB) eligible to receive TPT at HIV clinic or colocated TB clinic. Since 2020, the WHO updated guidance on TB prevention recommends TPT for three main groups of individuals:</p>
    <ol>
      <li>PLWH unlikely to have active TB, irrespective of their age and degree of immunosuppression, even if LTBI testing is unavailable;</li>
      <li>Children or high-risk household contacts exposed to a person with active TB, regardless of their HIV status;</li>
      <li>Other people at risk, including people on anti-TNF immunosuppressive therapy or on dialysis, prisoners or health care workers in high TB burden settings.</li>
    </ol>
    <p>Yet, the implementation of TPT in practice remains largely unknown, especially in countries with high TB and HIV incidences. Here, we examined the access to and use of TPT in a global sample of HIV care clinics in LMICs. Specifically, we focused on the implementation of the WHO recommendations to provide TPT to high-risk populations, and determined the availability of different TPT regimens.</p>
  ")
  })
  
  # Text output for "Barriers" tab
  output$text2 <- renderUI({
    HTML("
    <p>Identifying barriers preventing clinics to provide TPT:</p>
  ")
  })
  
  # Text output for "Treatment regimens" tab
  output$text3 <- renderUI({
    HTML("
    <p>Identifying the frequency of treatment use:</p>
    
    <p> The clinical efficacy and cost-effectiveness of TPT is established, either using longer 6–12-month isoniazid-based TPT, or shorter 1–3-month rifamycin-containing regimens. Short course TPT regimens have the advantage to be less toxic than longer isoniazid monotherapy, thus decreasing adverse events and improving treatment completion. <p>
  ")
  })
}

shinyApp(ui = ui, server = server)
