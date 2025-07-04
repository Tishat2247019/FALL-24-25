# Load the necessary library
install.packages('rvest')
library(rvest)
library(dplyr)

# List of book URLs
book_urls <- c(
  "https://www.gutenberg.org/ebooks/74880",
  "https://www.gutenberg.org/ebooks/74839",
  "https://www.gutenberg.org/ebooks/74879",
  "https://www.gutenberg.org/ebooks/74838",
  "https://www.gutenberg.org/ebooks/74878",
  "https://www.gutenberg.org/ebooks/74872",
  "https://www.gutenberg.org/ebooks/32032",
  "https://www.gutenberg.org/ebooks/32033", 
  "https://www.gutenberg.org/ebooks/32080",
  "https://www.gutenberg.org/ebooks/33060",
  "https://www.gutenberg.org/ebooks/32060",
  "https://www.gutenberg.org/ebooks/37060",
  "https://www.gutenberg.org/ebooks/34870",
  "https://www.gutenberg.org/ebooks/31670",
  "https://www.gutenberg.org/ebooks/34567"
  
  
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
summary <-c()
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
  illustrator <- if (grepl("Illustrator\\s*\\n\\n", bibrec_text)) sub(".*?Illustrator\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  loc_no <- if (grepl("LoC No.\\s*\\n\\n", bibrec_text)) sub(".*?LoC No.\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  original_pub <- if (grepl("Original Publication\\s*\\n\\n", bibrec_text)) sub(".*?Original Publication\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  credits_val <- if (grepl("Credits\\s*\\n\\n", bibrec_text)) sub(".*?Credits\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  language <- if (grepl("Language\\s*\\n", bibrec_text)) sub(".*?Language\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  loc_class <- if (grepl("LoC Class\\s*\\n\\n", bibrec_text)) sub(".*?LoC Class\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  subject <- if (grepl("Subject\\s*\\n\\n\\n", bibrec_text)) sub(".*?Subject\\s*\\n\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  ebook_no <- if (grepl("EBook-No.\\s*\\n", bibrec_text)) sub(".*?EBook-No.\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  release_date <- if (grepl("Release Date\\s*\\n", bibrec_text)) sub(".*?Release Date\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  category <- if (grepl("Category\\s*\\n", bibrec_text)) sub(".*?Category\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  summaryy <- if (grepl("Summary\\s*\\n\\n", bibrec_text)) sub(".*?Summary\\s*\\n\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  copyright_status <- if (grepl("Copyright Status\\s*\\n", bibrec_text)) sub(".*?Copyright Status\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  downloads_val <- if (grepl("Downloads\\s*", bibrec_text)) sub(".*?Downloads\\s*\\n(.*?)\\n.*", "\\1", bibrec_text) else NA
  
  # Append the scraped information to vectors
  titles <- c(titles, title)
  authors <- c(authors, author)
  illustrators <- c(illustrators, illustrator)
  loc_nos <- c(loc_nos, loc_no)
  original_pubs <- c(original_pubs, original_pub)
  credits <- c(credits, credits_val)
  languages <- c(languages, language)
  loc_classes <- c(loc_classes, loc_class)
  subjects <- c(subjects, subject)
  ebook_nos <- c(ebook_nos, ebook_no)
  release_dates <- c(release_dates, release_date)
  categories <- c(categories, category)
  summary <- c(summary, summaryy)
  copyright_statuses <- c(copyright_statuses, copyright_status)
  downloads <- c(downloads, downloads_val)
}

# Create a dataframe with consistent columns
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
  Summary = summary,
  Copyright_Status = copyright_statuses,
  Downloads = downloads,
  stringsAsFactors = FALSE
)

# View the dataframe
book_df <- tibble(book_df)
print(book_df, n = nrow(book_df))
nrow(book_df)
book_df
str(book_df)


install.packages("stringr")
library(stringr)

# Function to clean text
clean_text <- function(text, flag = TRUE) {
  text <- tolower(text)                             # Convert to lowercase
  text <- str_replace_all(text, "<.*?>", "")         # Remove HTML tags
  text <- str_replace_all(text, "[^a-z0-9\\s]", "")    #Keep numbers but remove special characters
  if(flag)
    text <- str_replace_all(text, "[0-9]", "")        # Remove numbers
  text <- str_squish(text)                           # Remove extra white spaces
  return(text)
}

# Function to remove numbers from text
remove_numbers <- function(text) {
  text <- str_replace_all(text, "[0-9]", "")        # Remove numbers
  return(text)
}

# Apply cleaning to each column in the dataframe
book_df_clean <- book_df %>%
  mutate(
    Title = clean_text(Title, TRUE),
    Author = clean_text(Author, TRUE),
    Illustrator = clean_text(Illustrator, TRUE),
    LoC_No = clean_text(LoC_No, FALSE),
    Original_Pub = clean_text(Original_Pub, TRUE),
    Credits = clean_text(Credits, TRUE),
    Language = clean_text(Language, TRUE),
    LoC_Class = clean_text(LoC_Class, TRUE),
    Subject = clean_text(Subject, TRUE),
    EBook_No = clean_text(EBook_No, FALSE),
    Release_Date = clean_text(Release_Date, FALSE),
    Category = clean_text(Category, TRUE),
    Summary = clean_text(Summary, TRUE),
    Copyright_Status = clean_text(Copyright_Status, TRUE),
    Downloads = clean_text(Downloads, FALSE),
  )
# View cleaned dataframe
print(book_df_clean)

install.packages("tidytext")
library(tidytext)
library(dplyr)



book_df_clean_tokenized <- book_df_clean %>%
  rowwise() %>%
  mutate(across(everything(), ~ {
    if (is.na(.)) {
      return(NA)  # Leave NA values untouched
    } else {
      clean_text <- str_replace_all(., "\\s+", " ")  # Remove extra spaces
      clean_text <- str_trim(clean_text)             # Trim leading and trailing spaces
      tokens <- unlist(str_split(clean_text, " "))    # Split the text into words
      quoted_tokens <- paste0('"', tokens, '"')      # Add double quotes around each token
      paste(quoted_tokens, collapse = ", ")          # Combine tokens back with commas
    }
  })) %>%
  ungroup()

# View the result
book_df_clean_tokenized
write_xlsx(book_df_clean_tokenized, "E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/MID/Mid Term Project/nlp/book_df_clean_tokenized.xlsx")


install.packages("stopwords")
library(stopwords)

book_df_clean_no_stopwords <- book_df_clean_tokenized %>%
  rowwise() %>%
  mutate(across(everything(), ~ {
    if (is.na(.)) {
      return(NA)  # Leave NA as is
    } else {
      # Split the tokens by ", ", remove extra spaces, and clean any quotes
      tokens <- str_split(., ", ") %>%
        unlist() %>%
        str_trim() %>%
        str_remove_all('^"|"$')  # Remove leading and trailing quotes
      
      # Remove stop words
      filtered_tokens <- tokens[!tokens %in% stop_words]
      
      # Handle cases where no tokens remain after filtering
      if (length(filtered_tokens) == 0) {
        return(NA)  # If no tokens remain, set to NA
      } else {
        return(paste0('"', filtered_tokens, '"', collapse = ", "))  # Recombine tokens
      }
    }
  })) %>%
  ungroup()
# View the cleaned dataset
head(book_df_clean_no_stopwords)



# Add lemmatization with a check for numerical transformations
book_df_clean_lemmatized <- book_df_clean_tokenized %>%
  rowwise() %>%
  mutate(across(everything(), ~ {
    if (is.na(.)) {
      return(NA)  # Leave NA as is
    } else {
      # Split the tokens by ", ", remove extra spaces, and clean any quotes
      tokens <- str_split(., ", ") %>%
        unlist() %>%
        str_trim() %>%
        str_remove_all('^"|"$')  # Remove leading and trailing quotes
      
      # Remove stop words
      filtered_tokens <- tokens[!tokens %in% stop_words]
      
      # Apply lemmatization while preventing numerical transformations
      lemmatized_tokens <- lemmatize_words(filtered_tokens)
      
      # Revert lemmatized numbers (e.g., "2") back to their original words
      lemmatized_tokens <- ifelse(lemmatized_tokens %in% as.character(0:9), filtered_tokens, lemmatized_tokens)
      
      # Handle cases where no tokens remain after filtering
      if (length(lemmatized_tokens) == 0) {
        return(NA)  # If no tokens remain, set to NA
      } else {
        return(paste0('"', lemmatized_tokens, '"', collapse = ", "))  # Recombine tokens
      }
    }
  })) %>%
  ungroup()

# View the cleaned and lemmatized dataset
head(book_df_clean_lemmatized)

final_cleaned_dataset <- book_df_clean_lemmatized;


library(writexl)
write_xlsx(final_cleaned_dataset, "E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/MID/Mid Term Project/nlp/final_cleaned_dataset.xlsx")


