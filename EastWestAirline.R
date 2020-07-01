EWA <- read.csv("D:/Study Material/DataScience/Clustering/Assignments/EWA.csv")
View(EWA)



km <- kmeans(EWA,4) #kmeans clustering

str(km)


install.packages("animation")
library(animation)

km <- kmeans.ani(EWA, 4)


#elbow curve & k ~ sqrt(n/2) to decide the k value

install.packages("doParallel")
library(doParallel)
registerDoParallel(cores=4)
k <- kselection(EWA, parallel = TRUE, k_threshold = 0.9, max_centers=12)
k

# selecting K for kmeans clustering using kselection
install.packages("kselection")
library(kselection)
data(EWA)
View(EWA)
k <- kselection(EWA, parallel = TRUE, k_threshold = 0.9, max_centers=12)
k
?kselection


EWA <- read.csv("D:/Study Material/DataScience/Clustering/Assignments/EWA.csv")


normalized_data<-scale(EWA)
View(normalized_data)

# model Building
fit <- kmeans(normalized_data, 5) # 5 cluster solution
str(fit)
table(fit$cluster)
final2<- data.frame(EWA, fit$cluster) # append cluster membership
View(final2)
library(data.table)
setcolorder(final2, neworder = c("fit.cluster"))
View(final2)
aggregate(EWA, by=list(fit$cluster), FUN=mean)



# k clustering alternative for large dataset - Clustering Large Applications (Clara)
install.packages("cluster")
library(cluster)
xds <- rbind(cbind(rnorm(5000, 0, 8), rnorm(5000, 0, 8)), cbind(rnorm(5000, 50, 8), rnorm(5000, 50, 8)))
xcl <- clara(xds, 2, sample = 100)
clusplot(xcl)

#Partitioning around medoids
xpm <- pam(xds, 2)
clusplot(xpm)

