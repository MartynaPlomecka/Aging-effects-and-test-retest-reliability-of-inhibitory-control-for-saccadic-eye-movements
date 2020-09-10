data = read.csv("~/dev/STAGE2/Data/full_data_for_2_stage.csv")


old = data[data$age==1,]
yng = data[data$age==0,]

write.csv(old, file = '/Users/mplome/dev/STAGE2/Data/old.csv', row.names=FALSE)
write.csv(yng, file = '/Users/mplome/dev/STAGE2/Data/yng.csv', row.names=FALSE)
