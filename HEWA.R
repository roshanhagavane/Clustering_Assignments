
library(readr)

mydata <- read.csv("D:/Study Material/DataScience/Clustering/Assignments/EWA.csv")
View(input)
#input<-read_excel("E:/Excelr Data/R Codes/Clustering/University_Clustering.xlsx")
#input <- read_excel(file.choose())
View(input)
mydata<- input[1:25,c(1,3:8)]
#mydata<- input[,-2]
View(mydata)
#mydata <- input

normalized_data<-scale(mydata[,2:12]) #excluding the university name columnbefore normalizing standardise data
View(normalized_data)

d <- dist(normalized_data, method = "euclidean") # distance matrix
d
# Model Building
fit <- hclust(d, method="complete")
?hclust
plot(fit) # display dendrogram
plot(fit, hang=-1)
groups <- cutree(fit, k=6) # cut tree into 5 clusters
class(groups)
?cutree
rect.hclust(fit, k=6, border="red")
?rect.hclust

membership<-as.matrix(groups)
table(membership)

final <- data.frame(mydata, membership)
#final <- cbind(mydata, membership)
View(final)
##final1 <- final[,c(ncol(final),1:(ncol(final)-1))]

?write.xlsx

#explore setcolorder for repositioning the columns in R
# Also install the package "data.table"
install.packages("data.table")
library(data.table)
setcolorder(final,c("membership"))
View(final)
##write.xlsx(final,file = "Univ_clust.xlsx")

write.csv(final, file="EWA_Final.csv")
setwd("E:/Excelr Data/R Codes/Clustering")
getwd()