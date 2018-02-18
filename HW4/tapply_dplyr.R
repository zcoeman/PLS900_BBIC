
load("/Users/nickbichay/Desktop/ /aPLS 900/Week 4/polity_dataframe.rda")

#### With tapply

f  <-  function(x) c(mean = mean(x, na.rm=TRUE), median=median(x, na.rm=TRUE), sd = sd(x, na.rm=TRUE)) 

bound <- do.call(rbind, sapply(polity[,c('democ','autoc','polity2','xconst')], function(x) tapply(x, polity$year, f)))

stats <- matrix(bound, nrow=length(unique(polity$year)), ncol=12, 
                        dimnames=list( unique(polity$year),
                            c("democ_mean", "autoc_mean", "polity2_mean", "xconst_mean", "democ_median", "autoc_median", "polity2_median", "xconst_median", "democ_sd", "autoc_sd", "polity2_sd", "xconst_sd"))
                        )


#### With dplyr

library(dplyr)
 stats2 <- polity[,c('democ','autoc','polity2','xconst')] %>% group_by(polity$year) %>% summarise_all(funs(mean, median, sd), na.rm=TRUE)
