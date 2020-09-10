#SERIA ICC
library(dplyr)
library(irr)

#load data
table_agg = read.csv("/Users/mplome/dev/STAGE2/testrestest.csv")
table_agg$subject = table_agg$subject - (table_agg$test_retest-1)*144

head(table_agg)
oldagg = table_agg[table_agg$age==1,]
yngagg= table_agg[table_agg$age==0,]
#2to prosak
#1anty
#old
protestoldagg = oldagg[oldagg$conditions==2 & oldagg$test_retest==1, ]
antitestoldagg = oldagg[oldagg$conditions==1 & oldagg$test_retest==1, ]
proretestoldagg = oldagg[oldagg$conditions==2 & oldagg$test_retest==2, ]
antiretestoldagg = oldagg[oldagg$conditions==1 & oldagg$test_retest==2, ]

#yng
protestyngagg = yngagg[yngagg$conditions==2 & yngagg$test_retest==1, ]
antitestyngagg = yngagg[yngagg$conditions==1 & yngagg$test_retest==1, ]
proretestyngagg = yngagg[yngagg$conditions==2 & yngagg$test_retest==2, ]
antiretestyngagg = yngagg[yngagg$conditions==1 & yngagg$test_retest==2, ]
###############################################################################################

########inhib_fial_prob############

####################################
############old#####################
####################################
#test
mprotestoldagg = protestoldagg %>%
  group_by(subject)%>%
  summarise(mean_inhib = mean(inhib_fail_prob))

mantitestoldagg = antitestoldagg %>%
  group_by(subject)%>%
  summarise(mean_inhib = mean(inhib_fail_prob))
#retest
mproretestoldagg = proretestoldagg %>%
  group_by(subject)%>%
  summarise(mean_inhib = mean(inhib_fail_prob))

mantiretestoldagg = antiretestoldagg %>%
  group_by(subject)%>%
  summarise(mean_inhib = mean(inhib_fail_prob))
####################################
############yng#####################
####################################
#test
mprotestyngagg = protestyngagg %>%
  group_by(subject)%>%
  summarise(mean_inhib = mean(inhib_fail_prob))

mantitestyngagg = antitestyngagg %>%
  group_by(subject)%>%
  summarise(mean_inhib = mean(inhib_fail_prob))
#retest
mproretestyngagg = proretestyngagg %>%
  group_by(subject)%>%
  summarise(mean_inhib = mean(inhib_fail_prob))

mantiretestyngagg = antiretestyngagg %>%
  group_by(subject)%>%
  summarise(mean_inhib = mean(inhib_fail_prob))


#####ICC
#old
rprotrtoldagg <- merge(mprotestoldagg,  mproretestoldagg, by = c("subject"))
riccprotrtoldagg = icc(type = "agreement", ratings = (rprotrtoldagg[, c(2,3)]))
riccprotrtoldagg
 
rantitoldagg <- merge(mantitestoldagg,  mantiretestoldagg, by = c("subject"))
riccantitrtoldagg = icc(type = "agreement", ratings = (rantitoldagg[, c(2,3)]))
riccantitrtoldagg
#yng
rprotrtyngagg <- merge(mprotestyngagg,  mproretestyngagg, by = c("subject"))
riccprotrtyngagg = icc(type = "agreement", ratings = (rprotrtyngagg[, c(2,3)]))
riccprotrtyngagg
 
rantitrtyngagg <- merge(mantitestyngagg,  mantiretestyngagg, by = c("subject"))
riccantitrtyngagg = icc(type = "agreement", ratings = (rantitrtyngagg[, c(2,3)]))
riccantitrtyngagg




