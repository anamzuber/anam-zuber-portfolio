books <- read.csv("books.csv")
authors <- read.csv("authors.csv")
# Find books written by Mia Morgan.
books[books$author == "Mia Morgan", ]
# Find a classic book about music published in 1613.
books[books$topic == "Music" & books$year == 1613, ]
# Find a book published in 1775 by either Lysandra Silverleaf or Elena Petrova.
books[books$year == 1775 & books$author %in% c("Lysandra Silverleaf", "Elena Petrova"), ]
# Find a book about art with 200-300 pages, published in 1990 or 1992 but not 1991.
books[books$topic == "Art" & books$pages >= 200 & books$pages <= 300 & books$year %in% c(1990, 1992), ]
# Find a book with "Quantum Mechanics" in the title.
books[grepl("Quantum Mechanics", books$title), ]
# Find a book about education published in the 1700s whose author is from Zenthia.
books[books$topic == "Education" & books$year >= 1700 & books$year <= 1799 & books$author %in% authors$author[authors$hometown == "Zenthia"], ]
