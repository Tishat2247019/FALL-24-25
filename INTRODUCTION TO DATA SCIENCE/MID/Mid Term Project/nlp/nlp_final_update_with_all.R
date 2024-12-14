# Load the necessary library
install.packages('rvest')
library(rvest)

# List of book URLs
book_urls2 <- c(
  "https://www.gutenberg.org/ebooks/74880",
  "https://www.gutenberg.org/ebooks/74839",
  "https://www.gutenberg.org/ebooks/74879",
  "https://www.gutenberg.org/ebooks/74838",
  "https://www.gutenberg.org/ebooks/74878",
  "https://www.gutenberg.org/ebooks/74872",
  "https://www.gutenberg.org/ebooks/32032"
)

# Loop through each URL and scrape the information
for (url in book_urls2) {
  cat("\nProcessing URL:", url, "\n")
  
  # Read the webpage content
  webpage <- tryCatch({
    read_html(url)
  }, error = function(e) {
    cat("Failed to read URL:", url, "\n")
    return(NULL)
  })
  
  if (is.null(webpage)) next
  
  # Scrape the bibrec element
  bibrec <- html_node(webpage, '.bibrec')
  if (is.null(bibrec)) {
    cat("No .bibrec element found.\n")
    next
  }
  
  # Extract text content from the bibrec element
  bibrec_text <- html_text(bibrec, trim = TRUE)
  
  # Debugging output to visualize the bibrec_text content
  # cat("\n--- Debugging Output for bibrec_text ---\n")
  # cat(bibrec_text, "\n")
  # cat("--------------------------------------\n")
  
  # Extract book information with pattern matching
  title <- if (grepl("Title\\s*\\n\\n", bibrec_text)) sub(".*?Title\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  author <- if (grepl("Author\\s*\\n\\n", bibrec_text)) sub(".*?Author\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  illustrator<- if (grepl("Illustrator\\s*\\n\\n", bibrec_text)) sub(".*?Illustrator\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  loc_no <- if (grepl("LoC No.\\s*\\n\\n", bibrec_text)) sub(".*?LoC No.\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  original_pub <- if (grepl("Original Publication\\s*\\n\\n", bibrec_text)) sub(".*?Original Publication\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  credits <- if (grepl("Credits\\s*\\n\\n", bibrec_text)) sub(".*?Credits\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  language <- if (grepl("Language\\s*\\n", bibrec_text)) sub(".*?Language\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  loc_class <- if (grepl("LoC Class\\s*\\n\\n", bibrec_text)) sub(".*?LoC Class\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  subject <- if (grepl("Subject\\s*\\n\\n\\n", bibrec_text)) sub(".*?Subject\\s*\\n\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  ebook_no <- if (grepl("EBook-No.\\s*\\n", bibrec_text)) sub(".*?EBook-No.\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  release_date <- if (grepl("Release Date\\s*\\n", bibrec_text)) sub(".*?Release Date\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  category <- if (grepl("Category\\s*\\n", bibrec_text)) sub(".*?Category\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  copyright_status <- if (grepl("Copyright Status\\s*\\n", bibrec_text)) sub(".*?Copyright Status\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  downloads <- if (grepl("Downloads\\s*", bibrec_text)) sub(".*?Downloads\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  
  # Print collected information
  # cat("Title:", ifelse(nzchar(title), title, "<Not Found>"), "\n")
  # cat("Author:", ifelse(nzchar(author), author, "<Not Found>"), "\n")
  # cat("Illustrator:", ifelse(nzchar(illustrator), illustrator, "<Not Found>"), "\n")
  # cat("LoC No.:", ifelse(nzchar(loc_no), loc_no, "<Not Found>"), "\n")
  # cat("Original Publication:", ifelse(nzchar(original_pub), original_pub, "<Not Found>"), "\n")
  # cat("Credits:", ifelse(nzchar(credits), credits, "<Not Found>"), "\n")
  # cat("Language:", ifelse(nzchar(language), language, "<Not Found>"), "\n")
  # cat("LoC Class:", loc_class, "\n")
  # # cat("LoC Class:", ifelse(nzchar(loc_class), loc_class, "<Not Found>"), "\n")
  # cat("Subject:", ifelse(nzchar(subject), subject, "<Not Found>"), "\n")
  # cat("EBook No:", ifelse(nzchar(ebook_no), ebook_no, "<Not Found>"), "\n")
  # cat("Release Date:", ifelse(nzchar(release_date), release_date, "<Not Found>"), "\n")
  # cat("Category:", ifelse(nzchar(category), category, "<Not Found>"), "\n")
  # cat("Copyright Status:", ifelse(nzchar(copyright_status), copyright_status, "<Not Found>"), "\n")
  # cat("Downloads:", ifelse(nzchar(downloads), downloads, "<Not Found>"), "\n")
  cat("Title:", title, "\n")
  cat("Author:", author, "\n")
  cat("Illustrator:", illustrator, "\n")
  cat("LoC No.:", loc_no, "\n")
  cat("Original Publication:", original_pub, "\n")
  cat("Credits:", credits, "\n")
  cat("Language:", language, "\n")
  cat("LoC Class:", loc_class, "\n")
  cat("Subject:", subject, "\n")
  cat("EBook No:", ebook_no, "\n")
  cat("Release Date:", release_date, "\n")
  cat("Category:", category, "\n")
  cat("Copyright Status:", copyright_status, "\n")
  cat("Downloads:", downloads, "\n")
  
  cat("--------------------------------------\n")
}
