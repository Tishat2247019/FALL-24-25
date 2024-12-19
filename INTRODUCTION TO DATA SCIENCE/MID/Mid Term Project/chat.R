# # Install and load the required package
# install.packages('rvest')
# library(rvest)
# 
# # URL of the eBook plain text file (replace with the book you are working on)
# url <- "https://www.gutenberg.org/ebooks/74880"
# 
# # Read the text file
# book_text <- read_html(url) %>% html_text()
# 
# # Save the text for processing
# write(book_text, "book.txt")

# Install and load the rvest package
install.packages("rvest")
library(rvest)

# URL of the ebook metadata page (replace this with different ebook pages)
url <- "https://www.gutenberg.org/ebooks/74880"

# Read the webpage
webpage <- read_html(url)

# Scrape the ebook name (title)
title <- webpage %>% html_node("h1") %>% html_text(trim = TRUE)

# Scrape the author name
author <- webpage %>% html_node(".header ~ a[href*='/author']") %>% html_text(trim = TRUE)

# Scrape the download statistics
downloads <- webpage %>% html_node(".extra ~ strong") %>% html_text(trim = TRUE)

# Scrape the category (manually map, Gutenberg doesn't explicitly categorize)
category <- "Literature" # Replace with heuristic/category as needed

# Scrape the release date (from the "bibliographic record" section)
release_date <- webpage %>% html_node(".bibrec tr:contains('Release Date') td") %>% html_text(trim = TRUE)

# Scrape the language
language <- webpage %>% html_node(".bibrec tr:contains('Language') td") %>% html_text(trim = TRUE)

# Print the metadata
cat("Title:", title, "\n")
cat("Author:", author, "\n")
cat("Downloads:", downloads, "\n")
cat("Category:", category, "\n")
cat("Release Date:", release_date, "\n")
cat("Language:", language, "\n")

install.packages("httr")
library(httr)
response <- GET("https://www.gutenberg.org/ebooks/74880")
charr <- rawToChar(response$content)
print(charr)

