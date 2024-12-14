# Load the necessary library
install.packages('rvest')
library(rvest)

# List of ebook URLs
ebook_urls <- c(
  "https://www.gutenberg.org/ebooks/74880",
  "https://www.gutenberg.org/ebooks/74839",
  "https://www.gutenberg.org/ebooks/74879",
  "https://www.gutenberg.org/ebooks/74838",
  "https://www.gutenberg.org/ebooks/74878"
)

# Initialize an empty list to store raw data for each ebook
ebook_data <- list()

# Scrape data for each ebook
for (url in ebook_urls) {
  webpage <- read_html(url)
  
  # Scrape the ebook metadata section
  bibrec <- html_node(webpage, '.bibrec')
  raw_data <- html_text(bibrec, trim = TRUE) # Get raw text
  
  # Store the raw data in the list
  ebook_data[[url]] <- raw_data
}

# Display the raw data for each ebook
for (url in ebook_urls) {
  cat("Ebook URL:", url, "\n")
  cat(ebook_data[[url]], "\n")
  cat("-----------------------------------------------------\n")
}

