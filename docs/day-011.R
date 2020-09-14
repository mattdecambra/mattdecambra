library(tidyverse)
library(sf)
library(units)

library(USAboundaries)
library(rnaturalearth)
library(gghighlight)

library(ggrepel)
library(knitr)




library(readr)

cities = readr:: read_csv("../data/uscities.csv") %>%
  st_as_sf(coords = c("lng", "lat"), crs = 4326) %>%
  filter(!(state_name %in% c( 'Puerto Rico', 'Alaska', 'Hawaii')))

cities <- st_transform(cities, "+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs")
st_crs(cities)


