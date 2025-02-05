# List of required libraries
required_libraries <- c("tidyverse", "tidytext", "topicmodels", "tm", "rvest")

# Install missing libraries
install_if_missing <- function(libraries) {
  for (lib in libraries) {
    if (!requireNamespace(lib, quietly = TRUE)) {
      install.packages(lib)
    }
  }
}

install.packages("reshape2")

# Install the required libraries
install_if_missing(required_libraries)

# Load the libraries
library(tidyverse)
library(tidytext)
library(topicmodels)
library(tm)
library(rvest)
library(reshape2)


# Function to visualize top terms for topics
top_terms_by_topic_LDA <- function(dtm, lda_model, top_n = 10) {
  # Extract terms and beta values
  terms_topics <- tidy(lda_model, matrix = "beta")
  
  # Get top terms for each topic
  top_terms <- terms_topics %>%
    group_by(topic) %>%
    top_n(top_n, beta) %>%
    ungroup() %>%
    arrange(topic, -beta)
  
  # Plot the top terms by topic
  ggplot(top_terms, aes(x = reorder_within(term, beta, topic), y = beta, fill = factor(topic))) +
    geom_col(show.legend = FALSE) +
    facet_wrap(~topic, scales = "free_y") +
    coord_flip() +
    scale_x_reordered() +
    labs(
      title = "Top Terms in Each Topic",
      x = NULL, y = "Beta Value"
    ) +
    theme_minimal()
}

# Step 1: Web Scraping BBC News
# Example URL: https://www.bbc.com/news
url <- "https://www.reuters.com/"
bbc_page <- read_html(url)

# Extract headlines and article descriptions
headlines <- bbc_page %>% 
  html_nodes("title__heading__s7Jan") %>% 
  html_text()

descriptions <- bbc_page %>%
  html_nodes(".story-card__area-description__2JiBp") %>%
  html_text()

# Combine headlines and descriptions
documents <- paste(headlines, descriptions, sep = ". ")

# Convert to a data frame
news_data <- data.frame(text = documents, stringsAsFactors = FALSE)

# Step 2: Text Preprocessing
corpus <- Corpus(VectorSource(news_data$text))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("en"))
corpus <- tm_map(corpus, stripWhitespace)

# Step 3: Create Document-Term Matrix (DTM)
dtm <- DocumentTermMatrix(corpus)

# Remove sparse terms to improve efficiency
dtm <- removeSparseTerms(dtm, 0.98)

# Step 4: Apply LDA Topic Modeling
set.seed(1234)  # For reproducibility
num_topics <- 10  # Specify the number of topics
lda_model <- LDA(dtm, k = num_topics, control = list(seed = 1234))

# Step 5: Visualize Top Terms for Each Topic
top_terms_by_topic_LDA(dtm, lda_model, top_n = 10)

