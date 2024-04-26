# Load required libraries
library(ggplot2)

# Load the dataset
data <- read.csv("regression_dataset.csv")

# Perform linear regression
linear_model <- lm(dependent_variable_linear ~ independent_variable, data = data)

# Perform multiple regression
multiple_model <- lm(dependent_variable_multiple ~ independent_var1 + independent_var2, data = data)

# Perform polynomial regression
poly_model <- lm(dependent_variable_poly ~ poly(independent_variable, degree = 2), data = data)

# Evaluate model performance
summary(linear_model)
summary(multiple_model)
summary(poly_model)

# Visualize regression results
ggplot(data, aes(x = independent_variable, y = dependent_variable_linear)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Linear Regression Analysis", x = "Independent Variable", y = "Dependent Variable")

ggplot(data, aes(x = independent_var1, y = dependent_variable_multiple)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Multiple Regression Analysis", x = "Independent Variable 1", y = "Dependent Variable")

ggplot(data, aes(x = independent_variable, y = dependent_variable_poly)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Polynomial Regression Analysis", x = "Independent Variable", y = "Dependent Variable")
