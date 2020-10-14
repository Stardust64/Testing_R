library(edgeR)
library(gplots)

raw_count_data <- read.csv("https://raw.githubusercontent.com/Stardust64/G2P_Code_Reproducibility/main/counts_all_samples.csv")

#Column check
names(raw_count_data)

#Row check
raw_count_data[1,]

count_data <- raw_count_data[, 2:17]
rownames(count_data) <- raw_count_data[,1]
count_data[1,]

boxplot(log2(count_data+1),ylab="log2(Counts)",main="Filtered RNA-Seq Counts")

DGE <- DGEList(counts = count_data, genes = row.names(count_data))
keep <-rowSums(cpm(DGE)>=1) >=4
DGE<-DGE[keep,]
DGE <- calcNormFactors(DGE)
DGE 

boxplot(log2(cpm(DGE)+1),ylab="log2(cpm)",main="Filtered RNA-Seq Counts")






