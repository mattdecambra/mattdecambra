bwgs = st_transform(bound, 4326)
bb = st_bbox(bwgs)
scenes = getlandsat::lsat_scenes()

suber = scenes %>%
  filter(min_lat <= bb$ymin, max_lat >= bb$ymax,
         min_lon <= bb$xmin, max_lon >= bb$xmax,
         as.Date(acquisitionDate) == as.Date("2016-09-26"))

write.csv(suber, file = "../data/palo-flood.csv", row.names = FALSE)
