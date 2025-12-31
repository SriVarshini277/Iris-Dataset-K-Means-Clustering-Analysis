#load library
library(ggplot2)
#to plot cluster
install.packages("cluster")
library(cluster)

data <- iris
cat("Dimensions:", dim(data), "\n")
print(head(data))
print(summary(data))

#plot data before clustering to find relationship between petal length & width
ggplot(data, aes(Petal.Length, Petal.Width)) + geom_point(aes(col=Species), size=4)

#k-means clustering (k=3) - using petal & sepal length and width
set.seed(101)
iris_clus <- kmeans(data[,1:4], center=3, nstart=20)
iris_clus

#create table to compare with original data & plot
table(iris_clus$cluster, data$Species)
#calculate accuracy for k=3
accuracy1 <- sum(diag(table(iris_clus$cluster, data$Species))) / nrow(data)
cat("Accuracy for k=3:", round(accuracy1 * 100, 2), "%\n")
clusplot(iris, iris_clus$cluster, color=T, shade=T, labels=0, lines=0)

#k-means clustering (k=5) - using petal & sepal length and width
set.seed(101)
iris_clus <- kmeans(data[,1:4], center=5, nstart=20)
iris_clus
#create table to compare with original data & plot
table(iris_clus$cluster, data$Species)
#calculate accuracy for k=5
accuracy2 <- sum(diag(table(iris_clus$cluster, data$Species))) / nrow(data)
cat("Accuracy for k=5:", round(accuracy2 * 100, 2), "%\n")
clusplot(iris, iris_clus$cluster, color=T, shade=T, labels=0, lines=0)

#k-means clustering (k=7) - using petal & sepal length and width
set.seed(101)
iris_clus <- kmeans(data[,1:4], center=7, nstart=20)
iris_clus
#create table to compare with original data & plot
table(iris_clus$cluster, data$Species)
#calculate accuracy for k=7
accuracy3 <- sum(diag(table(iris_clus$cluster, data$Species))) / nrow(data)
cat("Accuracy for k=7:", round(accuracy3 * 100, 2), "%\n")
clusplot(iris, iris_clus$cluster, color=T, shade=T, labels=0, lines=0)

#k-means clustering (k=3) - using petal length and width only
set.seed(101)
iris_clus <- kmeans(data[,3:4], center=3, nstart=20)
iris_clus
#create table to compare with original data
table(iris_clus$cluster, data$Species)
#calculate accuracy for k=3 (petal only)
confusion_matrix <- table(iris_clus$cluster, data$Species)
accuracy4 <- sum(apply(confusion_matrix, 1, max)) / nrow(data)
cat("Accuracy for k=3 (petal only):", round(accuracy4 * 100, 2), "%\n")
clusplot(iris, iris_clus$cluster, color=T, shade=T, labels=0, lines=0)

#find maximum accuracy
all_accuracies <- c(accuracy1, accuracy2, accuracy3, accuracy4)
accuracy_names <- c("k=3 (all features)", "k=5 (all features)", "k=7 (all features)", "k=3 (petal only)")
max_accuracy <- max(accuracy1, accuracy2, accuracy3, accuracy4)
best_model <- accuracy_names[which.max(all_accuracies)]
cat("\nMaximum accuracy:", round(max_accuracy * 100, 2), "% achieved by", best_model, "\n")
