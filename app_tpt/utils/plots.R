################################################################################
#' This file includes plotting helper functions 
################################################################################

reverse_legend_labels <- function(plotly_plot) {
  n_labels <- length(plotly_plot$x$data)
  plotly_plot$x$data[1:n_labels] <- plotly_plot$x$data[n_labels:1]
  plotly_plot
}

#### Figure 1 ------------------------------------------------------------------

library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)
library(wesanderson)  
library(plotly)
library(ggh4x)

fig1 <- function(data, stratifying_var1, stratifying_var2=NULL, site = NULL) {
  
  lvl <- c("Don't know", "No", "Yes")
  
  custom_colors <- c(
    "Don't know" = "#d3d3d3",            
    "No" = wes_palette("GrandBudapest1")[2],  
    "Yes" = wes_palette("GrandBudapest2")[4])
  
  # Filter the dataframe if the first stratifying variable is "Sub-region Africa"
  if (stratifying_var1 == "Sub-region Africa") {
    data <- data %>% filter(Region == "Africa")
  }
  
  if (stratifying_var1 == "High TB burden country") {
    stratifying_var1 <- "High burden country" 
  }
  
  # Apply similar logic for stratifying_var2 if needed (optional, depends on your dataset)
  if (stratifying_var2 == "Sub-region Africa") {
      data <- data %>% filter(Region == "Africa")
    }
    
  if (stratifying_var2 == "High TB burden country") {
      stratifying_var2 <- "High burden country"
    }
  
  # Group and summarize the data
  df_main <- data %>%
    group_by(who_group, variable, !!sym(stratifying_var1), !!sym(stratifying_var2)) %>%
    summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      "Don't know" = sum(category == "Don't know"),
      total = n(),
      .groups = 'drop'
    ) %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total,
           prop_no = No / total,
           prop_dont = `Don't know` / total) %>%
    pivot_longer(cols = c("Yes", "No", "Don't know"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response),
           prop = case_when(response == "Yes" ~ prop_yes,
                            response == "No" ~ prop_no,
                            response == "Don't know" ~ prop_dont,
                            TRUE ~ NA)) 
  
  df_main$response <- factor(df_main$response, 
                             levels = c("Yes", "No", "Don't know"))
  
  # Check if both stratifying_var1 and stratifying_var2 are non-empty
  if (stratifying_var1 != "" && stratifying_var2 != "") {
    breaks <- c(0.05, 0.5, 0.9)  # Use these breaks when both variables are non-empty
  } else if (stratifying_var1 != "" || stratifying_var2 != "") {
    breaks <- c(0.02, 0.5, 0.95)  # Use these breaks when only one variable is non-empty
  } else {
    breaks <- c(0, 0.5, 1)  # Use these breaks when both variables are empty
  }
  
  # Generate the plot with combined faceting using facet_grid2
  p <- df_main %>% 
    ggplot(aes(y = reorder(variable, prop_yes), 
               fill = factor(response, levels = lvl, exclude = NULL), 
               by = variable, weight = count,
               text = paste("Response:", response, "<br>",
                            "Count:", count, "<br>",
                            "Proportion of clinics:", round(prop * 100, 0), "%"))) +
    geom_bar(position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)") +
    theme_minimal() +
    facet_grid2(
      rows = vars(who_group),
      cols =  vars(!!sym(stratifying_var1),!!sym(stratifying_var2)),  # Combine both stratifying variables
      scales = "free", 
      space = "free", 
      labeller = label_wrap_gen(width = 14)) +
    theme(
      axis.text.y = element_text(hjust = 1, size = 12),
      legend.position = "bottom",
      panel.spacing.x = unit(.08, "lines"),
      plot.title = element_text(size = 12),
      plot.subtitle = element_text(size = 12),
      axis.title = element_text(size = 12),
      axis.text = element_text(size = 12),
      strip.text = element_text(size = 12),
      legend.text = element_text(size = 12), 
      plot.margin = margin(90, 40, 60, 0, unit = "pt")) + 
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know"),
      name = NULL) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = c(0,50, 100), breaks = breaks) +
    geom_vline(xintercept = 0.25, linetype = "dotted", color = "white")+
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")+
    geom_vline(xintercept = 0.75, linetype = "dotted", color = "white")
  
  # Convert to an interactive Plotly plot
  p = ggplotly(p, tooltip = "text") %>% 
    layout(legend = list(x = 0.35, 
                         y = -0.2, 
                         orientation = "h"),
           margin = list(t=100)) %>% 
    reverse_legend_labels()

  nl1 <- nlevels(factor(df_main[[stratifying_var1]]))
  nl2 <- nlevels(factor(df_main[[stratifying_var2]]))

  if (stratifying_var2 == "") {
    nl <- nl1
  }
  if (stratifying_var1 == "") {
    nl <- nl2
  }
  if (stratifying_var1 != "" & stratifying_var2 != "") {
    df_main <- df_main %>%
      mutate(combined_factor = paste(!!sym(stratifying_var1), !!sym(stratifying_var2), sep = " - "))

    nl <- nlevels(factor(df_main$combined_factor))
  }

  p$x$layout$yaxis3$domain <- c(0, 11/19)  # Adjust bottom block
  p$x$layout$yaxis2$domain <- c(11/19, 15/19)  # Adjust middle block
  p$x$layout$yaxis$domain <- c(15/19, 1)  # Adjust top block

  # Adjust annotations based on total number of facets
  p$x$layout$annotations[[2 + nl]]$y <- 1 - (1 - 15/19) / 2  # Midpoint of the bottom domain
  p$x$layout$annotations[[3 + nl]]$y <- 15/19 - (15/19 - 11/19) / 2  # Midpoint of the middle domain
  p$x$layout$annotations[[4 + nl]]$y <- 11/19 - (11/19 - 0) / 2  # Midpoint of the top domain
  
  return(p)
  
}

