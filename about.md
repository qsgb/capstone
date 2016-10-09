# Data Science Capstone: Word predictor
Jian LIU  
  
## About 
The Coursera Data Science Capstone project is to build a predictive product which could predict the next word based on the words inputted. The prediction based on the English text database from the HC Corpora (http://www.corpora.heliohost.org) obtained by web crawler from twitters, news and blogs. I chose a simple back-off algorithm to perform the prediction base on the N-gram frequency data extracted from the raw data. 


## Prediction Algorithm
To constructed the data for prediction, I extracted the frequency data of N-grams (1 to 5 grams) by randomly selected 20000 text lines from the raw database. The frequency data were stored in a list of data frames. To perform the prediction, the last 4 words from the input text were looked up in the 5-grams model, if any items matched, the last word of the most frequent item were return as the predicted word, while the last word of the 2 items following were also returned to give flexible choice. If no items were matched, lower-order models (4-grams, 3-grams.) were sought as mentioned before. If still no item matched until the bi-gram model, the most frequent word from the 1-grams data was returned.
