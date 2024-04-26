# Load necessary libraries
library(ggplot2)

# Simulate Bernoulli distribution
bernoulli_data <- rbinom(n = 1000, size = 1, prob = 0.3)


# Simulate Binomial distribution
binomial_data <- rbinom(n = 1000, size = 10, prob = 0.5)

# Simulate Poisson distribution
poisson_data <- rpois(n = 1000, lambda = 3)

# Plot probability mass functions (PMFs)
ggplot(data.frame(x = bernoulli_data), aes(x = x)) + geom_bar(stat = "count", width = 0.5) + labs(title = "Bernoulli Distribution", x = "Outcome (Success/Failure)", y = "Frequency")
ggplot(data.frame(x = binomial_data), aes(x = x)) + geom_bar(stat = "count", width = 0.5) + labs(title = "Binomial Distribution", x = "Number of Successes", y = "Frequency")
ggplot(data.frame(x = poisson_data), aes(x = x)) + geom_bar(stat = "count", width = 0.5) + labs(title = "Poisson Distribution", x = "Number of Events", y = "Frequency")