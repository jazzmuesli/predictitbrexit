

for ccy in `echo USD JPY EUR CHF`;
do
curl "https://api.ofx.com/PublicSite.ApiService/SpotRateHistory/5year/GBP/$ccy?DecimalPlaces=6&ReportingInterval=daily" -H 'Origin: https://www.ofx.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-GB' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://www.ofx.com/en-gb/forex-news/historical-exchange-rates/' -H 'Connection: keep-alive' --compressed > GBP${ccy}.json
done

#curl 'https://api.ofx.com/PublicSite.ApiService/SpotRateHistory/5year/GBP/USD?DecimalPlaces=6&ReportingInterval=daily' -H 'Origin: https://www.ofx.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-GB' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://www.ofx.com/en-gb/forex-news/historical-exchange-rates/' -H 'Connection: keep-alive' --compressed > gbpusd.json
#wget "https://www.predictit.org/Resource/DownloadMarketChartData?marketid=4672&timespan=90d" -Opredictit.csv
