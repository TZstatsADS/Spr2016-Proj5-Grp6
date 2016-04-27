source("../lib/stringToWord.R")
toNumber = function(string){
  words = stringToWord(string)
  num = lapply(words,charToRaw) %>%
    lapply(as.numeric) %>%
    lapply(`-`,97)
  return(num)
}