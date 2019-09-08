# Author: Paula Andrea Martinez
# Date: 2019-09-06 

# 1. Load libraries ----
library(tidyverse)
library(here)


# 2. Read data ----

files <- dir(here("rawdata/"))

filestoread <- files[!files %in% c("indigenous-languages-word-lists.docx",
                    "aiatsis_austlang_endpoint_001.csv",
                    "numbers.csv", "say-gday.csv",
                    "tsi-words.csv")]

# fix yuwaalaraay - delete first empty line
data <- tibble(filename = filestoread) %>% # create a tibble 
  # holding the file names
  mutate(file_contents = 
           map(filename,          # read files into
               ~ read_csv(file.path(here("rawdata/"), .) ))) 
data 


data[[1, "file_contents"]]

#I've learn the word in common is Head
data$file_contents %>% 
  purrr::reduce(dplyr::inner_join, by = ("English"))


# I've discovered that nggerikudi and nggerrikwidhi are the same 
# I'll leave it for a moment
x <- data$file_contents %>% 
  purrr::reduce(dplyr::full_join, by = ("English"))

a_test <- read_csv(here("rawdata", "nggerikudi.csv"))
b_test <- read_csv(here("rawdata", "nggerrikwidhi.csv"))
  
identical(a_test, b_test)
rm(a_test, b_test, x)
 

data2 <- data$file_contents %>% 
  purrr::reduce(dplyr::full_join, by = ("English")) %>%  
  janitor::clean_names() %>% 
  arrange(english)

# cool that's what I wanted now, need to group some rows  
#and label better the pronunciations
  
  
colnames(data2) <- 
c("english", "butchulla", "dharumbal", 
  "duungidjawu", "pronunciation__duungidjawu",      
  "gooreng_gooreng", "gunggari", "kala_kawaw_ya",        
  "ku_ku_yalanji", "nggerikudi", "nggerrikwidhi",         
  "turubul", "pronunciation__turubul",     
  "wakka_wakka", "pronunciation__wakka_wakka",    
  "warrgamay", "yugambeh", "pronunciation__yugambeh", 
  "yugarabul", "pronunciation__yugarabul"  ,
  "yuggera", "pronunciation__yuggera"  ,
  "yuwaalaraay", "pronunciation__yuwaalaraay",
  "yuwibara","pronunciation__yuwibara")

write_csv(data2, here("data", "body_words.csv") )

data2 %>% 
  filter(grepl("Lip", english)) %>% 
  summarise(recode(english ))

x <-
data2 %>% 
  select(-starts_with("pron")) %>% 
  gather(language,word,  -english) %>% 
  group_by(english, language) %>% 
  filter(!is.na(word)) %>% 
  ungroup() %>% 
  count(english) %>% 
  arrange(desc(n))

data2 %>% 
  select(-starts_with("pron")) %>% 
  colnames()
  
  
