years <- 2020:2024
country <- readline("Country: ")
data2020 <- read.csv("2020.csv")
data2021 <- read.csv("2021.csv")
data2022 <- read.csv("2022.csv")
data2023 <- read.csv("2023.csv")
data2024 <- read.csv("2024.csv")
data <- list(data2020, data2021, data2022, data2023, data2024)
for (i in 1:length(data)) {
  country_data <- data[[i]][data[[i]]$country == country, ]
  if (nrow(country_data) == 0) {
    print(paste("Data unavailable for", years[i]))
  }
  score <- round(sum(country_data[, -1]), 2)
  print(paste("Score:", score, "in", years[i]))
}
