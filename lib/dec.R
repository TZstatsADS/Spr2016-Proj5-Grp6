source("../lib/enc.R")
source("../lib/inD.R")
dec = function(string){
  num = toNumber(string)
  s = rep(0,26)
  for(i in 1:26){
    dec = lapply(num,`+`,i) %>%
      lapply(`%%`,26) %>%
      toSentence()
    dec = strsplit(dec,split=" ")[[1]]
    #print(dec)
    score = sapply(dec,inD,dic)
    score = sum(score)
    #print(score)
    s[i]=score
  }
  key = which.max(s)
  print(paste("The key is shifting",key,sep=" "))
  out = enc(string,key)
  return(out)
}