tests <- read.table("tests.tsv", header = TRUE, sep = "\t")
tests$gender <- c("Unanswered", "Male", "Female", "Other")[tests$gender + 1]
tests$extroversion <- round(rowSums(tests[, c("E1", "E2", "E3")]) / 15, 2)
tests$neuroticism <- round(rowSums(tests[, c("N1", "N2", "N3")]) / 15, 2)
tests$agreeableness <- round(rowSums(tests[, c("A1", "A2", "A3")]) / 15, 2)
tests$conscientiousness <- round(rowSums(tests[, c("C1", "C2", "C3")]) / 15, 2)
tests$openness <- round(rowSums(tests[, c("O1", "O2", "O3")]) / 15, 2)
write.csv(tests, "analysis.csv", row.names = FALSE)
list.files()
