install.packages('rvest')
library(rvest)
library(dplyr)

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


for (url in book_urls) {
  
 
  webpage <- read_html(url)
  bibrec <- html_node(webpage, '.bibrec')
  bibrec_text <- html_text(bibrec, trim = TRUE)
  
 
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


book_df <- tibble(book_df)
print(book_df, n = nrow(book_df))
nrow(book_df)
book_df
str(book_df)


install.packages("stringr")
library(stringr)


clean_text <- function(text, flag = TRUE) {
  text <- tolower(text)                             
  text <- str_replace_all(text, "<.*?>", "")        
  text <- str_replace_all(text, "[^a-z0-9\\s]", "")   
  if(flag)
    text <- str_replace_all(text, "[0-9]", "")        
  text <- str_squish(text)                          
  return(text)
}





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

print(book_df_clean)

install.packages("tidytext")
library(tidytext)

book_df_clean_tokenized <- book_df_clean %>%
  rowwise() %>%
  mutate(across(everything(), ~ {
    if (is.na(.)) {
      return(NA)  
    } else {
      clean_text <- str_replace_all(., "\\s+", " ")  
      clean_text <- str_trim(clean_text)             
      tokens <- unlist(str_split(clean_text, " "))    
      quoted_tokens <- paste0('"', tokens, '"')      
      paste(quoted_tokens, collapse = ", ")          
    }
  })) %>%
  ungroup()




install.packages("stopwords")
library(stopwords)
book_df_clean_tokenized

# book_df_clean_no_stopwords <- book_df_clean_tokenized %>%
#   rowwise() %>%
#   mutate(across(everything(), ~ {
#     if (is.na(.)) {
#       return(NA) 
#     } else {
#       
#       tokens <- str_split(., ", ") %>%
#         unlist() %>%
#         str_trim() %>%
#         str_remove_all('^"|"$')  
#       
#      
#       filtered_tokens <- tokens[!tokens %in% stop_words]
#       
#      
#       if (length(filtered_tokens) == 0) {
#         return(NA) 
#       } else {
#         return(paste0('"', filtered_tokens, '"', collapse = ", "))
#       }
#     }
#   })) %>%
#   ungroup()
# Clean dataset function
# Clean up stop_words vector
stop_words_clean <- str_trim(stop_words)  # Remove leading and trailing spaces
stop_words_clean <- str_remove_all(stop_words_clean, '^"|"$')  # Remove any surrounding quotes
stop_words
# Clean the stop_words_clean
# Remove everything outside quotes and properly split into a vector
stop_words_clean <- stop_words_clean %>%
  str_remove_all('^c\\(|\\)$') %>%  # Remove starting and ending 'c(' and ')'
  str_remove_all('\"') %>%         # Remove quotes
  str_trim() %>%                   # Remove leading/trailing spaces
  str_split(",\\s+") %>%          # Split by comma with spaces
  
  unlist()                         # Ensure it is a flat character vector



book_df_clean_no_stopwords <- book_df_clean_tokenized %>%
  rowwise() %>%
  mutate(across(everything(), ~ {
    # Skip stop-word removal for Title, Author, and Illustrator
    if (cur_column() %in% c("Title", "Author", "Illustrator")) {
      return(.)
    } else {
      if (is.na(.)) {
        return(NA) 
      } else {
        # Split tokens, remove unwanted characters, and filter stopwords
        tokens <- str_split(., ", ") %>%
          unlist() %>%
          str_trim() %>%
          str_remove_all('^"|"$')  
        
        # Filter out stopwords
        filtered_tokens <- tokens[!tokens %in% stop_words_clean]
        
        if (length(filtered_tokens) == 0) {
          return(NA) 
        } else {
          return(paste0('"', filtered_tokens, '"', collapse = ", "))
        }
      }
    }
  })) %>%
  ungroup()



# View the cleaned dataset
head(book_df_clean_no_stopwords)

install.packages("textstem")
library(textstem)

# book_df_clean_lemmatized <- book_df_clean_no_stopwords %>%
#   rowwise() %>%
#   mutate(across(everything(), ~ {
#     if (is.na(.)) {
#       return(NA) 
#     } else {
#       
#       # Step 1: Split the string into tokens
#       tokens <- str_split(., ", ") %>%
#         unlist() %>%
#         str_trim() %>%
#         str_remove_all('^"|"$')  
#       
#       # Step 2: Lemmatize the tokens
#       lemmatized_tokens <- lemmatize_words(tokens)
#       
#       # Step 3: If lemmatization results in numbers, retain the original tokens
#       lemmatized_tokens <- ifelse(lemmatized_tokens %in% as.character(0:9), tokens, lemmatized_tokens)
#       
#       # Step 4: Reconstruct tokens into a comma-separated string with quotes
#       if (length(lemmatized_tokens) == 0) {
#         return(NA)
#       } else {
#         return(paste0('"', lemmatized_tokens, '"', collapse = ", "))
#       }
#     }
#   })) %>%
#   ungroup()

book_df_clean_lemmatized <- book_df_clean_no_stopwords %>%
  rowwise() %>%
  mutate(across(everything(), ~ {
    # Skip stop-word removal for Title, Author, and Illustrator
    if (cur_column() %in% c("Title", "Author", "Illustrator")) {
      return(.)
    } else {
      if (is.na(.)) {
        return(NA) 
      } else {
        
        # Step 1: Split the string into tokens
        tokens <- str_split(., ", ") %>%
          unlist() %>%
          str_trim() %>%
          str_remove_all('^"|"$')  

        # Step 2: Lemmatize the tokens
        lemmatized_tokens <- lemmatize_words(tokens)

        # Step 3: If lemmatization results in numbers, retain the original tokens
        lemmatized_tokens <- ifelse(lemmatized_tokens %in% as.character(0:9), tokens, lemmatized_tokens)

        # Step 4: Reconstruct tokens into a comma-separated string with quotes
        if (length(lemmatized_tokens) == 0) {
          return(NA)
        } else {
          return(paste0('"', lemmatized_tokens, '"', collapse = ", "))
        }
      }
    }
  })) %>%
  ungroup()

book_df_clean_lemmatized1 <- book_df_clean_no_stopwords %>%
  rowwise() %>%
  mutate(across(everything(), ~ {
    # Skip stop-word removal for Title, Author, and Illustrator
    if (cur_column() %in% c("Title", "Author", "Illustrator")) {
      return(.)
    } else {
      if (is.na(.)) {
        return(NA) 
      } else {
        
        # Step 1: Split the string into tokens
        tokens <- str_split(., ", ") %>%
          unlist() %>%
          str_trim() %>%
          str_remove_all('^"|"$')  
        
        # Step 2: Lemmatize the tokens
        lemmatized_tokens <- lemmatize_words(tokens)
        
        # Step 3: If lemmatization results in numbers, retain the original tokens
        lemmatized_tokens <- ifelse(lemmatized_tokens %in% as.character(0:9), tokens, lemmatized_tokens)
        
        # Step 4: Reconstruct tokens into a comma-separated string with quotes
        if (length(lemmatized_tokens) == 0) {
          return(NA)
        } else {
          return(paste0('"', lemmatized_tokens, '"', collapse = ", "))
        }
      }
    }
  })) %>%
  ungroup()





final_cleaned_dataset <- book_df_clean_lemmatized;

check <- book_df_clean_lemmatized;
check
View(check)
write_xlsx(check, "E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/MID/Mid Term Project/nlp/check.xlsx")
check1 <- read_excel("E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/MID/Mid Term Project/nlp/check.xlsx");
check1

library(writexl)
write_xlsx(final_cleaned_dataset, "E:/FALL 24-25/INTRODUCTION TO DATA SCIENCE/MID/Mid Term Project/nlp/final_cleaned_dataset.xlsx")

correct <- final_cleaned_dataset
install.packages("hunspell")
library(hunspell)

# # Function to correct spelling
# correct_spelling <- function(text) {
#   # Split text into words
#   words <- unlist(str_split(text, " "))
#   
#   # Correct each word
#   corrected_words <- sapply(words, function(word) {
#     suggestions <- hunspell_check(word)
#     if (any(suggestions)) {
#       return(suggestions[1])  # Take the first suggestion
#     } else {
#       print(word)
#       return(word)  # Keep original if no suggestion is available
#     }
#   })
#   
#   # Reassemble the words without extra quotes
#   corrected_text <- paste(corrected_words, collapse = " ")
#   
#   return(corrected_text)
# }

correct_spelling <- function(text) {
  words <- unlist(str_split(text, " "))  # Split text into words
  words <- str_trim(words)  # Remove leading and trailing spaces
  words <- str_remove_all(words, "^\"|\"$")  # Clean unwanted quotes
  
  corrected_words <- sapply(words, function(word) {
    suggestions <- hunspell_check(word)
    if (any(suggestions)) {
      return(suggestions[1])  # If a suggestion is available, use the first one
    } else {
      return(word)  # Keep original if no suggestion is available
    }
  })
  
  return(paste(corrected_words, collapse = " "))
}

install.packages("spelling")

# Load the package
library(spelling)
correct_spelling1 <- function(text) {
  # Split the text into words
  words <- unlist(str_split(text, " "))
  
  # Clean unwanted characters from each word
  words <- str_trim(words)
  words <- str_remove_all(words, '^"|"$')
  
  # Correct each word using hunspell
  corrected_words <- sapply(words, function(word) {
    suggestions <- hunspell_check(word)
    if (length(suggestions) > 0) {
      return(suggestions[1])  # Use the top suggestion
    } else {
      return(word)  # Keep the original word if no suggestion is found
    }
  })
  
  # Combine corrected words back into a comma-separated string with quotes
  corrected_text <- paste0('"', corrected_words, '"', collapse = ", ")
  
  return(corrected_text)
}

  
  # Format words back into the required string with quotes
  corrected_text <- paste0('"', corrected_words, '"', collapse = ", ")
  
  return(corrected_text)
}


sample_text <- "\"morral\", \"lesson\", \"seccond\""
cleaned_text <- correct_spelling1(sample_text)
print(cleaned_text)


book_df_corrected <- check1 %>%
  rowwise() %>%
  mutate(across(everything(), ~ {
    if (is.na(.)) {
      return(NA) 
    } else {
      corrected_text <- correct_spelling(.)  # Apply the spelling correction
      return(corrected_text)
    }
  })) %>%
  ungroup()



# Check the cleaned dataset with spell corrections
head(book_df_corrected)

