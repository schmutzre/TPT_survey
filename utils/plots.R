################################################################################
#' This file includes plotting helper functions 
################################################################################

#### Figure 1 ------------------------------------------------------------------

library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)
library(wesanderson)  # Assuming wes_palette is from this package

fig1 <- function(stratifying_var) {
  # Check if the stratifying_var is "HBC", and preprocess accordingly
  if (stratifying_var == "HBC") {
    
    hbc <- df1 %>%
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
  
  if (stratifying_var == "Level of integration") {
    
    df1 <- df1 %>% 
      filter(`Level of integration` != "Other")
  }
  
  df_main <- df1 %>%
    group_by(who_group, variable, !!sym(stratifying_var)) %>%
    summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      "Don't know" = sum(category == "Don't know"),
      "Not available" = sum(category == "Not available"),
      total = n(),
      .groups = 'drop'
    ) %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total) %>%
    pivot_longer(cols = c("Yes", "No", "Don't know", "Not available"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response)) 
  
  lvl <- c("Not available", "Don't know", "No", "Yes")
  
  custom_colors <- c(
    "Not available" = "gray70",  
    "Don't know" = "gray50",            
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
      labeller = label_wrap_gen(width = 14)
    ) +
    theme(
      axis.text.y = element_text(hjust = 1, size = 8),
      legend.position = "bottom"
    ) +
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know", "Not available"),
      name = NULL
    ) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2))
    )
}


#### Figure 2 ------------------------------------------------------------------

fig2 <- function(stratifying_var) {
  # Check if the stratifying_var is "HBC", and preprocess accordingly
  if (stratifying_var == "HBC") {
    
    hbc <- df2 %>%
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
    
    df2 <- bind_rows(duplicated, no_duplication)
    
  }
  
  if (stratifying_var == "Level of integration") {
    
    df2 <- df2 %>% 
      filter(`Level of integration` != "Other")
  }
  
  df_main <- df2 %>%
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
    facet_grid(cols = vars(!!sym(stratifying_var))) +
    theme(
      axis.text.y = element_text(hjust = 1, size = 8),
      legend.position = "bottom"
    ) +
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know", "Not available"),
      name = NULL
    ) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2))
    )
}

#### Figure 5 ------------------------------------------------------------------

fig5 <- function(stratifying_var) {
  # Check if the stratifying_var is "HBC", and preprocess accordingly
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
  
  if (stratifying_var == "Level of integration") {
    
    df5 <- df5 %>% 
      filter(`Level of integration` != "Other")
  }
  
  lvl <- c("Don't know", "None", "Children", "Adults", "Both")
  
  custom_colors <- c("Both" = "#4477b2",  
                     "Adults" = "#779ecb",  
                     "Children" = "#aec5e0",  
                     "None" = "#ff6961",  
                     "Don't know" = "#d3d3d3")
  
  df5 %>%
    select(record_id, '6-month isoniazid (6H)', 
           'Once-weekly isoniazid-rifapentine for 12 weeks (3HP)',
           '3-month isoniazid-rifampicin (3HR)',
           '9-month isoniazid (9H)', !!sym(stratifying_var)) %>%
    pivot_longer(cols = -c(record_id,!!sym(stratifying_var)), names_to = "treatment", values_to = "status") %>% 
    mutate(status = as.factor(status),
           status = forcats::fct_relevel(status, "Both", "Adults", "Children", "None", "Don't know"),
           treatment = forcats::fct_relevel(treatment, 
                                            "9-month isoniazid (9H)", 
                                            "3-month isoniazid-rifampicin (3HR)", 
                                            "Once-weekly isoniazid-rifapentine for 12 weeks (3HP)", "6-month isoniazid (6H)")) %>% 
    ggplot(aes(y = treatment, fill = factor(status, levels = lvl, exclude = NULL))) +
    geom_bar( position = "fill") +
    scale_fill_manual(values = custom_colors, na.value = "#a9a9a9", breaks = c("Both", "Adults", "Children", "None", "Don't know")) +
    theme_minimal() +
    labs(y = "", x = "Proportion of clinics (%)", title = "Most used TPT regimens ") +
    theme(legend.title = element_blank(),
          legend.position = "bottom") +
    scale_x_continuous(labels = function(x) paste0(format(x * 100, digits = 2),"")) +
    facet_grid(cols = vars(!!sym(stratifying_var)))
}
