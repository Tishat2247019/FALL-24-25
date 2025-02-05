# Install Required Packages
install.packages("rvest")      # For web scraping
install.packages("tm")         # For text mining
install.packages("topicmodels") # For LDA topic modeling
install.packages("ggplot2")    # For data visualization
install.packages("tidytext")   # For text tidying
install.packages("dplyr")      # For data manipulation

######################
# Web Scraping Text Data
# Load libraries
library(rvest)
library(dplyr)

# Define the URL to scrape
url <- "https://www.bbc.com/news"

# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract headlines (adjust the CSS selector to match the target site's structure)
headlines <- webpage %>%
  html_elements("#main-content p") %>%  # Example CSS selector
  html_text()

# Display the scraped data
print(headlines)

##########################
# Data Preparation
# Load the tm library for text cleaning
library(tm)

# Create a text corpus
corpus <- Corpus(VectorSource(headlines))

# Preprocess the text data
corpus <- tm_map(corpus, content_transformer(tolower)) # Convert to lowercase
corpus <- tm_map(corpus, removePunctuation)           # Remove punctuation
corpus <- tm_map(corpus, removeNumbers)               # Remove numbers
corpus <- tm_map(corpus, removeWords, stopwords("en")) # Remove stopwords
corpus <- tm_map(corpus, stripWhitespace)             # Strip extra whitespace

##############################
# Create Document-Term Matrix (DTM)
# Create a Document-Term Matrix
dtm <- DocumentTermMatrix(corpus)

# Inspect the DTM
inspect(dtm[1:5, 1:5])

############################
# Topic Modeling with LDA
# Load topicmodels library
library(topicmodels)

# Set the number of topics
num_topics <- 15

# Fit the LDA model
lda_model <- LDA(dtm, k = num_topics, control = list(seed = 1234))

# Get the term probabilities for each topic
term_probs <- tidy(lda_model)

# Print term probabilities for inspection
print(term_probs)

#############################
# Visualize Weights/Probabilities of Keywords
# Load ggplot2 and tidytext for visualization
library(ggplot2)
library(tidytext)


# Calculate variance of beta values for each topic
topic_variances <- term_probs %>%
  group_by(topic) %>%
  summarize(variance = var(beta), .groups = "drop")  # Calculate variance of beta for each topic

# Filter topics with high variance
high_variance_topics <- topic_variances %>%
  filter(variance > 0.0001)  # Adjust threshold as needed

# Keep only terms for high-variance topics
filtered_terms <- term_probs %>%
  filter(topic %in% high_variance_topics$topic) %>%
  group_by(topic) %>%
  arrange(desc(beta)) %>%  # Sort terms by beta within each topic
  slice_head(n = 10) %>%  # Select top 10 terms for each topic
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic))  # Reorder terms for visualization

# Visualize filtered topics
ggplot(filtered_terms, aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "High-Variance Word Probabilities by Topic",
       x = "Keywords/Terms",
       y = "Probability (Beta)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8))  # Adjust text size for readability
