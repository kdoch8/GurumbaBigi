# Author: Paula Andrea Martinez
# Date: 2019-09-07 

# 1. Load libraries ----
library(tidyverse)
library(here)

# 2. Read data ----
raw_gday <- read_csv(here("rawdata", "say-gday.csv"))

gday <-
raw_gday %>% 
  janitor::clean_names() %>% 
  separate(language_and_location,  c("language", "location_text"),
           sep = "\\[") %>% 
  separate(location_text, c("location_desc", "region"), sep = ",") %>% 
  separate(greeting_word, c("greeting__word", "english"),
           sep = "=") %>% 
  mutate_all(~str_replace_all(., ",|]", "")) %>%
  mutate_all(str_trim)

write_csv(gday, here("data", "gday.csv"))

# join gday with body words data4 ----

data3_names <- 
  data2 %>% 
  select(-starts_with("pron")) %>% 
  colnames() %>% 
  tibble(language = .)


# add spaces to languages
data3_names <-
data3_names %>% 
  mutate(language = str_replace_all(language, "_", " "))

data4 <- gday %>% 
  select(language) %>% 
  distinct()


selected_langs <- 
  c("Yuwaalaraay", "Yugarabul", "Yugara", "Yugambeh", 
    "wakka wakka", "Turrbal", "Kuku Yalanji", "Kala Kawaw Ya", 
    "Gunggari", "Goreng Goreng", "Darumbal", "Butchulla")

data5 <- gday %>% 
  filter(language %in% selected_langs)

write_csv(data5, here("data", "gday_selected_languages.csv"))
