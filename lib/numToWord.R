numToWord = function(input){
  ascii=apply(input, `+`, 97) %>%
    apply(intToUtf8) %>%
    apply(paste, collapse = "")
  return(ascii)
}