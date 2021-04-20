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
  inner_join(pip)

data2 <- select(data1, positiveIncrease, totalTestResultsIncrease, state, date )

pip1 <- mutate(data2, pip = (positiveIncrease / totalTestResultsIncrease) * 100)
 
pip1

filter(pip1, MN)

summarize(
  pip1, 
  mean_pip = mean(pip))

pip2 <- pip1 %>% 
  filter(!is.na(pip))%>%
  group_by(date, state)%>%
  summarise(
    mean = mean(pip),
    sd = sd(pip, na.rm = TRUE),
    upper = mean(pip) + 1.96 * sd(pip)/sqrt(n()),
    lower = mean(pip) - 1.96 * sd(pip)/sqrt(n())
  )%>%
  print()

#printing data

ggplot(data = data1) + 
  geom_bar(aes(x = date, y = positiveIncrease), stat = "identity", fill = "blue") + 
  labs(title = "Daily Positive Increase",
       subtitle = " Spring 2020 to Spring 2021",
       x = "Month", y = "Number of positive Covid-19 Cases Recorded") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  facet_wrap(~ state, ncol = 1) +
  geom_rect(
    data = tribble(
      ~state, ~start_date, ~end_date, ~description,
      "AL", ymd(20200605), ymd(20200905), "Extreme Heat",
      "MN", ymd(20200320), ymd(20201005), "Nice weather",
      "MN", ymd(20201005), ymd(20210305), "Extreme cold" ,
      "AL", ymd(20200905), ymd(20201105), "Nice weather",
      "AL", ymd(20201105), ymd(20210205), "Extreme cold" ,
      "AL", ymd(20210205), ymd(20210305), "Nice weather" ,
      "AL", ymd(20200320), ymd(20200605), "Nice weather"
    ),
    mapping = aes(xmin = start_date, xmax = end_date,  ymin = -Inf, ymax = Inf, fill = description),
    alpha = .2
  ) +
  scale_fill_manual(values = c("blue", "red", "green", "green"))




ggplot(data = data1) + 
  geom_line(aes(x = date, y = positiveIncrease), stat = "identity", fill = "black") + 
  labs(title = "Statewide Daily Positive COVID-19 Increase & Climate Hostility ",
       subtitle = " Spring 2020 to Spring 2021",
       x = "Month", y = "Number of positive Covid-19 Cases Recorded") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  facet_wrap(~ state, ncol = 1) +
  geom_rect(
    data = tribble(
      ~state, ~start_date, ~end_date, ~description,
      "AL", ymd(20200601), ymd(20200901), "Extreme Heat (Summer)" ,
      "MN", ymd(20200601), ymd(20200901), "Extreme Heat (Summer)" ,
      "MN", ymd(20201201), ymd(20210301), "Extreme cold (Winter)" ,
      "AL", ymd(20201201), ymd(20210301), "Extreme cold (Winter)" ,
      "AL", ymd(20200901), ymd(20201201), "Nice weather (Spring or Autumn)" ,
      "MN", ymd(20200901), ymd(20201201), "Nice weather (Spring or Autumn)" ,
      "AL", ymd(20200311), ymd(20200601), "Nice weather (Spring or Autumn)" ,
      "MN", ymd(20200311), ymd(20200601), "Nice weather (Spring or Autumn)",
    ),
    mapping = aes(xmin = start_date, xmax = end_date,  ymin = -Inf, ymax = Inf, fill = description),
    alpha = .2
  ) +
  scale_fill_manual(values = c("blue", "red", "green"))



