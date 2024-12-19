# Sample input text
bibrec_text <- "Author\n\nHarris, Joel Chandler, 1848-1908\nIllustrator\n\nHerford, Oliver, 1863-1935\nTitle\n\nThe story of Aaron (so named) the son of Ben Ali :  Told by his friends and acquaintances\n\nOriginal Publication\n\nBoston: Houghton Mifflin Company, 1895.\n\nCredits\n\nDavid Edwards and the Online Distributed Proofreading Team at https://www.pgdp.net (This file was produced from images generously made available by The Internet Archive)\n\nLanguage\nEnglish\nCategory\nText\nEBook-No.\n74880\nRelease Date\nDec 11, 2024\nCopyright Status\nPublic domain in the USA.\nDownloads\n248 downloads in the last 30 days.\n\n\n\nProject Gutenberg eBooks are always free!"

# Use a regular expression to capture everything between "Author" and "Title"
# Capture everything between "Author" and "Title" without relying on newlines
 author1 <- sub(".*?Author(.*?)Title.*", "\\1", bibrec_text)
author <- sub(".*?Author\\n\\n(.*?)\\nTitle.*", "\\1", bibrec_text)



# Print the extracted author information
cat("Author Information:\n", author)
cat("Author Information:\n", author1)
