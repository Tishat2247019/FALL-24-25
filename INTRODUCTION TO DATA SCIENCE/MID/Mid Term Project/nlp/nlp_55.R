# Load the necessary library
install.packages('rvest')
library(rvest)

# List of book URLs
book_urls <- c(
  "https://www.gutenberg.org/ebooks/74880",
  "https://www.gutenberg.org/ebooks/74839",
  "https://www.gutenberg.org/ebooks/74879",
  "https://www.gutenberg.org/ebooks/74838",
  "https://www.gutenberg.org/ebooks/74878",
  "https://www.gutenberg.org/ebooks/74872",
  "https://www.gutenberg.org/ebooks/32032"
)

# Create vectors to store book metadata
titles <- c()
authors <- c()
illustrators <- c()
loc_nos <- c()
original_pubs <- c()
credits <- c()
languages <- c()
loc_classes <- c()
subjects <- c()
ebook_nos <- c()
release_dates <- c()
categories <- c()
copyright_statuses <- c()
downloads <- c()

# Loop through each URL and scrape the information
for (url in book_urls) {

    # Read the webpage content
  webpage <- read_html(url)
  bibrec <- html_node(webpage, '.bibrec')
  bibrec_text <- html_text(bibrec, trim = TRUE)
  
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
  # cat("Title:", title, "\n")
  # cat("Author:", author, "\n")
  # cat("Illustrator:", illustrator, "\n")
  # cat("LoC No.:", loc_no, "\n")
  # cat("Original Publication:", original_pub, "\n")
  # cat("Credits:", credits, "\n")
  # cat("Language:", language, "\n")
  # cat("LoC Class:", loc_class, "\n")
  # cat("Subject:", subject, "\n")
  # cat("EBook No:", ebook_no, "\n")
  # cat("Release Date:", release_date, "\n")
  # cat("Category:", category, "\n")
  # cat("Copyright Status:", copyright_status, "\n")
  # cat("Downloads:", downloads, "\n")
  # cat("--------------------------------------\n\n")
  
  # Append information to vectors
  titles <- c(titles, title)
  authors <- c(authors, author)
  illustrators <- c(illustrators, illustrator)
  loc_nos <- c(loc_nos, loc_no)
  original_pubs <- c(original_pubs, original_pub)
  credits <- c(credits, credits)
  languages <- c(languages, language)
  loc_classes <- c(loc_classes, loc_class)
  subjects <- c(subjects, subject)
  ebook_nos <- c(ebook_nos, ebook_no)
  release_dates <- c(release_dates, release_date)
  categories <- c(categories, category)
  copyright_statuses <- c(copyright_statuses, copyright_status)
  downloads <- c(downloads, downloads)
}

book_df <- data.frame(
  Title = titles,
  Author = authors,
  Illustrator = illustrators,
  LoC_No = loc_nos,
  Original_Pub = original_pubs,
  Credits = credits,
  Language = languages,
  LoC_Class = loc_classes,
  Subject = subjects,
  EBook_No = ebook_nos,
  Release_Date = release_dates,
  Category = categories,
  Copyright_Status = copyright_statuses,
  Downloads = downloads,
  stringsAsFactors = FALSE
)

print(book_df, n=nrow(book_df))
