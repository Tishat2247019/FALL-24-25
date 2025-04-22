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
for (url in book_urls2) {
  webpage <- read_html(url)
  
  # Scrape the information table
  bibrec <- html_node(webpage, '.bibrec')
  bibrec_text <- html_text(bibrec, trim = TRUE)
  
  # Extract specific details using simple string operations with Option 1
  title <- sub(".*?Title\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  author <- sub(".*?Author\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  loc_no <- sub(".*?LoC No.\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  original_pub <- sub(".*?Original Publication\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  credits <- sub(".*?Credits\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  language <- sub(".*?Language\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  loc_class <- sub(".*?LoC Class\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  subject <- sub(".*?Subject\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  ebook_no <- sub(".*?EBook-No.\\s*\\n\\n(\\d+)", "\\1", bibrec_text)
  release_date <- sub(".*?Release Date\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  category <- sub(".*?Category\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  copyright_status <- sub(".*?Copyright Status\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text)
  downloads <- sub(".*?Downloads\\s*(\\d+ downloads).*", "\\1", bibrec_text)
  
  # If no match is found, return an empty string
  title <- ifelse(is.na(title), "", title)
  author <- ifelse(is.na(author), "", author)
  loc_no <- ifelse(is.na(loc_no), "", loc_no)
  original_pub <- ifelse(is.na(original_pub), "", original_pub)
  credits <- ifelse(is.na(credits), "", credits)
  language <- ifelse(is.na(language), "", language)
  loc_class <- ifelse(is.na(loc_class), "", loc_class)
  subject <- ifelse(is.na(subject), "", subject)
  ebook_no <- ifelse(is.na(ebook_no), "", ebook_no)
  release_date <- ifelse(is.na(release_date), "", release_date)
  category <- ifelse(is.na(category), "", category)
  copyright_status <- ifelse(is.na(copyright_status), "", copyright_status)
  downloads <- ifelse(is.na(downloads), "", downloads)
  
  # Print the collected information
  # cat("Title:", title, "\n")
  # cat("Author:", author, "\n")
  # cat("LoC No.:", loc_no, "\n")
  # cat("Original Publication:", original_pub, "\n")
  # cat("Credits:", credits, "\n")
  # cat("Language:", language, "\n")
  # cat("LoC Class:", loc_class, "\n")
  cat("Subject:", subject, "\n")
  # cat("EBook No:", ebook_no, "\n")
  # cat("Release Date:", release_date, "\n")
  # cat("Category:", category, "\n")
  # cat("Copyright Status:", copyright_status, "\n")
  # cat("Downloads:", downloads, "\n")
  cat("--------------------------------------\n")
}
