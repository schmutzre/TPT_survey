#### Data for the table per site -----------------------------------------------

df <- readRDS("data_clean/data_clean.rds") %>% 
  filter(tpt_prov == 1)

coordinates <- read.csv("data_clean/coordinates_sites.csv") %>% 
  separate(coord, into = c("latitude", "longitude"), sep = ",", convert = TRUE) %>% 
  select(record_id, latitude, longitude)

dataSites <- df %>% 
  select(record_id, country, name, region, HBC_ANY, adultped.factor, rural.factor, level.factor, tbhiv_integration.factor, tpt_training.factor, HBC_ANY, Income_group, Prev_cat.factor)  %>% 
  rename(`Population the center serves` = adultped.factor,
         `Facility location` = rural.factor,
         `Facility level of care`  = level.factor,
         `Level of integrated TB/HIV services` = tbhiv_integration.factor,         
         `Anyone attended a formal training on TPT provision` = tpt_training.factor,
        `Income Level`= Income_group,
        `HIV Prevalence` = Prev_cat.factor,
        `High burden country` = HBC_ANY,
        Region = region) %>% 
  mutate(`Facility level of care` = fct_drop(`Facility level of care`),
         `Facility location` = fct_drop(`Facility location`),
         `High burden country` = ifelse(`High burden country`== "HBC", "Yes", "No")) %>% 
  mutate(across(.cols = everything(), .fns = ~fct_na_value_to_level(., "Missing"))) %>% 
  left_join(coordinates, by = "record_id")

dataSites$`Level of integrated TB/HIV services` <- factor(dataSites$`Level of integrated TB/HIV services`,
                                                    levels = c("Full", "Partial", "No", "Missing"))

levels(dataSites$`Facility level of care`) <- c("Health centre", "District hospital", "Regional or provincial hospital", "Missing")

dataSites$`Level of integrated TB/HIV services` <- fct_drop(dataSites$`Level of integrated TB/HIV services`, only = "Other")

levels(dataSites$`Population the center serves`) <- c("Adults", "Children", "Adults & Children", "Missing")

saveRDS(dataSites, "app_tpt/data/data.rds")

#### Plot 1 --------------------------------------------------------------------

df1.app <- readRDS("data_clean/df1.rds") %>% 
  rename(Region = region,
         `High burden country` = HBC_ANY,
         `Level of integrated TB/HIV services` = `Level of integration`) %>% 
  mutate(`High burden country` = ifelse(`High burden country`== "HBC", "Yes", "No")) 

saveRDS(df1.app, "app_tpt/data/df1.rds")

#### Plot 2 --------------------------------------------------------------------

df2.app <- readRDS("data_clean/df2.rds") %>% 
  rename(Region = region,
         `High burden country` = HBC_ANY,
         `Level of integrated TB/HIV services` = `Level of integration`) %>% 
  mutate(`High burden country` = ifelse(`High burden country`== "HBC", "Yes", "No")) 

saveRDS(df2.app, "app_tpt/data/df2.rds")

#### Plot 3 --------------------------------------------------------------------

df3.app <- readRDS("data_clean/df5.rds") %>% 
  rename(Region = region,
         `High burden country` = HBC_ANY,
         `Level of integrated TB/HIV services` = `Level of integration`) %>% 
  mutate(`High burden country` = ifelse(`High burden country`== "HBC", "Yes", "No")) %>% 
  filter(variable != "Regimens for MDR-TB exposure" & variable != "Other")

saveRDS(df3.app, "app_tpt/data/df3.rds")

#### Table 1 -------------------------------------------------------------------

df1.table <- df1.app %>%
  group_by(who_group) %>%
  summarise(details = paste0("<tr><td>", record_id, "</td><td>", category, "</td></tr>", collapse = "")) %>%
  ungroup() %>% 
  mutate(details = paste0("<tr><th colspan='2'>", who_group, "</th></tr>", details)) %>%
  summarise(table = paste(details, collapse = "")) %>%
  .$table %>%
  paste(collapse = "")
