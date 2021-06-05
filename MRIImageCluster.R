healthy = read.csv("healthy.csv",header = FALSE)
str(healthy)
healthyMatrix = as.matrix(healthy)
str(healthyMatrix)
image(healthyMatrix,axes = FALSE)
healthyVector = as.vector(healthyMatrix)
str(flowerVector)
# Hierarchial Clustering not possible since very high dimension
# specify the number of clusters
k = 5
set.seed(123)
KMC = kmeans(healthyVector, centers = k, iter.max = 1000)
str(KMC)
KMC$centers
healthyClusters = KMC$cluster
healthyClusters
KMC$centers
# Plot the image with the clusters
dim(healthyClusters) = c(nrow(healthyMatrix), ncol(healthyMatrix))
image(healthyClusters, axes = FALSE, col = rainbow(k))

# using clustering for Predictive Modelling
# apply to test image
tumor = read.csv("tumor.csv", header = FALSE)
str(tumor)
image(tumorMatrix,axes = FALSE)
tumorMatrix = as.matrix(tumor)
tumorVector = as.vector(tumorMatrix)
str(tumorVector)
library(flexclust)
KMC.kcca = as.kcca(KMC,healthyVector)
tumorClusters = predict(KMC.kcca,newdata= tumorVector)
KMC.kcca
# Visualize the cluster
dim(tumorClusters) = c(nrow(tumorMatrix), ncol(tumorMatrix))
image(tumorClusters, axes = FALSE, col = rainbow(k))
