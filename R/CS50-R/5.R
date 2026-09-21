load("air.RData")
air <- air %>%
  group_by(county) %>%
  slice_max(order_by = emissions, n = 1)
save(air, file = "5.RData")