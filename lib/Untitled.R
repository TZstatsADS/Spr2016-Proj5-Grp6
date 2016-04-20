toSentence = function(list){
  ascii = lapply(list, `+`, 97) %>%
    lapply(intToUtf8) %>%
    lapply(paste, sep = "")
  S = paste(ascii, collapse = " ")
}