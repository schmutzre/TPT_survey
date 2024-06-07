################################################################################
#' This file includes plotting helper functions 
################################################################################

#### Figure 1 ------------------------------------------------------------------

library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)
library(wesanderson)  
library(scico)

fig1 <- function(stratifying_var, pct = FALSE) {

    if (stratifying_var == "HBC") {
    
    hbc <- df1 %>%
      rowwise() %>%
      mutate(
        HBC = {
          hbc_values <- c_across(c(HBC_ANY, HBC_TB, HBC_TB_HIV, HBC_DR_TB))
          hbc_labels <- c("Any", "TB", "TB/HIV", "DR TB")
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
  
  df_order <- df1 %>% 
    group_by(who_group, variable) %>%
    dplyr::summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      "Don't know" = sum(category == "Don't know"),
      total = n(),
      .groups = 'drop') %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total,
           prop_yes = round(prop_yes,2)) %>%
    pivot_longer(cols = c("Yes", "No", "Don't know"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response)) %>% 
    select(prop_yes, variable, response)
    
  df_main <- df1 %>%
    group_by(who_group, variable, !!sym(stratifying_var)) %>%
    dplyr::summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      "Don't know" = sum(category == "Don't know"),
      total = n(),
      .groups = 'drop') %>%
    ungroup() %>%
    pivot_longer(cols = c("Yes", "No", "Don't know"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response)) %>% 
    left_join(df_order, by = c("variable" = "variable", "response" = "response"))
  
  lvl <- c("Don't know", "No", "Yes")
  
  custom_colors <- c(
    "Don't know" = "#d3d3d3",            
    "No" = wes_palette("GrandBudapest1")[2],  
    "Yes" = wes_palette("GrandBudapest2")[4]
  )
  
  p <- df_main %>% 
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
      legend.position = "bottom",
      panel.spacing.x = unit(1, "lines")) +
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know"),
      name = NULL
    ) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2)),
      breaks = c(0, 0.25, 0.5, 0.75,  1))+
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")
  
  if(pct == FALSE){
    
    return(p)
    
  }
  
  else{
    
    p <- p + geom_text(aes(label = scales::percent(prop_yes), y = variable, x = prop_yes-0.05),
                       data = df_main %>% filter(response == "Yes"),
                       color = "white", 
                       size = 2.8) 
    
    return(p)
  }
}

#### Figure 2 ------------------------------------------------------------------

fig2 <- function(stratifying_var, pct = FALSE) {

    if (stratifying_var == "HBC") {
    
    hbc <- df2 %>%
      rowwise() %>%
      mutate(
        HBC = {
          hbc_values <- c_across(c(HBC_ANY, HBC_TB, HBC_TB_HIV, HBC_DR_TB))
          hbc_labels <- c("Any", "TB", "TB/HIV", "DR TB")
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
  
  df_order <- df2 %>% 
    group_by(variable) %>%
    dplyr::summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      total = n(),
      .groups = 'drop'
    ) %>%
    ungroup() %>%
    mutate(prop_yes = Yes / total,
           pr_yes = round(prop_yes,2)) %>%
    pivot_longer(cols = c("Yes", "No"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response)) %>% 
    mutate(variable = factor(variable, levels = unique(variable))) %>%
    arrange(variable == "No barriers", prop_yes) %>%
    mutate(variable = factor(variable, levels = unique(variable))) %>% 
    select(variable, prop_yes, pr_yes, response)
  
  df_main <- df2 %>%
    group_by(variable, !!sym(stratifying_var)) %>%
    dplyr::summarize(
      Yes = sum(category == "Yes"),
      No = sum(category == "No"),
      total = n(),
      .groups = 'drop'
    ) %>%
    ungroup() %>%
    pivot_longer(cols = c("Yes", "No"), names_to = "response",
                 values_to = "count") %>%
    mutate(response = as.factor(response)) %>% 
    mutate(variable = factor(variable, levels = unique(variable))) %>%
    left_join(df_order, by = c("variable", "response")) %>% 
    arrange(variable == "No barriers", prop_yes) %>%
    mutate(variable = factor(variable, levels = unique(variable)))
  
  lvl <- c("No", "Yes")
  
  custom_colors <- c(
    "No" = wes_palette("GrandBudapest1")[2],  
    "Yes" = wes_palette("GrandBudapest2")[4]
  )
  
  p <- df_main %>% 
    ggplot(aes(y = variable,
               fill = factor(response, levels = lvl, exclude = NULL), 
               weight = count)) +
    geom_bar(position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)") +
    theme_minimal() +
    facet_grid(cols = vars(!!sym(stratifying_var))) +
    theme(
      axis.text.y = element_text(hjust = 1, size = 8),
      legend.position = "bottom",
      panel.spacing.x = unit(1, "lines"),
      plot.margin = margin(t = 5, r = 10, b = 5, l = 5, unit = "pt")) +
    scale_fill_manual(
      values = custom_colors,
      breaks = c("Yes", "No", "Don't know", "Not available"),
      name = NULL) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2)),
      breaks = c(0, 0.25, 0.5, 0.75,  1)) +
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")
  
  if(pct == FALSE) {
    
    return(p)
  
    }
  
  else{
    
    p <- p + geom_text(aes(label = scales::percent(pr_yes), y = variable, x = pr_yes-0.05),
                       data = df_main %>% filter(response == "Yes"),
                       color = "white", 
                       size = 2.8) 
    
    return(p)
  }
  
}

