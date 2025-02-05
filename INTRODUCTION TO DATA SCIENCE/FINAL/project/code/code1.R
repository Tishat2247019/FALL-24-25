#Install Required Packages
install.packages("rvest")      # For web scraping
install.packages("tm")         # For text mining
install.packages("topicmodels") # For LDA topic modeling



######################
#Web Scraping Text Data
# Load libraries
library(rvest)
library(dplyr)

# Define the URL to scrape
url <- "https://www.bbc.com/news"

# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract headlines (adjust the CSS selector to match the target site's structure)
headlines <- webpage %>%
  html_elements(".dhclWg") %>%  # Example CSS selector
  html_text()

# Display the scraped data
print(headlines)



##########################
#Data Preparation
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
#Topic Modeling with LDA
# Load topicmodels library
library(topicmodels)

# Set the number of topics
num_topics <- 5

# Fit the LDA model
lda_model <- LDA(dtm, k = num_topics, control = list(seed = 1234))

# View the top terms in each topic
topics <- terms(lda_model, 5)  # Top 5 terms per topic
print(topics)

#############################
#Analyze and Interpret Results
# Get topic proportions for each document
topic_proportions <- posterior(lda_model)$topics

# Assign dominant topic for each document
dominant_topic <- apply(topic_proportions, 1, which.max)

# Display results
print(data.frame(Document = seq_along(headlines), 
                 Headline = headlines, 
                 Topic = dominant_topic))


