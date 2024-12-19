# Load the necessary library
install.packages('rvest')
library(rvest)

# List of book URLs
book_urls <- c(
  "https://www.gutenberg.org/ebooks/74880",
  "https://www.gutenberg.org/ebooks/74839",
  "https://www.gutenberg.org/ebooks/74879",
  "https://www.gutenberg.org/ebooks/74838",
  "https://www.gutenberg.org/ebooks/74878"
)

# Initialize an empty data frame to store the results
book_data <- data.frame(
  Title = character(),
  Author = character(),
  Language = character(),
  Downloads = character(),
  stringsAsFactors = FALSE
)

# Loop through each URL and scrape the information
for (url in book_urls) {
  webpage <- read_html(url)
  
  # Scrape the information table
  bibrec <- html_node(webpage, '.bibrec')
  bibrec_text <- html_text(bibrec)
  # print(bibrec_text)
  
  # Extract specific details using string operations or regex
  author<- sub(".*?Author(.*?)Illustrator.*", "\\1", bibrec_text)
  illustrator<- sub(".*?Illustrator(.*?)Title.*", "\\1", bibrec_text)
  title <- sub(".*?Title(.*?)Original Publication.*", "\\1", bibrec_text)
  original_publicatoin <- sub(".*?Original Publication(.*?)Credits.*", "\\1", bibrec_text)
  credits <- sub(".*?Credits(.*?)Language.*", "\\1", bibrec_text)
  language <- sub(".*?Language(.*?)Category.*", "\\1", bibrec_text)
  category <- sub(".*?Category(.*?)EBook-No.*", "\\1", bibrec_text)
  ebook_no <- sub(".*?EBook-No(.*?)Release Date.*", "\\1", bibrec_text)
  release_date <- sub(".*?Release Date(.*?)Copyright Status.*", "\\1", bibrec_text)
  copyright_status <- sub(".*?Copyright Status(.*?)Downloads.*", "\\1", bibrec_text)
  downloads <- sub(".*?Downloads(.*?).\n\n\n\n.*", "\\1", bibrec_text)
  
  
  
  # Add the data to the data frame
  # book_data <- rbind(book_data, data.frame(
  #   Title = title,
  #   Author = author,
  #   Language = language,
  #   Downloads = downloads,
  #   stringsAsFactors = FALSE
  # ))
  
  # Print the extracted details
  cat("Author:", author, "Author ends\n")
  cat("Illustrator:", illustrator, "\n")
  cat("Title:", title, "\n")
  cat("Originial Publication:",original_publicatoin, "\n")
  cat("Credits:", credits, "credits ends here----\n")
  cat("Language:", language, "\n")
  cat("Category:", category, "\n")
  cat("Ebook No:", ebook_no, "\n")
  cat("Release Date:", release_date, "\n")
  cat("Copyright Status:", copyright_status, "\n")
  cat("Downloads:", downloads, "\n")
  cat("ends here--------------------------------------\n\n\n\n")
}

# View the collected data
# print(book_data)
