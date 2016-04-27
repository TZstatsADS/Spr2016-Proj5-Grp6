dec = function(stringB){
  words = stringToWord(stringB)
  if(length(words)>5){
    string = paste(words[1:5], collapse = " ")
  }else{
    string = stringB}
  s = rep(0,26)
  for(i in 1:26){
    dec = enc(string,i)
    dec = strsplit(dec,split=" ")[[1]]
    score = sapply(dec,inD,dic)
    score = sum(score)
    s[i]=score
  }
  key = which.max(s)
  print(paste("The key is shifting",(26-key),sep=" "))
  out = enc(stringB,key)
  return(out)
}