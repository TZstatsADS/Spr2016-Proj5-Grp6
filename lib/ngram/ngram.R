#setwd("F:/CU Textbooks And Related Stuff/STAT W4249/Project5")
library(tm)
library(RWeka)
library(dplyr)
dat <- read.delim("F:/CU Textbooks And Related Stuff/STAT W4249/Project5/TheLittlePrince.txt", header=FALSE,stringsAsFactors=FALSE)
dat <- read.delim("TheLittlePrince.txt", header=FALSE,stringsAsFactors=FALSE)
dat <- dat[,2]
dat<-dat[dat!=""]
#View(as.matrix(dat))

source("GenerateTDM.R")
ng<-5
tdm <- tdm.generate(dat, ng)
tdm.matrix <- as.matrix(tdm)

# topwords <- rowSums(tdm.matrix)
# topwords <- as.numeric(topwords)
# hist(topwords, breaks = 100)
# findFreqTerms(tdm, lowfreq = 50)
# findFreqTerms(tdm, lowfreq = 100)
# head(sort(topwords, decreasing = TRUE))

newmatrix<-matrix(0,nrow=nrow(tdm.matrix),ncol=2)
for(i in 1:nrow(tdm.matrix)){
        newmatrix[i,1]<-rownames(tdm.matrix)[i]
        newmatrix[i,2]<-sum(tdm.matrix[i,])
}

    
    
GetTheWholeText<-function(firststring,textlength,newmatrix,ng){
    TheWholeText<-firststring
    firststring.list<-as.matrix(strsplit(firststring,"[[:space:]]+"))
    for(i in 1:(textlength-length(firststring.list[[1]]))){
        term<-newmatrix[substr(newmatrix[,1],1,nchar(firststring))==firststring&substr(newmatrix[,1],nchar(firststring)+1,nchar(firststring)+1)==" ",]
        if(!is.null(dim(term)[1])){
            if(dim(term)[1]==0){
                return(TheWholeText)
            }
            else{
                term_max<-term[term[,2]==max(term[,2]),]
                if(!is.null(dim(term_max)[1])){
                    n<-nrow(term_max)
                    ind<-sample(1:n,1)
                    r<-term_max[ind,1]
                }
                else{
                    r<-term_max[1]
                }
            }
        }
        else{
            term_max<-term
            r<-term_max[1]
        }
        #term_max<-ifelse(dim(term)[1]>1,term[term[,2]==max(term[,2]),],term)
        
        r.list<-as.matrix(strsplit(r,"[[:space:]]+"))
        nextword<-r.list[[1]][ng]
        TheWholeText<-paste(TheWholeText,nextword)
        firststring<-nextword
        for(t in 1:(ng-2))
            firststring<- paste(r.list[[1]][ng-t],firststring)
        
        firststring.list<-as.matrix(strsplit(firststring,"[[:space:]]+"))
    }
    return(TheWholeText)
}

