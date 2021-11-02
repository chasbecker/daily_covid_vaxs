# A simplistic look at what America needs to do
# to maintain a vaccination rate in the face of
# fading immunity and booster shots.
# c.l.becker@outlook.com  /// github/chasbecker

library(tidyverse)
rm(list=ls())

# Our World In Data (owid) may change the structure of this
# data at some point in the future.  It would be especially
# problematic if they change the column (variable/feature) names.

# This takes a while to read a bunch of data, presently aroud 66MB.
daily <- read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")
str(daily)
usa_daily <- daily %>%
             filter( iso_code=="USA" & !is.na(new_vaccinations_smoothed_per_million) ) %>%
             select( date, new_vaccinations_smoothed_per_million )


plot_daily <- ggplot(data = usa_daily, aes( x = as.Date(date), y = new_vaccinations_smoothed_per_million )) +
              geom_point() +
              labs( title = "Daily Covid Vaxs") +
              xlab("Date") +
              ylab("Per Million")
#show the plot
plot_daily