fig1_small <- function(data, stratifying_var, site = NULL) {
  
  lvl <- c("Don't know", "No", "Yes")
  
  custom_colors <- c(
    "Don't know" = "#d3d3d3",            
    "No" = wes_palette("GrandBudapest1")[2],  
    "Yes" = wes_palette("GrandBudapest2")[4])
  
  # Filter the dataframe if site is provided
  if (stratifying_var == "Sub-region Africa") {
    
    data <- data %>% 
      filter(Region == "Africa") 
  }
  
  else{ #else data should just stay the same
    data <- data
  }
  
  df_main <- data %>%
    group_by(who_group, variable, !!sym(stratifying_var)) %>%
    summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      "Don't know" = sum(category == "Don't know"),
      total = n(),
      .groups = 'drop') %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total,
           prop_no = No / total,
           prop_dont = `Don't know` / total) %>%
    pivot_longer(cols = c("Yes", "No", "Don't know"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response),
           prop = case_when(response == "Yes"~ prop_yes,
                            response == "No" ~ prop_no,
                            response == "Don't know" ~ prop_dont,
                            TRUE ~ NA)) 
  
  p <- df_main %>% 
    ggplot(aes(y = reorder(variable, prop_yes), 
               fill = factor(response, levels = lvl, exclude = NULL), 
               by = variable, weight = count,
               text = paste("Response:",response, "<br>",
                            "Count:",count, "<br>",
                            "Proportion:",round(prop * 100, 0), "%"))) +
    geom_bar(position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)") +
    theme_minimal() +
    facet_grid(
      rows = vars(who_group), 
      cols = vars(!!sym(stratifying_var)), 
      scales = "free_y", 
      space = "free", 
      labeller = label_wrap_gen(width = 14)) +
    theme(
      axis.text.y = element_text(hjust = 1, size = 8),
      legend.position = "none",
      panel.spacing.x = unit(.5, "lines"),
      plot.title = element_text(size = 8),
      plot.subtitle = element_text(size = 8),
      axis.title = element_text(size = 8),
      axis.text = element_text(size = 8),
      strip.text = element_text(size = 8),
      legend.text = element_text(size = 8),
      plot.margin = margin(10, 50, 10, 10)) +
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know"),
      name = NULL) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2)),
      breaks = c(0, 0.5, 1)) +
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")
  
  p = ggplotly(p, tooltip = "text")  
  
  nl <- nlevels(factor(df_main[[stratifying_var]]))
  
  p$x$layout$yaxis3$domain <- c(0, 11/19)   # 1 block in bottom chunks
  p$x$layout$yaxis2$domain <- c(11/19, 15/19) # 3 in mid group
  p$x$layout$yaxis$domain <- c(15/19, 1)    # remaining space
  
  p$x$layout$annotations[[2+nl]]$y <- 1 - (1 - 15/19) / 2  # Midpoint of the bottom domain
  p$x$layout$annotations[[3+nl]]$y <- 15/19 - (15/19 - 11/19) / 2  # Midpoint of the middle domain
  p$x$layout$annotations[[4+nl]]$y <- 11/19 - (11/19 - 0) / 2  
  
  p
  
}

