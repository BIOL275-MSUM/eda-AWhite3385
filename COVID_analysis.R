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

#graphing

ggplot(data = data1, aes(x = date, y = positiveIncrease)) +
  geom_bar(stat = "identity", fill = "blue") + 
  labs(title = "daily positive increase",
       subtitle = " Spring 2020 to Spring 2021",
       x = "Month", y = "Number of Patients Recorded") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  facet_wrap(~ state)
       
citation

