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

# Tesla Reviews
tesla_url <- "https://www.trustpilot.com/review/tesla.com"
tesla_webpage <- read_html(tesla_url)

tesla_reviews <- tesla_webpage %>%
  html_elements(".typography_color-black__wpn7m") %>%
  html_text()

print(head(tesla_reviews))

tesla_corpus <- Corpus(VectorSource(tesla_reviews))

tesla_corpus <- tm_map(tesla_corpus, content_transformer(tolower))
tesla_corpus <- tm_map(tesla_corpus, removePunctuation)
tesla_corpus <- tm_map(tesla_corpus, removeNumbers)
tesla_corpus <- tm_map(tesla_corpus, removeWords, stopwords("en"))
tesla_corpus <- tm_map(tesla_corpus, stripWhitespace)

tesla_dtm <- DocumentTermMatrix(tesla_corpus)

inspect(tesla_dtm[1:5, 1:5])

tesla_num_topics <- 15

tesla_lda_model <- LDA(tesla_dtm, k = tesla_num_topics, control = list(seed = 1234))

tesla_term_probs <- tidy(tesla_lda_model)

print(tesla_term_probs)

tesla_top_terms <- tesla_term_probs %>%
  group_by(topic) %>%
  arrange(desc(beta)) %>%
  slice_head(n = 10) %>%
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic))

ggplot(tesla_top_terms, aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Word Probabilities by Topic (Tesla)",
       x = "Keywords/Terms",
       y = "Probability (Beta)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8))






# BMW Reviews
bmw_url <- "https://www.trustpilot.com/review/bmw.co.uk"
bmw_webpage <- read_html(bmw_url)

bmw_reviews <- bmw_webpage %>%
  html_elements(".typography_color-black__wpn7m") %>%
  html_text()

print(head(bmw_reviews))

bmw_corpus <- Corpus(VectorSource(bmw_reviews))

bmw_corpus <- tm_map(bmw_corpus, content_transformer(tolower))
bmw_corpus <- tm_map(bmw_corpus, removePunctuation)
bmw_corpus <- tm_map(bmw_corpus, removeNumbers)
bmw_corpus <- tm_map(bmw_corpus, removeWords, stopwords("en"))
bmw_corpus <- tm_map(bmw_corpus, stripWhitespace)

bmw_dtm <- DocumentTermMatrix(bmw_corpus)

inspect(bmw_dtm[1:5, 1:5])

bmw_num_topics <- 15

bmw_lda_model <- LDA(bmw_dtm, k = bmw_num_topics, control = list(seed = 1234))

bmw_term_probs <- tidy(bmw_lda_model)

print(bmw_term_probs)

bmw_top_terms <- bmw_term_probs %>%
  group_by(topic) %>%
  arrange(desc(beta)) %>%
  slice_head(n = 10) %>%
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic))

ggplot(bmw_top_terms, aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Word Probabilities by Topic (BMW)",
       x = "Keywords/Terms",
       y = "Probability (Beta)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8))
