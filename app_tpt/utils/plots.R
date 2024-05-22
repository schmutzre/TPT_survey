################################################################################
#' This file includes plotting helper functions 
################################################################################

#### Figure 1 ------------------------------------------------------------------

library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)
library(wesanderson)  

fig1 <- function(data, stratifying_var) {

    if (stratifying_var == "HBC") {
    
    hbc <- data %>%
      rowwise() %>%
      mutate(
        HBC = {
          hbc_values <- c_across(c(HBC_ANY, HBC_TB, HBC_TB_HIV, HBC_DR_TB))
          hbc_labels <- c("HBC any", "HBC TB", "HBC TB/HIV", "HBC DR TB")
          paste(hbc_labels[hbc_values == "HBC"], collapse = ",")}) %>%
      ungroup()
    
    duplicate <- hbc %>%
      filter(str_detect(HBC, ","))  # Select rows with multiple categories
    
    duplicated <- duplicate %>%
      separate_rows(HBC, sep = ",")  # Separate into multiple rows
    
    no_duplication <- hbc %>%
      filter(!str_detect(HBC, ",")) %>%
      mutate(HBC = ifelse(HBC == "", "Not HBC", HBC))
    
    df1 <- bind_rows(duplicated, no_duplication)
    
  }
  
  df_main <- data %>%
    group_by(who_group, variable, !!sym(stratifying_var)) %>%
    summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      "Don't know" = sum(category == "Don't know"),
      total = n(),
      .groups = 'drop'
    ) %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total) %>%
    pivot_longer(cols = c("Yes", "No", "Don't know"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response)) 
  
  lvl <- c("Don't know", "No", "Yes")
  
  custom_colors <- c(
    "Don't know" = "#d3d3d3",            
    "No" = wes_palette("GrandBudapest1")[2],  
    "Yes" = wes_palette("GrandBudapest2")[4]
  )
  
  df_main %>% 
    ggplot(aes(y = reorder(variable, prop_yes), 
               fill = factor(response, levels = lvl, exclude = NULL), 
               by = variable, weight = count)) +
    geom_bar(position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)"
    ) +
    theme_minimal() +
    facet_grid(
      rows = vars(who_group), 
      cols = vars(!!sym(stratifying_var)), 
      scales = "free_y", 
      space = "free", 
      labeller = label_wrap_gen(width = 14)) +
    theme(
      axis.text.y = element_text(hjust = 1, size = 12),
      legend.position = "bottom",
      panel.spacing.x = unit(1, "lines"),
        plot.title = element_text(size = 12),
        plot.subtitle = element_text(size = 12),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 12),
        strip.text = element_text(size = 12),
      legend.text = element_text(size = 12)) +
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know"),
      name = NULL
    ) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2)),
      breaks = c(0, 0.5, 1)
    )
}


#### Figure 2 ------------------------------------------------------------------

fig2 <- function(data, stratifying_var) {

    if (stratifying_var == "HBC") {
    
    hbc <- data %>%
      rowwise() %>%
      mutate(
        HBC = {
          hbc_values <- c_across(c(HBC_ANY, HBC_TB, HBC_TB_HIV, HBC_DR_TB))
          hbc_labels <- c("HBC any", "HBC TB", "HBC TB/HIV", "HBC DR TB")
          paste(hbc_labels[hbc_values == "HBC"], collapse = ",")}) %>%
      ungroup()
    
    duplicate <- hbc %>%
      filter(str_detect(HBC, ","))  # Select rows with multiple categories
    
    duplicated <- duplicate %>%
      separate_rows(HBC, sep = ",")  # Separate into multiple rows
    
    no_duplication <- hbc %>%
      filter(!str_detect(HBC, ",")) %>%
      mutate(HBC = ifelse(HBC == "", "Not HBC", HBC))
    
    data <- bind_rows(duplicated, no_duplication)
    
  }
  
  df_main <- data %>%
    group_by(variable, !!sym(stratifying_var)) %>%
    summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      total = n(),
      .groups = 'drop'
    ) %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total) %>%
    pivot_longer(cols = c("Yes", "No"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response))
  
  lvl <- c("No", "Yes")
  
  custom_colors <- c(
    "No" = wes_palette("GrandBudapest1")[2],  
    "Yes" = wes_palette("GrandBudapest2")[4]
  )
  
  df_main %>% 
    ggplot(aes(y = variable, 
               fill = factor(response, levels = lvl, exclude = NULL), 
               by = variable, weight = count)) +
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
      axis.text.y = element_text(hjust = 1, size = 12),
      legend.position = "bottom",
      panel.spacing.x = unit(1, "lines"),
      plot.title = element_text(size = 12),
      plot.subtitle = element_text(size = 12),
      axis.title = element_text(size = 12),
      axis.text = element_text(size = 12),
      strip.text = element_text(size = 12),
      legend.text = element_text(size = 12),
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
    ) 
}

