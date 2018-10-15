library(ggcorrplot)
library(rjson)
readFX=function(pair) {
  x=rjson::fromJSON(file=paste0(pair,".json"))
  x$HistoricalPoints[[1]]
  data=data.frame(date=as.Date(sapply(x$HistoricalPoints, function(s) as.Date(as.POSIXct(as.numeric(s$PointInTime/1000),origin="1970-01-01")))),
                  rate=sapply(x$HistoricalPoints, function(s) s$InterbankRate))
  names(data)[2] = pair
  data
}
m=data.frame()
for (fname in list.files(pattern = "GBP")) {
  pair=gsub(".json","",fname)
  print(pair)
  rates=readFX(pair)
  rates[,paste0(pair,"scaled")]=rates[,pair]/median(rates[,pair])
  if (nrow(m)==0) {
    m=rates
  } else {
    m=merge(m,rates)
  }
}

predit = read.csv("predictit.csv")
predit$date=as.Date(predit$DateString)

m=merge(m, predit)
m=m[,grep("Price|GBP|Volume|date", names(m))]
cor(m[,grep("date", names(m),value=T, invert = T)])
write.csv(x = m, file="result.csv", row.names = F)
summary(lm(CloseSharePrice~., m[,grep("scaled|Close", names(m))]))
ggcorrplot(cor(m[,grep("date|scaled", names(m),value=T, invert = T)]),type="lower",lab=T)
ggsave("corrplot.png")