#### Figure 2 ------------------------------------------------------------------

fig2 <- function(data, stratifying_var1, stratifying_var2=NULL, site = NULL) {

  lvl <- c("No", "Yes")
  
  custom_colors <- c(
    "No" = wes_palette("GrandBudapest1")[2],  
    "Yes" = wes_palette("GrandBudapest2")[4])
  
  if (stratifying_var1 == "Sub-region Africa") {
    data <- data %>% filter(Region == "Africa")
  }
  
  if (stratifying_var1 == "High TB burden country") {
    stratifying_var1 <- "High burden country" 
  }
  
  # Apply similar logic for stratifying_var2 if needed (optional, depends on your dataset)
  if (stratifying_var2 == "Sub-region Africa") {
    data <- data %>% filter(Region == "Africa")
  }
  
  if (stratifying_var2 == "High TB burden country") {
    stratifying_var2 <- "High burden country"
  }
  
  else{ #else data should just stay the same
    data <- data
  }
  
  df_main <- data %>%
    group_by(variable, !!sym(stratifying_var1), !!sym(stratifying_var2)) %>%
    summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      total = n(),
      .groups = 'drop') %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total,
           prop_no = No / total) %>%
    pivot_longer(cols = c("Yes", "No"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response),
           prop = case_when(response == "Yes"~ prop_yes,
                            response == "No" ~ prop_no,
                            TRUE ~ NA)) 
  
  # Check if both stratifying_var1 and stratifying_var2 are non-empty
  if (stratifying_var1 != "" && stratifying_var2 != "") {
    breaks <- c(0.05, 0.5, 0.9)  # Use these breaks when both variables are non-empty
  } else if (stratifying_var1 != "" || stratifying_var2 != "") {
    breaks <- c(0.02, 0.5, 0.95)  # Use these breaks when only one variable is non-empty
  } else {
    breaks <- c(0, 0.5, 1)  # Use these breaks when both variables are empty
  }
  
  p <- df_main %>% 
    ggplot(aes(y = variable, 
               fill = factor(response, levels = lvl, exclude = NULL), 
               by = variable, weight = count,
               text = paste("Response:",response, "<br>",
                                                         "Count:",count, "<br>",
                                                         "Proportion:",round(prop * 100, 0), "%"))) +
    geom_bar(position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)"
    ) +
    theme_minimal() +
    facet_grid(cols = vars(!!sym(stratifying_var1), !!sym(stratifying_var2)),
               labeller = label_wrap_gen(width = 14),
               scales = "free", 
               space = "free") +
    theme(
      axis.text.y = element_text(hjust = 1, size = 12),
      legend.position = "bottom",
      panel.spacing.x = unit(.04, "lines"),
      plot.title = element_text(size = 12),
      plot.subtitle = element_text(size = 12),
      axis.title = element_text(size = 12),
      axis.text = element_text(size = 12),
      strip.text = element_text(size = 12),
      legend.text = element_text(size = 12),
      plot.margin = margin(c(90, 40, 60, 0))) +
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know", "Not available"),
      name = NULL
    ) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = c(0,50, 100), breaks = breaks) +
    geom_vline(xintercept = 0.25, linetype = "dotted", color = "white")+
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")+
    geom_vline(xintercept = 0.75, linetype = "dotted", color = "white")
  
  ggplotly(p, tooltip = "text") %>% 
    layout(legend = list(x = 0.44, 
                         y = -0.2, 
                         orientation = "h"),
           margin = list(t=100)) %>% 
    reverse_legend_labels()
  
}

