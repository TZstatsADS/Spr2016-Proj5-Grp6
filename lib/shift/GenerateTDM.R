tdm.generate <- function(string, ng){
    corpus <- Corpus(VectorSource(string)) # create corpus for TM processing
    corpus <- tm_map(corpus, content_transformer(tolower))
    corpus <- tm_map(corpus, removeNumbers) 
    corpus <- tm_map(corpus, removePunctuation)
    corpus <- tm_map(corpus, stripWhitespace)
    # corpus <- tm_map(corpus, removeWords, stopwords("english")) 
    options(mc.cores=1)
    BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = ng, max = ng)) # create n-grams
    tdm <- TermDocumentMatrix(corpus, control = list(tokenize = BigramTokenizer)) # create tdm from n-grams
    tdm
}