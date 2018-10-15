library(rjson)
readFX=function(pair) {
  x=rjson::fromJSON(file=paste0(pair,".json"))
  x$HistoricalPoints[[1]]
  data=data.frame(date=as.Date(sapply(x$HistoricalPoints, function(s) as.Date(as.POSIXct(as.numeric(s$PointInTime/1000),origin="1970-01-01")))),
                  rate=sapply(x$HistoricalPoints, function(s) s$InterbankRate))
  names(data)[2] = pair
  data
}

gbpeur=readFX("gbpeur")
gbpusd=readFX("gbpusd")
gbpjpy=readFX("gbpjpy")
predit = read.csv("predictit.csv")
predit$date=as.Date(predit$DateString)
m=merge(gbpeur,gbpusd)
m=merge(m, gbpjpy)
# scale each pair to its median over last 5 years and include 3 pairs in the basket.
m$gbpavg=(m$gbpeur/median(m$gbpeur)+m$gbpjpy/median(m$gbpjpy)+m$gbpusd/median(m$gbpusd))/3

m=merge(m, predit)
m=m[,grep("Price|gbp|Volume|date", names(m))]
cor(m[,grep("date", names(m),value=T, invert = T)])
write.csv(x = m, file="result.csv", row.names = F)
