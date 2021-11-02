library(tidyverse)
rm(list=ls())

# this takes a while to read a bunch of data
daily <- read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")
str(daily)

usa_daily <- daily %>%
             filter( iso_code=="USA" & !is.na(new_vaccinations_smoothed_per_million) ) %>%
             select( date, new_vaccinations_smoothed_per_million )


plot_daily <- ggplot(data = usa_daily, mapping = aes( x = date, y = new_vaccinations_smoothed_per_million )) +
              geom_point() +
              labs( title = "Daily Covid Vaxs") +
              xlab("Date") +
              ylab("Per Million") +
              theme(axis.text.x = element_text(angle=90))
#show the plot
plot_daily