fig2_small <- function(data, stratifying_var, site = NULL) {
  
  lvl <- c("No", "Yes")
  
  custom_colors <- c(
    "No" = wes_palette("GrandBudapest1")[2],  
    "Yes" = wes_palette("GrandBudapest2")[4])
  
  # Filter the dataframe if site is provided
  if (stratifying_var == "Sub-region Africa") {
    
    data <- data %>% 
      filter(Region == "Africa") 
  }
  
  else{ #else data should just stay the same
    data <- data
  }
  
  df_main <- data %>%
    group_by(variable, !!sym(stratifying_var)) %>%
    summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      total = n(),
      .groups = 'drop') %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total,
           prop_no = No / total) %>%
    pivot_longer(cols = c("Yes", "No"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response),
           prop = case_when(response == "Yes"~ prop_yes,
                            response == "No" ~ prop_no,
                            TRUE ~ NA)) 
  
  p <- df_main %>% 
    ggplot(aes(y = variable, 
               fill = factor(response, levels = lvl, exclude = NULL), 
               by = variable, weight = count,
               text = paste("Response:",response, "<br>",
                            "Count:",count, "<br>",
                            "Proportion:",round(prop * 100, 0), "%"))) +
    geom_bar(position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)"
    ) +
    theme_minimal() +
    facet_grid(cols = vars(!!sym(stratifying_var)),
               labeller = label_wrap_gen(width = 14)) +
    theme(
      axis.text.y = element_text(hjust = 1, size = 8),
      legend.position = "none",
      panel.spacing.x = unit(1, "lines"),
      plot.title = element_text(size = 8),
      plot.subtitle = element_text(size = 8),
      axis.title = element_text(size = 8),
      axis.text = element_text(size = 8),
      strip.text = element_text(size = 8),
      legend.text = element_text(size = 8),
      plot.margin = unit(c(1, 1, 1, 1), "lines")) +
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know", "Not available"),
      name = NULL
    ) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2)),
      breaks = c(0, 0.5, 1)
    ) +
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")
  
  ggplotly(p, tooltip = "text")
  
}

#### Figure 3 ------------------------------------------------------------------

