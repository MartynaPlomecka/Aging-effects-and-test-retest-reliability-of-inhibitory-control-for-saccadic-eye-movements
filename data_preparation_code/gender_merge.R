library(readxl)
ids <- read_excel("/Users/mplome/dev/STAGE2/Data/TRT_old.xlsx")
ids = ids[!is.na(ids$Subject),]

table <- read.table("/Users/mplome/dev/STAGE2/Data/full_data_agg.csv", header = TRUE, sep=",")

table$gender = NaN
for (i in 1:nrow(ids)) {
  sid = substr(ids[i,]$Subject, 2, 3)
  key = table$sbj_id == sid
  if (any(key)) {
    table[key,]$gender = ids[i,]$Gender
  }
}

unique_ids = unique(table$sbj_id)
m = 0
w = 0
for (uid in unique_ids) {
  key = paste('A', uid, sep="")
  g = ids[ids$Subject == key,]$Gender
  if (length(g) > 0) {
    if (g == 'w') { w=w+1 }
    if (g == 'm') { m=m+1 }
  }
}