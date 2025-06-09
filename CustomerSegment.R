# ===============================
# Customer Segmentation with Visuals
# ===============================

# 📦 Load required libraries (install if not already installed)
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("factoextra")) install.packages("factoextra")
if (!require("readr")) install.packages("readr")
if (!require("dplyr")) install.packages("dplyr")

library(ggplot2)
library(factoextra)
library(readr)
library(dplyr)

# 📁 Load data
data <- read_csv("Mall_Customers.csv")

# 🧹 Preprocess
data$Gender <- as.numeric(factor(data$Gender, levels = c("Male", "Female")))
data_clean <- data[, c("Gender", "Age", "Annual Income (k$)", "Spending Score (1-100)")]
colnames(data_clean) <- c("Gender", "Age", "Income", "Score")

# ==============================
# 📊 VISUAL 1: Scatter Plot (Income vs Score)
# ==============================
p1 <- ggplot(data_clean, aes(x = Income, y = Score)) +
  geom_point(color = 'red') +
  theme_minimal() +
  labs(title = "Income vs Spending Score", x = "Income (k$)", y = "Score")
print(p1)

# ==============================
# 📈 VISUAL 2: Elbow Method to find optimal k
# ==============================
p2 <- fviz_nbclust(data_clean, kmeans, method = "wss") +
  theme_minimal() +
  labs(title = "Elbow Method")
print(p2)

# ==============================
# 🤖 Apply K-means clustering (let's use k = 5)
# ==============================
set.seed(123)
km <- kmeans(data_clean, centers = 5, nstart = 25)
data_clean$Cluster <- as.factor(km$cluster)

# ==============================
# 🎯 VISUAL 3: Cluster Visualization
# ==============================
p3 <- fviz_cluster(km, data = data_clean[, 1:4], geom = "point", ellipse.type = "norm") +
  labs(title = "Customer Segments (K-Means Clustering)")
print(p3)

# ==============================
# 📊 VISUAL 4: Age Distribution Histogram
# ==============================
p4 <- ggplot(data_clean, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Age Distribution", x = "Age", y = "Count")
print(p4)

# ==============================
# 📊 VISUAL 5: Bar Plot for Cluster Sizes
# ==============================
p5 <- ggplot(data_clean, aes(x = Cluster)) +
  geom_bar(fill = "purple") +
  theme_minimal() +
  labs(title = "Number of Customers per Cluster", x = "Cluster", y = "Count")
print(p5)

# ✅ Optional: Save all visuals to file (uncomment to use)
#ggsave("income_vs_score.png")
#ggsave("elbow_plot.png")
#ggsave("cluster_plot.png")
#ggsave("age_histogram.png")
#ggsave("cluster_barplot.png")

# ✅ Optional: Save clustered data
# write.csv(data_clean, "clustered_customers.csv", row.names = FALSE)

#setwd("D:/Yash/Academics/Projects/Customer Segmentation using R (K-Means Clustering)")  # or wherever your file is


