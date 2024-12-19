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

# Initialize an empty data frame to store the results
book_data <- data.frame(
  Title = character(),
  Author = character(),
  Language = character(),
  Downloads = character(),
  stringsAsFactors = FALSE
)

# Loop through each URL and scrape the information
# for (url in book_urls2) {
#   webpage <- read_html(url)
#   
#   # Scrape the information table
#   bibrec <- html_node(webpage, '.bibrec')
#   bibrec_text <- html_text(bibrec, trim = TRUE)
#   # print(bibrec_text)
#   
#   # Extract specific details using string operations or regex
#   title <- sub(".*?Title\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
#   author <- sub(".*?Author\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
#   language <- sub(".*?Language\\s*\\n(.*?)\\n.*", "\\1", bibrec_text)
#   downloads <- sub(".*?Downloads\\s*(\\d+ downloads).*", "\\1", bibrec_text)
#   
#   
#   
#   # Add the data to the data frame
#   # book_data <- rbind(book_data, data.frame(
#   #   Title = title,
#   #   Author = author,
#   #   Language = language,
#   #   Downloads = downloads,
#   #   stringsAsFactors = FALSE
#   # ))
#   
#   # Print the extracted details
#   cat("Title:", title, "\n")
#   cat("Author:", author, "\n")
#   cat("Language:", language, "\n")
#   cat("Downloads:", downloads, "\n")
# }

# Loop through each URL and scrape the information
for (url in book_urls2) {
  webpage <- read_html(url)
  
  # Scrape the information table
  bibrec <- html_node(webpage, '.bibrec')
  bibrec_text <- html_text(bibrec, trim = TRUE)
  
  # Extract each piece of information using simple pattern matching
  title <- sub(".*?Title\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  author <- sub(".*?Author\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  original_pub <- sub(".*?Original Publication\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  credits <- sub(".*?Credits\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  language <- sub(".*?Language\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  loc_class <- sub(".*?LoC Class\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  loc_no <- sub(".*?LoC No.\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  subject <- sub(".*?Subject\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  ebook_no <- sub(".*?EBook-No.\\s*\\n\\n(\\d+)", "\\1", bibrec_text)
  release_date <- sub(".*?Release Date\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  category <- sub(".*?Category\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  copyright_status <- sub(".*?Copyright Status\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  downloads <- sub(".*?Downloads\\s*(\\d+ downloads).*", "\\1", bibrec_text)
  
  # Print the collected information
  cat("Title:", title, "\n")
  cat("Author:", author, "\n")
  cat("Original Publication:", original_pub, "\n")
  cat("Credits:", credits, "\n")
  cat("Language:", language, "\n")
  cat("LoC Class:", loc_class, "\n")
  cat("LoC No.:", loc_no, "\n")
  cat("Subject:", subject, "\n")
  cat("EBook No:", ebook_no, "\n")
  cat("Release Date:", release_date, "\n")
  cat("Category:", category, "\n")
  cat("Copyright Status:", copyright_status, "\n")
  cat("Downloads:", downloads, "\n")
  cat("--------------------------------------\n")
}

# View the collected data
# print(book_data)
