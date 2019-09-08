# Author: Paula Andrea Martinez
# Date: 2019-09-07 

# 1. Load libraries ----
library(tidyverse)
library(here)

# 2. Read data ----
#https://collection.aiatsis.gov.au/datasets/austlang/001

aiatsis <- read_csv("https://data.gov.au/data/dataset/70132e6f-259c-4e0f-9f95-4aed1101c053/resource/e9a9ea06-d821-4b53-a05f-877409a1a19c/download/aiatsis_austlang_endpoint_001.csv")

head(aiatsis)

source(here("scripts", "01_word_lists.R" ))
data3_names <- 
  data2 %>% 
  select(-starts_with("pron")) %>% 
  colnames()

data3_names



install.packages("fuzzyjoin")
library("fuzzyjoin")
# https://github.com/dgrtwo/fuzzyjoin

data3_names <- tibble(data3_names)

aiatsis %>% 
  stringdist_inner_join(data3_names, 
                        by = c(misspelling = "language_synonym"), max_dist = 1)

butchulla                    
Darumbal
duungidjawu
gooreng gooreng
gunggari
kalaw kawaw ya
kuku yalanji
