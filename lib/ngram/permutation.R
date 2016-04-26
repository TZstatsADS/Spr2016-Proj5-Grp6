#lay out the letters in a 5 * 5 square  
m<-matrix(substring("who is that cute girl?XXX", 1:25, 1:25),5,5,byrow = T)
#present the encrypted message  
mm<-paste(m, collapse = "") 
#lay out the encrypted message in a 5 * 5 square  
mmm<-matrix(substring(mm, 1:25, 1:25),5,5,byrow = T)
#present the decrypted message  
mmmm<-paste(mmm, collapse = "")
