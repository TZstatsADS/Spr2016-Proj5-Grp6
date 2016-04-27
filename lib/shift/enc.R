enc = function(string, k){
  num = toNumber(string)
  encN = lapply(num,`+`,k) %>%
    lapply(`%%`,26) 
  encS = toSentence(encN) 
  return(encS)
}