fig3 <- function(data, stratifying_var1, stratifying_var2, site = NULL) {

  lvl <- c("Don't know", "Not offered", "Children", "Adults", "Adults & Children")
  lvl_rev <- c("Adults & Children", "Adults", "Children", "Not offered", "Don't know")
  
  custom_colors <- c("Adults & Children" = "#8ac0ff",  
                     "Adults" = "#abe1ff",  
                     "Children" = "#d0f2ff",  
                     "Not offered" = "#fde9d8",  
                     "Don't know" = "#d3d3d3")
  
  # Filter the dataframe if site is provided
  if (stratifying_var1 == "Sub-region Africa") {
    
    data <- data %>% 
      filter(Region == "Africa") 
  }
  
  if (stratifying_var1 == "High TB burden country") {
    
    stratifying_var1 <- "High burden country" 
  }
  
  if (stratifying_var2 == "Sub-region Africa") {
    
    data <- data %>% 
      filter(Region == "Africa") 
  }
  
  if (stratifying_var2 == "High TB burden country") {
    
    stratifying_var2 <- "High burden country" 
  }
  
  else{ #else data should just stay the same
    data <- data
  }
  
  # Check if both stratifying_var1 and stratifying_var2 are non-empty
  if (stratifying_var1 != "" && stratifying_var2 != "") {
    breaks <- c(0.05, 0.5, 0.9)  # Use these breaks when both variables are non-empty
  } else if (stratifying_var1 != "" || stratifying_var2 != "") {
    breaks <- c(0.02, 0.5, 0.95)  # Use these breaks when only one variable is non-empty
  } else {
    breaks <- c(0, 0.5, 1)  # Use these breaks when both variables are empty
  }
  
  df_main <- data %>% 
    group_by(variable, !!sym(stratifying_var1), !!sym(stratifying_var2)) %>% 
    summarize(
      Adults = sum(category == "Adults"),
      Children = sum(category == "Children"),
      `Adults & Children` = sum(category == "Adults & Children"),
      `Don't know` = sum(category == "Don't know"),
      `Not offered` = sum(category == "Not offered"),
      total = n(),
      .groups = 'drop') %>% 
    ungroup() %>%
    mutate(prop_Adults = Adults / total,
           prop_Children = Children / total,
           prop_AdChild = `Adults & Children`/total,
           prop_dont = `Don't know`/total,
           prop_none = `Not offered`/total) %>% 
    pivot_longer(cols = c("Adults", "Children", "Adults & Children", "Don't know", "Not offered"), names_to = "response",
                 values_to = "count") %>% 
    mutate(response = as.factor(response),
           prop = case_when(response == "Adults"~ prop_Adults,
                            response == "Children" ~ prop_Children,
                            response == "Adults & Children" ~ prop_AdChild,
                            response == "Don't know" ~ prop_dont,
                            TRUE ~ prop_none)) %>% 
    left_join(data %>% dplyr::select(variable, Regimen), by = "variable", relationship = "many-to-many") %>% 
    mutate(variable = str_wrap(variable, width = 40))
  
  p <- df_main %>% 
    ggplot(aes(y = reorder(variable, prop_none), 
               fill = factor(response, levels = lvl, exclude = NULL),
               by = variable, weight = count,
               text = paste("Response:",response, "<br>",
                            "Count:",count, "<br>",
                            "Proportion:",round(prop * 100, 0), "%"))) +
    geom_bar(position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)") +
    theme_minimal() +
    facet_grid(
      rows = vars(Regimen), 
      cols = vars(!!sym(stratifying_var1), !!sym(stratifying_var2)),
      labeller = label_wrap_gen(width = 14),
      scales = "free", 
      space = "free") +
    theme(
      axis.text.y = element_text(hjust = 1, size = 12),
      legend.position = "bottom",
      panel.spacing.x = unit(.04, "lines"),
      legend.key.size = unit(0.3, "cm"),
      plot.title = element_text(size = 12),
      plot.subtitle = element_text(size = 12),
      axis.title = element_text(size = 12),
      axis.text = element_text(size = 12),
      strip.text = element_text(size = 12),
      legend.text = element_text(size = 12),
      plot.margin = margin(90, 40, 60, 0, unit = "pt")) +
    scale_fill_manual(
      values = custom_colors,
      breaks = lvl_rev,
      name = NULL) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = c(0,50, 100), breaks = breaks) +
    geom_vline(xintercept = 0.25, linetype = "dotted", color = "white")+
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")+
    geom_vline(xintercept = 0.75, linetype = "dotted", color = "white")

  p = ggplotly(p, tooltip = "text") %>% 
    layout(legend = list(x = 0.15, 
                         y = -0.2, 
                         orientation = "h"),
           margin = list(t=100)) %>% 
    reverse_legend_labels()
  
  nl1 <- nlevels(factor(df_main[[stratifying_var1]])) 
  nl2 <- nlevels(factor(df_main[[stratifying_var2]]))
  
  if (stratifying_var2 == "") {
    nl <- nl1
  }
  if (stratifying_var1 == "") {
    nl <- nl2
  }
  if (stratifying_var1 != "" & stratifying_var2 != "") {
    df_main <- df_main %>% 
      mutate(combined_factor = paste(!!sym(stratifying_var1), !!sym(stratifying_var2), sep = " - "))
    
    nl <- nlevels(factor(df_main$combined_factor))
  }
  
  p$x$layout$yaxis2$domain <- c(0, 1/2)   # 1 block in bottom chunks
  p$x$layout$yaxis$domain <- c(1/2, 1) # 3 in mid group
  
  p$x$layout$annotations[[2+nl]]$y <- 1 - (1 - 1/2) / 2  # Midpoint of the top domain
  p$x$layout$annotations[[3+nl]]$y <- 1/2 - (1 - 1/2) / 2  # Midpoint of the middle domain
  
  p
  
}

