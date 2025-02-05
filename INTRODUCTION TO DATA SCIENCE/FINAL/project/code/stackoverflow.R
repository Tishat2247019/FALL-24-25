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
url <- "https://stackoverflow.com/questions/927358/how-do-i-undo-the-most-recent-local-commits-in-git"

# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract headlines (adjust the CSS selector to match the target site's structure)
headlines <- webpage %>%
  html_elements(".comment-copy") %>%  # Example CSS selector
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
num_topics <- 10

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

# Filter top terms per topic
top_terms <- term_probs %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%  # Select the top 10 terms for each topic based on beta (probability)
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic))  # Reorder terms within each topic for visualization

# Create bar plot to represent probabilities
ggplot(top_terms, aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free", ncol = 3) +  # Split into facets for each topic
  coord_flip() +                                   # Flip the axes for horizontal bars
  scale_x_reordered() +
  labs(title = "Word Probabilities by Topic", 
       x = "Keywords/Terms", 
       y = "Probability (Beta)") +
  theme_minimal()

# Comments:
# 1. Added tidy() from tidytext to extract term probabilities from the LDA model.
# 2. Used slice_max() to focus on the top 10 terms with the highest probability for each topic.
# 3. Reordered terms within each topic using reorder_within() for visualization.
# 4. Created a bar plot using ggplot2 to display probabilities, with faceting for separate topics.
# 5. Each bar represents a keyword and its corresponding probability weight.