inD = function(dec, dic){
    subL = toNumber(strsplit(dec, split="")[[1]][1])[[1]]+1
    score = sum(dec %in% dic[[subL]])
    return(score)
}