#### Figure 3 ------------------------------------------------------------------

fig3 <- function(variable) {
  
  data <- df3 %>% filter(who_group == variable) %>% 
    select(-who_group) %>% 
    group_by(region_exact) %>% 
    summarise(prop = mean(any_yes == 1, na.rm = T))
  
  data2 <- df %>% 
    select(record_id, country, region, region_exact)  %>% 
    left_join(data, by = "region_exact") %>%   
    mutate(region = case_when(
      country == "ARG" ~ "Argentina",
      country == "AUS" ~ "Australia",
      country == "BDI" ~ "Burundi",
      country == "BEN" ~ "Benin",
      country == "BFA" ~ "Burkina Faso",
      country == "BRA" ~ "Brazil",
      country == "CHL" ~ "Chile",
      country == "CHN" ~ "China",
      country == "CIV" ~ "Ivory Coast",
      country == "CMR" ~ "Cameroon",
      country == "COD" ~ "Democratic Republic of the Congo",
      country == "COG" ~ "Republic of the Congo",
      country == "GHA" ~ "Ghana",
      country == "HND" ~ "Honduras",
      country == "HTI" ~ "Haiti",
      country == "IDN" ~ "Indonesia",
      country == "IND" ~ "India",
      country == "JPN" ~ "Japan",
      country == "KEN" ~ "Kenya",
      country == "KHM" ~ "Cambodia",
      country == "KOR" ~ "South Korea",
      country == "LSO" ~ "Lesotho",
      country == "MEX" ~ "Mexico",
      country == "MLI" ~ "Mali",
      country == "MOZ" ~ "Mozambique",
      country == "MWI" ~ "Malawi",
      country == "MYS" ~ "Malaysia",
      country == "NGA" ~ "Nigeria",
      country == "PER" ~ "Peru",
      country == "PHL" ~ "Philippines",
      country == "RWA" ~ "Rwanda",
      country == "SGP" ~ "Singapore",
      country == "TGO" ~ "Togo",
      country == "THA" ~ "Thailand",
      country == "TWN" ~ "Taiwan",
      country == "TZA" ~ "Tanzania",
      country == "UGA" ~ "Uganda",
      country == "VNM" ~ "Vietnam",
      country == "ZAF" ~ "South Africa",
      country == "ZMB" ~ "Zambia",
      country == "ZWE" ~ "Zimbabwe",
      TRUE ~ NA_character_))  
  
  worldSubsetA <- left_join(world, data2, by = "region", relationship =  "many-to-many") %>% 
    filter(region != "Antarctica")
    
    p <- worldSubsetA %>%
      ggplot(aes(x = long, y = lat)) +
      coord_fixed(1.6) +
      geom_polygon(aes(fill = prop, group = group), color = "grey25", linewidth = 0.15) +
      labs(fill = "", x = "", y = "") +
      theme_bw()+
      theme(legend.key.width = unit(2, "cm"),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            legend.margin = margin(t = 0, b = 0, unit = "pt"),
            legend.position = c(0.5, 0.7),
            legend.box.margin = margin(t = 0, b = 0, unit = "pt"),
            panel.grid.major = element_blank(), 
                  panel.grid.minor = element_blank(), 
            plot.title = element_text(size = 10)) +
      scale_fill_scico(palette = "roma", begin = 0, end = 1, na.value = "white", 
                       limits = c(0, 1),  
                       oob = scales::oob_squish, labels = scales::label_percent(scale = 100)) +
      labs(x = element_blank(),
           y = element_blank())
    
  return(p)

}


#### Figure 5 ------------------------------------------------------------------

fig5 <- function(stratifying_var) {

    if (stratifying_var == "HBC") {
    
    hbc <- df5b %>%
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
    
    df5b <- bind_rows(duplicated, no_duplication)
    
  }
  
  lvl <- c("Don't know", "Not offered", "Children", "Adults", "Adults & Children")
  lvl_rev <- c("Adults & Children", "Adults", "Children", "Not offered", "Don't know")
  
  custom_colors <- c("Adults & Children" = "#8ac0ff",  
                     "Adults" = "#abe1ff",  
                     "Children" = "#d0f2ff",  
                     "Not offered" = "#fde9d8",  
                     "Don't know" = "#d3d3d3")
  
  df5b %>% 
    ggplot(aes(y = variable, 
               fill = factor(category, levels = lvl, exclude = NULL))) +
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
      space = "free", 
      labeller = label_wrap_gen(width = 14)) +
    theme(
      axis.text.y = element_text(hjust = 1, size = 8),
      legend.position = "bottom",
      panel.spacing.x = unit(1, "lines"),
      legend.key.size = unit(0.3, "cm")) +
    scale_fill_manual(
      values = custom_colors,
      breaks = lvl_rev,
      name = NULL) +
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2)),
      breaks = c(0, 0.25, 0.5, 0.75,  1))+
    geom_vline(xintercept = 0.5, linetype = "dashed", color = "white")
}
