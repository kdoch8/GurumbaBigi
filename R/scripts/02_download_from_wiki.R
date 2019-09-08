# Author: Paula Andrea Martinez
# Date: 2019-09-06 

# 1. Load libraries ----
library(tidyverse)
library(here)
library(rvest)

# 2. Read data ----

#https://en.wikipedia.org/wiki/List_of_Australian_Aboriginal_languages
aulanguages <- 
  read_html("https://en.wikipedia.org/wiki/List_of_Australian_Aboriginal_languages") %>% 
  html_nodes("table") %>% 
  map(html_table, fill = TRUE) %>% 
  .[2:6] %>% 
  bind_rows() %>% 
  as_tibble(.name_repair = ~ c("language", "alternative_name", "speakers",
                               "status", "notes"))

write_csv(aulanguages, here("data", "aulanguages_descriptors.csv") )


aulanguages <- read_csv(here("data", "aulanguages_descriptors.csv") )
# study data

aulanguages %>% 
  count(status) %>% 
  arrange(desc(n))

aulanguages_clean <- 
  aulanguages %>% 
  mutate(language = str_replace_all(language, "language", "")) %>% 
  mutate(language = str_replace_all(language, "\\[1\\]", "")) %>% 
  mutate_all(str_trim)

# QLD----

qld_langs <-
  aulanguages_clean %>% 
  mutate(state = ifelse(grepl("Qld", notes), "QLD", 
                        ifelse(grepl("Queensland", notes), 
                               "QLD", "x"))) %>% 
  filter(state == "QLD") %>% 
  mutate(status = str_replace(status, "Extinct", "Sleeping"))

write_csv(aulanguages, here("data", "qld_languages_descriptors.csv") )


# Kuku Yalanji - severely endangered


#----

body_w <- read_csv(here("data", "body_words.csv"))

langs <- body_w %>% 
  select(-starts_with("pron")) %>% 
  colnames() %>% 
  tibble(language = .)


library(fuzzyjoin)

subset_aulanguages <- aulanguages %>%
  stringdist_right_join(langs, 
                        by = c(language = "language"), 
                        max_dist = 10)
