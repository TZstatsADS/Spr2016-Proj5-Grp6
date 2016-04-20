source("../lib/stringToWord")
toNumber = function(string){
  words = stringToWord(string)
  num = lapply(words,charToRaw) %>%
    lapply(as.numeric) %>%
    lapply(`-`,97)
  return(num)
}