fig3_small <- function(data, stratifying_var, site = NULL) {
  
  lvl <- c("Don't know", "Not offered", "Children", "Adults", "Adults & Children")
  lvl_rev <- c("Adults & Children", "Adults", "Children", "Not offered", "Don't know")
  
  custom_colors <- c("Adults & Children" = "#8ac0ff",  
                     "Adults" = "#abe1ff",  
                     "Children" = "#d0f2ff",  
                     "Not offered" = "#fde9d8",  
                     "Don't know" = "#d3d3d3")
  
  # Filter the dataframe if site is provided
  if (stratifying_var == "Sub-region Africa") {
    
    data <- data %>% 
      filter(Region == "Africa") 
  }
  
  else{ #else data should just stay the same
    data <- data
  }
  
  df_main <- data %>% 
    group_by(variable, !!sym(stratifying_var)) %>% 
    summarize(
      Adults = sum(category == "Adults"),
      Children = sum(category == "Children"),
      `Adults & Children` = sum(category == "Adults & Children"),
      `Don't know` = sum(category == "Don't know"),
      `Not offered` = sum(category == "Not offered"),
      total = n(),
      .groups = 'drop') %>% 
    ungroup() %>%
    mutate(prop_Adults = Adults / total,
           prop_Children = Children / total,
           prop_AdChild = `Adults & Children`/total,
           prop_dont = `Don't know`/total,
           prop_none = `Not offered`/total) %>% 
    pivot_longer(cols = c("Adults", "Children", "Adults & Children", "Don't know", "Not offered"), names_to = "response",
                 values_to = "count") %>% 
    mutate(response = as.factor(response),
           prop = case_when(response == "Adults"~ prop_Adults,
                            response == "Children" ~ prop_Children,
                            response == "Adults & Children" ~ prop_AdChild,
                            response == "Don't know" ~ prop_dont,
                            TRUE ~ prop_none)) %>% 
    left_join(data %>% dplyr::select(variable, Regimen), by = "variable", relationship = "many-to-many") %>% 
    mutate(variable = str_wrap(variable, width = 40))
  
  p <- df_main %>% 
    ggplot(aes(y = reorder(variable, -prop_none), 
               fill = factor(response, levels = lvl, exclude = NULL),
               by = variable, weight = count,
               text = paste("Response:",response, "<br>",
                            "Count:",count, "<br>",
                            "Proportion:",round(prop * 100, 0), "%"))) +
    geom_bar(position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)") +
    theme_minimal() +
    facet_grid(
      rows = vars(Regimen), 
      cols = vars(!!sym(stratifying_var)), 
      scales = "free_y", 
      space = "free") +
    theme(
      axis.text.y = element_text(hjust = 1, size = 8),
      legend.position = "none",
      panel.spacing.x = unit(1, "lines"),
      legend.key.size = unit(0.3, "cm"),
      plot.margin = margin(10, 20, 10, 30) ) + 
    scale_fill_manual(
      values = custom_colors,
      breaks = lvl_rev,
      name = NULL) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2)),
      breaks = c(0, 0.5, 1))+
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")
  
  p = ggplotly(p, tooltip = "text")
  
  nl <- nlevels(factor(df_main[[stratifying_var]]))
  
  p$x$layout$yaxis2$domain <- c(0, 1/2)   # 1 block in bottom chunks
  p$x$layout$yaxis$domain <- c(1/2, 1) # 3 in mid group
  
  p$x$layout$annotations[[2+nl]]$y <- 1 - (1 - 1/2) / 2  # Midpoint of the top domain
  p$x$layout$annotations[[3+nl]]$y <- 1/2 - (1 - 1/2) / 2  # Midpoint of the middle domain
  
  p
  
}
