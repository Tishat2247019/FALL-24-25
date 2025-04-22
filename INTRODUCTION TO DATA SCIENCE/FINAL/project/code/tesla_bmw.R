install.packages("rvest")
install.packages("tm")
install.packages("topicmodels")
install.packages("ggplot2")
install.packages("tidytext")
install.packages("dplyr")

library(rvest)
library(dplyr)
library(tm)
library(topicmodels)
library(ggplot2)
library(tidytext)

process_reviews <- function(url, num_topics, title) {
  webpage <- read_html(url)
  reviews <- webpage %>%
    html_elements(".typography_color-black__wpn7m") %>%
    html_text()
  
  print(head(reviews))
  
  review_corpus <- Corpus(VectorSource(reviews))
  
  review_corpus <- tm_map(review_corpus, content_transformer(tolower))
  review_corpus <- tm_map(review_corpus, removePunctuation)
  review_corpus <- tm_map(review_corpus, removeNumbers)
  review_corpus <- tm_map(review_corpus, removeWords, stopwords("en"))
  review_corpus <- tm_map(review_corpus, stripWhitespace)
  
  review_dtm <- DocumentTermMatrix(review_corpus)
  review_dtm <- removeSparseTerms(review_dtm, 0.99)  # Remove sparse terms
  
  inspect(review_dtm[1:5, 1:5])
  
  
  lda_model <- LDA(review_dtm, k = num_topics, control = list(seed = 1234))
  
  term_probs <- tidy(lda_model)
  print(term_probs)
  
  top_terms <- term_probs %>%
    group_by(topic) %>%
    arrange(desc(beta)) %>%
    slice_head(n = 10) %>%
    ungroup() %>%
    mutate(term = reorder_within(term, beta, topic))
  
  ggplot(top_terms, aes(term, beta, fill = factor(topic))) +
    geom_col(show.legend = FALSE) +
    facet_wrap(~ topic, scales = "free", ncol = 3) +
    coord_flip() +
    scale_x_reordered() +
    labs(title = paste("Word Probabilities by Topic (", title, ")", sep = ""),
         x = "Keywords/Terms",
         y = "Probability (Beta)") +
    theme_minimal() +
    theme(axis.text.y = element_text(size = 8))
}

process_reviews(
  url = "https://www.trustpilot.com/review/tesla.com",
  num_topics = 15,
  title = "Tesla"
)

process_reviews(
  url = "https://www.trustpilot.com/review/bmw.co.uk",
  num_topics = 15,
  title = "BMW"
)
