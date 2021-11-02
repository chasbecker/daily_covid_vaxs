library(tidyverse)
rm(list=ls())

# this takes a while to read a few million rows
daily <- read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")
str(daily)

usa_daily <- daily %>%
             filter( iso_code=="USA" & !is.na(new_vaccinations_smoothed_per_million) ) %>%
             select( date, new_vaccinations_smoothed_per_million )


plot_daily


plot(as.Date(usa_daily$date), usa_daily$new_vaccinations_smoothed_per_million)
