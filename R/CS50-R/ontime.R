bus <- read.csv("bus.csv")
rail <- read.csv("rail.csv")
services <- rbind(bus, rail)
route <- readline("Route: ")
if (route %in% services$route) {
route_data <- services[services$route == route, ]
peak_data <- route_data[route_data$peak == "PEAK", ]
peak_reliability <- peak_data$numerator / peak_data$denominator
peak_percent <- round(mean(peak_reliability) * 100)
off_peak_data <- route_data[route_data$peak == "OFF_PEAK", ]
off_peak_reliability <- off_peak_data$numerator / off_peak_data$denominator
off_peak_percent <- round(mean(off_peak_reliability) * 100)
cat("On time ", peak_percent, "% of the time during peak hours.\n", sep = "")
cat("On time ", off_peak_percent, "% of the time during off-peak hours.\n", sep = "")
} else {
print("Please enter a valid route.")
}
