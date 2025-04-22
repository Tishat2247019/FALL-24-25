# Load the necessary library
install.packages('rvest')
library(rvest)

# List of book URLs
book_urls5 <- c(
  "https://www.gutenberg.org/ebooks/74880",
  "https://www.gutenberg.org/ebooks/74839",
  "https://www.gutenberg.org/ebooks/74879",
  "https://www.gutenberg.org/ebooks/74838",
  "https://www.gutenberg.org/ebooks/74878", 
  "https://www.gutenberg.org/ebooks/32033"
)

# Loop through each URL and scrape the information
# Load the necessary library


for (url in book_urls5) {
  webpage <- read_html(url)
  
  # Scrape the information table
  bibrec <- html_node(webpage, '.bibrec')
  bibrec_text <- html_text(bibrec, trim = TRUE)
  print(bibrec_text)
  print("--------------\\n\n\n")

  
  
  
}
