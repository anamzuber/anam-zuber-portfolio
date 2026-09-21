calculate_growth_rate <- function(years, visitors) {
  return((visitors[length(visitors)] - visitors[1]) / (years[length(years)] - years[1]))
}

predict_visitors <- function(years, visitors, year) {
  growth_rate <- calculate_growth_rate(years, visitors)
  latest_visitors <- visitors[length(visitors)]
  years_from_latest <- year - years[length(years)]
  return(latest_visitors + (growth_rate * years_from_latest))
}
visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
