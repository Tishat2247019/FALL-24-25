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
url <- "https://www.nytimes.com/international/"

# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract headlines (adjust the CSS selector to match the target site's structure)
headlines <- webpage %>%
  html_elements(".summary-class") %>%  # Example CSS selector
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

# Print term probabilities for inspectionhttp://127.0.0.1:10865/graphics/plot_zoom_png?width=1904&height=970
print(term_probs)

#############################
# Visualize Weights/Probabilities of Keywords
# Load ggplot2 and tidytext for visualization
library(ggplot2)
library(tidytext)

# Filter top terms per topic
top_terms <- term_probs %>%
  group_by(topic) %>%
  arrange(desc(beta)) %>%  # Ensure terms are sorted by beta within each topic
  slice_head(n = 10) %>%  # Select exactly 10 terms for each topic
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic))  # Reorder terms within topics for visualization

# Create bar plot with improved filtering
ggplot(top_terms, aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Word Probabilities by Topic",
       x = "Keywords/Terms",
       y = "Probability (Beta)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8))  # Adjust text size for better readability


# Comments:
# 1. Added tidy() from tidytext to extract term probabilities from the LDA model.
# 2. Used slice_max() to focus on the top 10 terms with the highest probability for each topic.
# 3. Reordered terms within each topic using reorder_within() for visualization.
# 4. Created a bar plot using ggplot2 to display probabilities, with faceting for separate topics.
# 5. Each bar represents a keyword and its corresponding probability weight.