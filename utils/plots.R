################################################################################
#' This file includes plotting helper functions 
################################################################################

#### Figure 1 ------------------------------------------------------------------

GENfig1_sup <- function(data, stratifying_var) {
  
  ranked_data <- data %>%
    group_by(who_group, variable, !!sym(stratifying_var)) %>%
    summarize(count = n(), 
              count_yes = sum(category == "1", na.rm = TRUE), 
              .groups = 'drop') %>%
    mutate(yes_proportion = count_yes / count) %>%
    arrange(who_group, yes_proportion) %>%
    mutate(rank = row_number())
  
  final_data <- data %>%
    left_join(ranked_data %>% select(who_group, variable, rank, !!sym(stratifying_var)), 
              by = c("who_group", "variable", stratifying_var)) %>% 
    mutate(variable = forcats::fct_reorder(variable, rank)) %>% 
    group_by(variable, category, who_group, !!sym(stratifying_var)) %>%
    summarize(count = n(), .groups = 'drop') %>%
    mutate(category = factor(case_when(is.na(category) ~ "Not available", TRUE ~ category)))
  
  lvl <- c("Not available", "3", "0", "1")
  
  custom_colors <- c("Not available" = "gray70",
                     "3" = "gray50",
                     "0" = wes_palette("GrandBudapest1")[2],
                     "1" = wes_palette("GrandBudapest2")[4])
  
  final_data %>% 
    ggplot(
      aes(y = variable, x = count, fill = factor(category, levels = lvl, exclude = NULL))) +
    geom_bar(
      stat = "identity", 
      position = "fill") +
    labs(
      title = "", 
      y = "", 
      x = "Proportion of clinics (%)") +
    theme_minimal() +
    theme(
      axis.text.y = element_text(hjust = 1, size = 8),
      legend.position = "bottom",
      panel.spacing = unit(1.1, "lines")) +
    scale_fill_manual(
      values = custom_colors,
      labels = c("Yes", "No", "Don't know", "Not available"),  
      breaks = c("1", "0", "3", "Not available"),  
      name = NULL)+
    scale_x_continuous(
      expand = c(0,0), 
      labels = function(x) paste0(format(x * 100, digits = 2)),
      breaks = c(0,0.5,1)) +
    facet_grid(
      rows = vars(who_group), 
      cols = vars(!!sym(stratifying_var)), 
      scales = "free_y", 
      space = "free", 
      labeller = label_wrap_gen(width = 14))
}

#### Figure 2 ------------------------------------------------------------------

GENfig2_sup <- function(data, stratifying_var) {
  
  ranked_data <- data %>%
    group_by(variable, !!sym(stratifying_var)) %>% 
    summarize(count = n(), 
              count_yes = sum(category == "1", na.rm = TRUE), 
              .groups = 'drop') %>%
    mutate(yes_proportion = count_yes / count) %>%
    arrange(yes_proportion) %>%
    mutate(rank = row_number())
  
  final_data <- data %>%
    left_join(ranked_data %>% select( variable, rank, !!sym(stratifying_var)), by = c("variable", stratifying_var)) %>%
    mutate(variable = forcats::fct_reorder(variable, rank)) %>%
    group_by(variable, category, !!sym(stratifying_var)) %>%
    summarize(count = n(), .groups = 'drop') %>%
    mutate(category = factor(case_when(is.na(category) ~ "Not available",
                                       TRUE ~ category)),
           variable = as.factor(variable),
           variable = fct_relevel(variable, "No barriers"))
  
final_data %>%
  ggplot(aes(x = variable, y = count, fill = factor(category, levels = lvl, exclude = NULL))) +
  geom_bar(stat = "identity", position = "fill") +
  labs(title = "", x = "", y = "Proportion of clinics (%)") +
  theme_minimal() +
  theme(axis.text.x = element_text(hjust = 1),
      legend.position = "bottom",
      panel.spacing = unit(1.1, "lines")) +
  scale_fill_manual(
    values = custom_colors,
    labels = c("Yes", "No", "Don't know", "Not available"),  # Adjust labels if needed
    breaks = c("1", "0", "3", "Not available"),  # Specify the desired legend order here
    name = NULL)+
  scale_y_continuous(
    expand = c(0,0),
    labels = function(x) paste0(format(x * 100, digits = 2),""),
    breaks = c(0,0.5,1)) +
  coord_flip() +
  facet_grid(cols = vars(!!sym(stratifying_var)))
}

