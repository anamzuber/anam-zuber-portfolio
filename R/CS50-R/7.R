load("air.RData")
air <- air %>%
  group_by(level_1, pollutant) %>%
  summarize(emissions = sum(emissions))
air <- air %>% arrange(level_1, pollutant) %>% rename(source = level_1)
save(air, file = "7.RData")
