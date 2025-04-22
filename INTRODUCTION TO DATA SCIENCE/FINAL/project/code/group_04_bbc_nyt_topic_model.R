install.packages("rvest")      
install.packages("tm")         
install.packages("topicmodels") 
install.packages("ggplot2")    
install.packages("tidytext")   
install.packages("dplyr")      


library(rvest)
library(dplyr)

nyt_url <- "https://www.nytimes.com/international/"

nyt_webpage <- read_html(nyt_url)

nyt_headlines <- nyt_webpage %>%
  html_elements(".summary-class") %>%
  html_text()

print(nyt_headlines)


library(tm)

nyt_corpus <- Corpus(VectorSource(nyt_headlines))

nyt_corpus <- tm_map(nyt_corpus, content_transformer(tolower))
nyt_corpus <- tm_map(nyt_corpus, removePunctuation)           
nyt_corpus <- tm_map(nyt_corpus, removeNumbers)               
nyt_corpus <- tm_map(nyt_corpus, removeWords, stopwords("en"))
nyt_corpus <- tm_map(nyt_corpus, stripWhitespace)             


nyt_dtm <- DocumentTermMatrix(nyt_corpus)

inspect(nyt_dtm[1:5, 1:5])


library(topicmodels)

nyt_num_topics <- 15

nyt_lda_model <- LDA(nyt_dtm, k = nyt_num_topics, control = list(seed = 1234))

nyt_term_probs <- tidy(nyt_lda_model)

print(nyt_term_probs)


library(ggplot2)
library(tidytext)

nyt_top_terms <- nyt_term_probs %>%
  group_by(topic) %>%
  arrange(desc(beta)) %>%
  slice_head(n = 10) %>%
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic))

ggplot(nyt_top_terms, aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Word Probabilities by Topic (NYT)",
       x = "Keywords/Terms",
       y = "Probability (Beta)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8))


##

bbc_url <- "https://www.bbc.com/news"

bbc_webpage <- read_html(bbc_url)

bbc_headlines <- bbc_webpage %>%
  html_elements("#main-content p") %>%
  html_text()

print(bbc_headlines)

bbc_corpus <- Corpus(VectorSource(bbc_headlines))

bbc_corpus <- tm_map(bbc_corpus, content_transformer(tolower))
bbc_corpus <- tm_map(bbc_corpus, removePunctuation)
bbc_corpus <- tm_map(bbc_corpus, removeNumbers)
bbc_corpus <- tm_map(bbc_corpus, removeWords, stopwords("en"))
bbc_corpus <- tm_map(bbc_corpus, stripWhitespace)

bbc_dtm <- DocumentTermMatrix(bbc_corpus)

inspect(bbc_dtm[1:5, 1:5])

bbc_num_topics <- 15

bbc_lda_model <- LDA(bbc_dtm, k = bbc_num_topics, control = list(seed = 1234))

bbc_term_probs <- tidy(bbc_lda_model)

print(bbc_term_probs)

bbc_top_terms <- bbc_term_probs %>%
  group_by(topic) %>%
  arrange(desc(beta)) %>%
  slice_head(n = 10) %>%
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic))

ggplot(bbc_top_terms, aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Word Probabilities by Topic (BBC)",
       x = "Keywords/Terms",
       y = "Probability (Beta)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8))





