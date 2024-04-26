# Load necessary libraries
library(ggplot2)

# Simulate Uniform distribution
uniform_data <- runif(1000, min = 0, max = 1)

# Simulate Exponential distribution
exponential_data <- rexp(1000, rate = 0.5)

# Simulate Normal distribution
normal_data <- rnorm(1000, mean = 0, sd = 1)

# Plot density plots
ggplot(data.frame(x = uniform_data), aes(x = x)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs(title = "Uniform Distribution", x = "Value", y = "Density")

ggplot(data.frame(x = exponential_data), aes(x = x)) +
  geom_density(fill = "green", alpha = 0.5) +
  labs(title = "Exponential Distribution", x = "Value", y = "Density")

ggplot(data.frame(x = normal_data), aes(x = x)) +
  geom_density(fill = "orange", alpha = 0.5) +
  labs(title = "Normal Distribution", x = "Value", y = "Density")
