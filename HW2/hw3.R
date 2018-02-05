load("/Users/nickbichay/Desktop/ /aPLS 900/week3/polity_vectors.rda")

democ_factor_2016 <- democ_2016
democ_factor_2016[which(democ_2016 ==0)] <- 'Not a democracy'
democ_factor_2016[which(democ_2016 %in% 1:3)] <- 'Weak democracy'
democ_factor_2016[which(democ_2016 %in% 4:6)] <- 'Middle democracy'
democ_factor_2016[which(democ_2016 %in% 7:10)] <- 'High democracy'


table(democ_2016, democ_factor_2016, useNA="always")

# but still need to be put in order

democ_factor_2016 <- factor(democ_factor_2016,levels=c("Not a democracy", 
                                                        "Weak democracy", 
                                                        "Middle democracy", 
                                                        "High democracy"))

levels(democ_factor_2016)[levels(democ_factor_2016) %in% c("Weak democracy", "Middle democracy")] <- "ambiguous"


attributes(democ_factor_2016)