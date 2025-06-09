# 🎯 Customer Segmentation using R (K-Means Clustering)

This project performs customer segmentation using **K-Means Clustering** in R. The goal is to identify different customer groups based on spending behavior or features and visualize the clusters. The solution is deployed as a Shiny web app.

<p align="center">
  <img src="Visual_Images/Screenshot (62).png" />
</p>

## 📌 Features
- 📊 Data preprocessing & scaling  
- 📈 Optimal number of clusters via Elbow method  
- 🔍 K-Means clustering  
- 🧠 Cluster insights with visualizations  
- 💻 Shiny app deployed on the web  

## 🚀 Live App
🔗 [Click to open the deployed app](https://yashbilwal.shinyapps.io/customer_segmentation_using_r_k-means_clustering/)


## 📦 Packages Used
- `ggplot2` – for data visualization  
- `cluster` – clustering algorithms  
- `factoextra` – visualization of clusters  
- `dplyr`, `tidyverse` – data manipulation  
- `shiny` – web app deployment  

## 📊 Screenshots

| Elbow Method                         | Cluster Visualization                     |
|-------------------------------------|-------------------------------------------|
| ![Elbow](Visual_Images/elbow_plot.png) | ![Clusters](Visual_Images/cluster_barplot.png) |

## 🛠️ How to Run Locally
1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/customer-segmentation-r.git
   cd customer-segmentation-r
2. Open customer_segmentation.R or .Rmd in RStudio

3. Run the script or knit the .Rmd to generate HTML report

4. To deploy: use rsconnect::deployApp() if connected to ShinyApps.io
