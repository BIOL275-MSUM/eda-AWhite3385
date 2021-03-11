# loading packages

library(tidyverse)

library(lubridate)

#read in covid data for both Minnesota & Alabama

covidmn <-read_csv("https://covidtracking.com/data/download/minnesota-history.csv")

covidal <-read_csv("https://covidtracking.com/data/download/alabama-history.csv") 

covidmn

covidal

data1 <- bind_rows(
  covidmn,
  covidal
) %>% 
  print()

#isolate wanted data

data2 <-select(data1, date, inIcuCumulative, inIcuCurrently)


data3 <- data1 %>% 
  select(date, state, inIcuCumulative, inIcuCurrently) %>% 
  mutate(month - month(date)) %>% mutate(year - year(date)) %>%
  unite("month_year", year, month, remove = FALSE) %>% 
  select(state, month_year, inIcuCumulative, inIcuCurrently) %>%
  print()

#graphing

ggplot(data = data3, aes(x = month_year, y = inIcucumulative)) +
  geom_bar(stat - "identity", fill - "green") +
  labs(title = "Total ICU admissions")
       


