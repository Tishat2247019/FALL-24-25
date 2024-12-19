# Load the necessary library
install.packages('rvest')
library(rvest)

# List of book URLs
book_urls2 <- c(
  "https://www.gutenberg.org/ebooks/74880",
  "https://www.gutenberg.org/ebooks/74839",
  "https://www.gutenberg.org/ebooks/74879",
  "https://www.gutenberg.org/ebooks/74838",
  "https://www.gutenberg.org/ebooks/74878"
)

# Loop through each URL and scrape the information
# Load the necessary library


for (url in book_urls2) {
  webpage <- read_html(url)
  
  # Scrape the information table
  bibrec <- html_node(webpage, '.bibrec')
  bibrec_text <- html_text(bibrec, trim = TRUE)
  # print(bibrec_text)
  
  # Extract specific details using string operations or regex
  title <- sub(".*?Title\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  illustrator<- sub(".*?Illustrator\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  author <- sub(".*?Author\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  language <- sub(".*?Language\\s*\\n(.*?)\\n.*", "\\1", bibrec_text)
  # subject <- sub(".*?Subject\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  copyright_status <- sub(".*?Copyright Status\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  downloads <- sub(".*?Downloads\\s*(\\d+ downloads).*", "\\1", bibrec_text)
  
  
  
  # Add the data to the data frame
  # book_data <- rbind(book_data, data.frame(
  #   Title = title,
  #   Author = author,
  #   Language = language,
  #   Downloads = downloads,
  #   stringsAsFactors = FALSE
  # ))
  
  # Print the extracted details
  cat("Title:", title, "\n")
  cat("Author:", author, "\n")
  cat("Language:", language, "\n")
  cat("Illustrator: " , illustrator, "\n")
  # cat("Subject:", subject, "\n")
  # cat("Copyright Status:", copyright_status,"\n")
  cat("Downloads:", downloads, "\n")
}

