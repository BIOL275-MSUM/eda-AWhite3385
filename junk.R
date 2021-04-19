---
  output: github_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, message=FALSE, warning=FALSE)
```

<img src="https://www2.mnstate.edu/uploadedImages/Content/Marketing/logos/MSUM_Signature_Vert_Color.jpg" alt="MSUM logo" width="200" style="float:right">
  
  ---
  ## Statistical Analysis of Positive Covid-19 case increase in states of varying climate hostility
  
  
  ## Abstract
  For the past 12 months Covid-19 has been a prominent scientific topic in both the United States and the world due to its relatively high mortality rate and ability to spread efficiently and unpredictably. The effects of this viral agent have been the cause of many hospitalizations and deaths, thus promting . The question being asked in this statistical analysis is does the percentage of positive case increases have a correlation with climate hostility? The data being analyzed in this experiment will come from the Minnesota and Alabama Covid-19 datasets at The COVID Tracking Project. During this exploratory data analysis, I will be comparing the daily positive case increase in the States of Minnesota & Alabama due to their differences in climate hostility and similar population size. During this analysis, recorded data over the course of a roughly 12-month period from 2/2020 to 3/2021 in quartered increments of 3 months will be used. A possible result that may be concluded from this statistical analysis is that there will be a difference in the percentage of positive case increases during times of the year where the climate in these states is considered hostile.

## Introduction


## Methods



## Results
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, results = FALSE, message=FALSE, warning=FALSE)
```

```{r}
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

#printing data
ggplot(data = data1, aes(x = date, y = positiveIncrease)) +
  geom_(stat = "identity", fill = "blue") + 
  labs(title = "Daily Positive Increase",
       subtitle = " Spring 2020 to Spring 2021",
       x = "Month", y = "Number of positive Covid-19 Cases Recorded") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  facet_wrap(~ state)
```


## Discussion

## Literature

The Atlantic Monthly Group. The COVID Tracking Project, 2021. https://covidtracking.com/about-data. 

Hadley Wickham and Jim Hester (2020). readr: Read Rectangular Text Data. R package version 1.4.0.
https://CRAN.R-project.org/package=readr

Garrett Grolemund, Hadley Wickham (2011). Dates and Times Made Easy with lubridate. Journal of Statistical
Software, 40(3), 1-25. URL https://www.jstatsoft.org/v40/i03/.

Wickham et al., (2019). Welcome to the tidyverse. Journal of Open Source Software, 4(43), 1686,
https://doi.org/10.21105/joss.01686

R Core Team (2020). R: A language and environment for statistical computing. R Foundation for Statistical
Computing, Vienna, Austria. URL https://www.R-project.org/.

RStudio Team (2020). RStudio: Integrated Development Environment for R. RStudio, PBC, Boston, MA URL
http://www.rstudio.com/.

Hadley Wickham, Romain François, Lionel Henry and Kirill Müller (2020). dplyr: A Grammar of Data
Manipulation. R package version 1.0.2. https://CRAN.R-project.org/package=dplyr

H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.


## Links to peer review

I reviewed Rose Lakemans's report at this URL:https://github.com/BIOL275-MSUM/eda-rlakemn517/issues/1

Rose lakeman reviewed my report at this URL: https://github.com/BIOL275-MSUM/eda-AWhite3385/issues/1 

I reviewed Connor Haye's report at this https://github.com/BIOL275-MSUM/eda-chayes307/issues/1

Connor Haye's reviewed my report at this URL: https://github.com/BIOL275-MSUM/eda-AWhite3385/issues/1 