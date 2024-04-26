# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
data <- read.csv("your_dataset.csv")

# Simple Random Sampling
srs_sample <- data %>% sample_n(size = 100)

# Stratified Sampling
strata <- data %>% group_by(stratum_variable) %>% slice_sample(n = 50, replace = TRUE)
stratified_sample <- ungroup(strata)

# Cluster Sampling
clusters <- unique(data$cluster_variable)
cluster_sample <- data[data$cluster_variable %in% sample(clusters, size = 2), ]

# Parameter Estimates
mean_srs <- mean(srs_sample$variable_of_interest)
mean_stratified <- mean(stratified_sample$variable_of_interest)
mean_cluster <- mean(cluster_sample$variable_of_interest)

# Compare parameter estimates
cat("Mean (Simple Random Sampling):", mean_srs, "\n")
cat("Mean (Stratified Sampling):", mean_stratified, "\n")
cat("Mean (Cluster Sampling):", mean_cluster, "\n")

# Graph 1: Original Dataset Histogram
original_plot <- ggplot(data, aes(x = variable_of_interest)) +
  geom_histogram(bins = 30, fill = "blue", alpha = 0.7) +
  labs(title = "Original Dataset Histogram", x = "Variable of Interest", y = "Count")

# Graph 2: Stratified Sampling Distribution
stratified_plot <- ggplot(stratified_sample, aes(x = variable_of_interest)) +
  geom_histogram(bins = 30, fill = "green", alpha = 0.7) +
  labs(title = "Stratified Sampling Histogram", x = "Variable of Interest", y = "Count")

# Graph 3: Cluster Sampling Distribution
cluster_plot <- ggplot(cluster_sample, aes(x = variable_of_interest)) +
  geom_histogram(bins = 30, fill = "red", alpha = 0.7) +
  labs(title = "Cluster Sampling Histogram", x = "Variable of Interest", y = "Count")

# Plot the graphs
print(original_plot)
print(stratified_plot)
print(cluster_plot)