#### Figure 5 ------------------------------------------------------------------

fig5 <- function(stratifying_var) {

    if (stratifying_var == "HBC") {
    
    hbc <- df5 %>%
      rowwise() %>%
      mutate(
        HBC = {
          hbc_values <- c_across(c(HBC_ANY, HBC_TB, HBC_TB_HIV, HBC_DR_TB))
          hbc_labels <- c("HBC any", "HBC TB", "HBC TB/HIV", "HBC DR TB")
          paste(hbc_labels[hbc_values == "HBC"], collapse = ",")}) %>%
      ungroup()
    
    duplicate <- hbc %>%
      filter(str_detect(HBC, ","))  # Select rows with multiple categories
    
    duplicated <- duplicate %>%
      separate_rows(HBC, sep = ",")  # Separate into multiple rows
    
    no_duplication <- hbc %>%
      filter(!str_detect(HBC, ",")) %>%
      mutate(HBC = ifelse(HBC == "", "Not HBC", HBC))
    
    df5 <- bind_rows(duplicated, no_duplication)
    
  }
  
  lvl <- c("Don't know", "Not offered", "Children", "Adults", "Adults & Children")
  
  custom_colors <- c("Adults & Children" = "#8ac0ff",  
                     "Adults" = "#abe1ff",  
                     "Children" = "#d0f2ff",  
                     "Not offered" = "#fde9d8",  
                     "Don't know" = "#d3d3d3")
  
  trt <- c("9-month isoniazid (9H)", 
           "3-month isoniazid-rifampicin (3HR)", 
           "Once-weekly isoniazid-rifapentine\nfor 12 weeks (3HP)", 
           "6-month isoniazid (6H)")
  
  df5 %>%
    select(record_id, '6-month isoniazid (6H)', 
           'Once-weekly isoniazid-rifapentine for 12 weeks (3HP)',
           '3-month isoniazid-rifampicin (3HR)',
           '9-month isoniazid (9H)', !!sym(stratifying_var)) %>%
    pivot_longer(cols = -c(record_id,!!sym(stratifying_var)), names_to = "treatment", values_to = "status") %>% 
    mutate(status = as.factor(status),
           status = forcats::fct_relevel(status, "Adults & Children", "Adults", "Children", "Not offered", "Don't know"),
           treatment = forcats::fct_relevel(treatment, 
                                            "9-month isoniazid (9H)", 
                                            "3-month isoniazid-rifampicin (3HR)", 
                                            "Once-weekly isoniazid-rifapentine for 12 weeks (3HP)", "6-month isoniazid (6H)")) %>% 
    ggplot(aes(y = treatment, fill = factor(status, levels = lvl, exclude = NULL))) +
    geom_bar( position = "fill") +
    scale_fill_manual(values = custom_colors, na.value = "#a9a9a9", breaks = c("Adults & Children", "Adults", "Children", "Not offered", "Don't know")) +
    theme_minimal() +
    labs(y = "", x = "Proportion of clinics (%)", title = "Most used TPT regimens ") +
    theme(legend.title = element_blank(),
          legend.position = "bottom",
          panel.spacing.x = unit(1, "lines")) +
    scale_x_continuous(labels = function(x) paste0(format(x * 100, digits = 2),""),
                       breaks = c(0, 0.5, 1)) +
    scale_y_discrete(labels= trt)+
    facet_grid(cols = vars(!!sym(stratifying_var)))
}
