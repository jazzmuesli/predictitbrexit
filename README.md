# predictitbrexit
Combine predictit brexit market and FX GBPEUR, GBPUSD, GBPJPY

Exchange rates provided by https://www.ofx.com/en-gb/forex-news/historical-exchange-rates/ and predictit by https://www.predictit.org/markets/detail/4672/Will-the-United-Kingdom-officially-exit-the-European-Union-by-March-29

The best predictor for CloseSharePrice on predictit is GBPCHF rate:

> summary(lm(CloseSharePrice~., m[,grep("scaled|Close", names(m))]))

Call:
lm(formula = CloseSharePrice ~ ., data = m[, grep("scaled|Close", 
    names(m))])

Residuals:
      Min        1Q    Median        3Q       Max 
-0.153615 -0.041716 -0.002675  0.041977  0.136111 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)    1.2189     1.2303   0.991  0.32495    
GBPCHFscaled  -4.8068     0.9229  -5.208 1.58e-06 ***
GBPEURscaled   4.4713     1.6864   2.651  0.00975 ** 
GBPJPYscaled   3.9413     1.1852   3.325  0.00136 ** 
GBPUSDscaled  -4.3466     1.9358  -2.245  0.02765 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.06785 on 76 degrees of freedom
Multiple R-squared:  0.3849,	Adjusted R-squared:  0.3526 
F-statistic: 11.89 on 4 and 76 DF,  p-value: 1.49e-07


![AN attempt to create flopsy bunny brexit indicatort](flopsybunny.jpg "Flopsy Bunny")

