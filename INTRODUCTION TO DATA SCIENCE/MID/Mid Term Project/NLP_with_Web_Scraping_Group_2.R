install.packages('rvest')
library(rvest)
webpage = read_html("https://www.gutenberg.org/ebooks/74880")

paragraph3 = html_nodes(webpage, '.bibrec')
# Converting the heading data to text
pTexte = html_text(paragraph3)

for (info in pTexte) {
  print(info)
  cat("\n")
}


# Print the top 6 data
# print(pTexte)

